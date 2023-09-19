import UIKit

var bookseriesarray = ["Ranger's Apprentice", "Eragon", "Dragonback Adventure", "Keeper of the Lost Cities", "Men of Grit"]
var bookAuthorDict:[String:String] = ["Ranger's Apprentice": "John Flanagan", "Eragon": "Christopher Paolini", "Dragonback Adventure": "Timothy Zahn", "Keeper of the Lost Cities": "Shannon Messenger", "Men of Grit": "John Horn"]

bookseriesarray.sort()
var output = "This is the list of book series I have: "
for x in bookseriesarray{
    output += "\(x), "
}

print(output)

var bookAuthor = bookAuthorDict["Eragon"]
if let author = bookAuthor{
    print("Author is", author)
}
