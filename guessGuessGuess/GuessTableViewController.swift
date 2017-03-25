//
//  GuessTableViewController.swift
//  guessGuessGuess
//
//  Created by Rebecca Cullimore on 5/28/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import UIKit

class GuessTableViewController: UITableViewController {
    
//    let answer = UInt32(1000)
    var answer = Answer()
    var lastGuessRow:Int = 0
    var guessesSubmitted = [Guess]()
    var guessViews = [GuessTableViewCell]()
    var guesses = [Guess]()
    
    @IBAction func submitGuess(sender: UIButton) {
        print("submitted")
        print("Correct Answer: \(answer.get())")
        sender.hidden = true
        let cell = guessViews[lastGuessRow]
        cell.input1.userInteractionEnabled = false
        cell.input2.userInteractionEnabled = false
        cell.input3.userInteractionEnabled = false
        cell.input4.userInteractionEnabled = false

        let guess = Guess.init(answer: answer.get(), column1: cell.input1.text, column2: cell.input2.text, column3: cell.input3.text, column4: cell.input4.text)
        guesses.append(guess)
        if guess.correct()
        {
            cell.correctNumbers.hidden = true
            cell.correctPlaces.hidden = true
            print("SUCCESS")
            cell.youWin.hidden = false
//            performSegueWithIdentifier("Restart", sender: nil)
        } else {
            cell.correctNumbers.hidden = false
            cell.correctPlaces.hidden = false
            cell.correctNumbers.text = guess.rightNumbers()
            cell.correctPlaces.text = guess.rightPlaces()
            print(guess)
            lastGuessRow += 1
            guessViews[lastGuessRow].hidden = false
        }
        
//        guessViews[lastGuessRow].
//        itemTable.indexPathForCell(
//        var button = sender as! UIButton! {
//            let stackview = sender.superview
//            print(stackview)
//            let contentview = stackview!.superview
//            print(contentview)
//            let superview = contentview!.superview
//            print(superview)
//            let cell = superview as? GuessTableViewCell
//            print(cell!)
//            print(cell!.input4.text)
//        }
//        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! GuessTableViewCell!
//        print(selectedCell.input4.text)
        
//        print(input4.text)
//        print(input1.text)
//        print()
//        let cellIdentifier = "GuessTableViewCell"
//        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! GuessTableViewCell
//        
//        cell.correctNumbers.text = "0 Right Numbers"
//        cell.correctPlaces.text = "0 Right Places"
        
//        cell.rowLabel.text = "Guess \(indexPath.row + 1)"
//        return cell
    }

    // MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.scrollEnabled = true
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
//        let cell = addCell(tableView, indexPath: indexPath)
//        return cell
//    }
//    
//    func addCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "GuessTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
            forIndexPath: indexPath) as! GuessTableViewCell
        print("---")
        print(guesses.count)
        print(indexPath.row)
        print(lastGuessRow)
        if indexPath.row > (guesses.count - 1) {
            cell.input1.text = ""
            cell.input2.text = ""
            cell.input3.text = ""
            cell.input4.text = ""
            cell.correctNumbers.hidden = true
            cell.correctPlaces.hidden = true
            cell.goButton.hidden = false
            cell.input1.userInteractionEnabled = true
            cell.input2.userInteractionEnabled = true
            cell.input3.userInteractionEnabled = true
            cell.input4.userInteractionEnabled = true
        } else if (guesses.count > 0 && indexPath.row <= guesses.count) {// guesses.count > indexPath.row) {
            let guess = guesses[indexPath.row]
            cell.input1.text = "\(guess.column1)"
            cell.input2.text = "\(guess.column2)"
            cell.input3.text = "\(guess.column3)"
            cell.input4.text = "\(guess.column4)"
            cell.correctNumbers.hidden = false
            cell.correctPlaces.hidden = false
            cell.correctNumbers.text = guess.rightNumbers()
            cell.correctPlaces.text = guess.rightPlaces()
            cell.goButton.hidden = true
            cell.input1.userInteractionEnabled = false
            cell.input2.userInteractionEnabled = false
            cell.input3.userInteractionEnabled = false
            cell.input4.userInteractionEnabled = false
        }

        cell.rowLabel.text = "Guess \(indexPath.row + 1)"
        
        if (indexPath.row > guesses.count) {
            cell.hidden = true
        } else {
            cell.hidden = false
        }
        guessViews.append(cell)
        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! GuessTableViewCell!
//        print(selectedCell.input4.text)
//        print("You selected cell #\(indexPath.row)!")
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
