//
//  main.swift
//  Wordplay
//

import Foundation

let wordplayArray = [String]()
var sowpods = [String]()

// HELPER FUNCTIONS

for word in wordplayArray {
    let newWord = word.capitalized
    sowpods.append(newWord)
}

func containsAllVowels(word: String) -> Bool {
    if word.contains("A"),
       word.contains("E"),
       word.contains("I"),
       word.contains("O"),
       word.contains("U") {
        return true
    }
    return false
}

func isVowel(character: Character) -> Bool {
    if character == Character("A") ||
       character == Character("E") ||
       character == Character("I") ||
       character == Character("O") ||
       character == Character("U") {
        return true
    }
    return false
}

func containsNoVowels(word: String) -> Bool {
        if !word.contains("A"),
           !word.contains("E"),
           !word.contains("I"),
           !word.contains("O"),
           !word.contains("U"),
           !word.contains("Y") {
            return true
        }
    return false
}

func isPalindrome(word: String) -> Bool {
    var i = 0
    var j = word.count

    var wordArray = Array(word.capitalized)

    while i < j {
        if wordArray[i] == wordArray[j] {
            i += 1
            j -= 1
        } else {
            return false
        }
    }
    return true
}









//Wat are all of the words containing UU?
func findUUWords() -> [String] {
    var array = [String]()
//    var uDict = ["U": 0]
    
    for word in sowpods {
        if word.contains("UU") {
        array.append(word)
        }
        
//        for (_, char) in word.enumerated() {
//            if uDict["U"] == 2 { array.append(word) break }
//            if char == "U" { uDict["U"]! += 1}
//            if char != "U" { uDict["U"] = 0 }
//        }
        
    }
    
    return array
}

//What are all of the words containing an X and a Y and a Z?
func findXYZWOrds() -> [String] {
    var array = [String]()
    var dict = ["X": 0, "Y": 0, "Z": 0]
    
    for word in sowpods {
//        if word.contains("X"), word.contains("Y"), word.contains("Z") {
//            array.append(word)
//        }
        
        for (_, char) in word.enumerated() {
            if char == "X" || char == "Y" || char == "Z" {
                dict[String(char)]! += 1
            }
        }

        if dict["X"]! > 0, dict["Y"]! > 0, dict["Z"]! > 0 { array.append(word) }
        
    }
    return array
}

//What are all of the words containing a Q but not a U?
func findQNotUWords() -> [String] {
    var array = [String]()
    for word in sowpods {
        if word.contains("Q"), !word.contains("U") {
            array.append(word)
        }
    }
    return array
}

//What are all of the words that contain the word CAT and are exactly 5 letters long?
func find5LetterCATWords() -> [String] {
    var array = [String]()
    for word in sowpods {
        if word.count == 5, word.contains("CAT") {
            array.append(word)
        }
    }
    return array
}

//What are all of the words that have no E or A and are at least 15 letters long?
func find15LetterNoEAWords() -> [String] {
    var array = [String]()
    for word in sowpods {
        if word.count >= 15, !word.contains("E"), !word.contains("A") {
            array.append(word)
        }
    }
    return array
}

//What are all of the words that have a B and an X and are less than 5 letters long?
func findBXWordsUnder5() -> [String] {
    var array = [String]()
    for word in sowpods {
        if word.count < 5, word.contains("B"), word.contains("X") {
            array.append(word)
        }
    }
    return array
}

//What are all of the words that both start and end with a Y?
func findWordsThatStartAndEndWithY() -> [String] {
    var array = [String]()
    for word in sowpods {
        if word.hasPrefix("Y"), word.hasSuffix("Y") {
            array.append(word)
        }
    }
    return array
}

//What are all of the words with no vowel and not even a Y?
func findNoVowelWords() -> [String] {
    var array = [String]()
    for word in sowpods {
        if containsNoVowels(word: word), !word.contains("Y") {
            array.append(word)
        }
    }
    return array
}

//What are all of the words that have all 5 vowels, in any order?
func findWordsWithAllVowels() -> [String] {
    var array = [String]()
    for word in sowpods {
        if containsNoVowels(word: word) {
            array.append(word)
        }
    }
    return array
}

//What are all of the words that have all 5 vowels, in alphabetical order?
func findWordsWithVowelsInOrder() -> [String] {
    var array = [String]()
    var finalArray = [String]()
    
    for word in sowpods {
        if containsAllVowels(word: word) { array.append(word) }
    }

    for word in array {
        var vowels = [Character]()
        for char in word {
            if isVowel(character: char) { vowels.append(char) }
        }
        
        let sortedVowels = vowels.sorted()
        if sortedVowels == vowels { finalArray.append(word) }
        
    }
    
    return finalArray
}

//How many words contain the substring "TYPE”?
func findTYPEWords() -> [String] {
    var array = [String]()
    
    for word in sowpods {
        if word.contains("TYPE") {
            array.append(word)
        }
    }
    return array
}

//Create and print an array containing all of the words that end in "GHTLY"
func findsWordsEndingInGHTLY() -> [String] {
    var array = [String]()
    
    for word in sowpods {
        if word.hasSuffix("GHTLY") {
            array.append(word)
        }
    }
    return array
}

//What is the shortest word that contains all 5 vowels?
func findShortestWordWithAllVowels() -> String {
    var array = [String]()
    var i = 0
    var shortest = ""
    
    for word in sowpods {
        if containsAllVowels(word: word) {
            array.append(word)
        }
    }

    while i < array.count {
        if shortest == "" { shortest = array[i] }
        if array[i].count < shortest.count {
            shortest = array[i]
        }
        i += 1
    }
    
    return shortest
}

//What is the longest word that contains no vowels?
func findLongestWordWithNoVowels() -> String {
    var longest = ""
    
    
    for word in sowpods {
        if containsNoVowels(word: word) {
            if longest == "" { longest = word }
            if word.count > longest.count { longest = word }
        }
    }

    return longest
}

//Which of the letters Q, X, and Z is the least common?
func findLeastCommonQXZ() -> String {
    var dict = ["Q" : 0, "X" : 0, "Z" : 0]
    
    for word in sowpods {
        
        for char in word {
            if char == "Q" || char == "X" || char == "Z" {
                dict[String(char)]! += 1
            }
        }
        
    }
    let min = dict.min { $0.value < $1.value }
    return min!.key
}

//What is the longest palindrome?
func findLongestPalindrome() -> String {
    var longest = ""
    
    for word in sowpods {
        if isPalindrome(word: word) {
            if longest == "" { longest = word }
            if word.count > longest.count { longest = word }
        }
    }
    
    return longest
}

//What are all of the letters that never appear
//consecutively in an English word? For example,
//we know that “U” isn’t an answer, because of
// the word VACUUM, and we know that “A” isn’t an answer,
// because of “AARDVARK”, but which letters never appear consecutively?

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func findNonConsecutiveLetters() -> [Character] {
    var array = [Character]()
    var comparisonArray = [Character]()
    var i = 0
    
    for word in sowpods {
        while i < word.count {
            if word[i] != word[i + 1] {
                array.append(word[i])
            }

            if word[i] == word[i + 1] {
                comparisonArray.append(word[i])
            }
            i += 1
        }
    }

    let result = array.filter { comparisonArray.contains($0) }
    return result
}
