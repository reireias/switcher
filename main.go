package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/url"
	"os/user"

	fuzzyfinder "github.com/ktr0731/go-fuzzyfinder"
)

const baseURL = "https://signin.aws.amazon.com/switchrole"

var colorMap = map[string]string{
	"red":    "F2B0A9",
	"orange": "FBBF93",
	"yellow": "FAD791",
	"green":  "B7CA9D",
	"blue":   "99BCE3",
}

// AWSAccount is struct for json
type AWSAccount struct {
	Name     string `json:"name"`
	RoleName string `json:"roleName"`
	Account  string `json:"account"`
	Color    string `json:"color"`
}

func main() {
	usr, err := user.Current()
	if err != nil {
		log.Fatal(err)
	}

	bytes, err := ioutil.ReadFile(usr.HomeDir + "/.switcherrc.json")
	if err != nil {
		log.Fatal(err)
	}

	var accounts []AWSAccount
	err = json.Unmarshal(bytes, &accounts)
	if err != nil {
		log.Fatal(err)
	}

	index, err := fuzzyfinder.Find(accounts, func(i int) string {
		return accounts[i].Name
	})
	if err != nil {
		log.Fatal(err)
	}

	switchURL, err := url.Parse(baseURL)
	if err != nil {
		log.Fatal(err)
	}
	query := url.Values{}
	query.Add("displayName", accounts[index].Name)
	query.Add("roleName", accounts[index].RoleName)
	query.Add("account", accounts[index].Account)
	color, _ := colorMap[accounts[index].Color]
	query.Add("color", color)
	switchURL.RawQuery = query.Encode()

	fmt.Println(switchURL)
}
