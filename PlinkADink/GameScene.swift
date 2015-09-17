//
//  GameScene.swift
//  PlinkADink
//
//  Created by Can on 9/15/15.
//  Copyright (c) 2015 Can. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var discs = [SKSpriteNode]()
    var remainingLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    let numberOfDiscs = 5
    let postWidth = CGFloat(10)
    
//    let discCategory : UInt32 = 1 << 0
//    let pegCategory : UInt32 = 1 << 1
    
    override func didMoveToView(view: SKView) {
//        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 45;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
        
        view.showsPhysics = true
        
        makeTopLabels()
        makeWallAndGround()
        makePosts()
        makeGoals()
        makePegs(8, numberOfRows: 10, pegRadius: 5, rowSpacing: 40, yStart: 120)
    }
    
    func makeTopLabels() {
        self.remainingLabel = SKLabelNode(text: "Remaining: \(numberOfDiscs)")
        self.remainingLabel.fontColor = UIColor.blackColor()
        self.remainingLabel.fontSize = 20
        self.remainingLabel.position = CGPoint(x: self.frame.size.width * 0.25, y: self.frame.size.height - 20.0)
 
        self.addChild(remainingLabel)
        
        self.scoreLabel = SKLabelNode(text: "Score: 0")
        self.scoreLabel.fontColor = UIColor.blackColor()
        self.scoreLabel.fontSize = 20
        self.scoreLabel.position = CGPoint(x: self.frame.size.width * 0.75, y: self.frame.size.height - 20.0)
        
        self.addChild(scoreLabel)

    }
    
    func updateLabels() {
        self.remainingLabel.text = "Remaining: \(numberOfDiscs - self.discs.count)"
    }
    
    func makeWallAndGround() {
        let ground = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: self.frame.size.width, height: 20))
        ground.position = CGPoint(x: self.frame.size.width / 2, y: -10)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.frame.size.width, height: 20))
        ground.physicsBody?.dynamic = false
        
        self.addChild(ground)
        
        let leftWall = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 20, height: self.frame.size.height))
        leftWall.position = CGPoint(x: -10, y: self.frame.size.height / 2)
        leftWall.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 20, height: self.frame.size.height))
        leftWall.physicsBody?.dynamic = false
        
        self.addChild(leftWall)
        
        let rightWall = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 20, height: self.frame.size.height))
        rightWall.position = CGPoint(x:  self.frame.size.width + 10, y: self.frame.size.height / 2)
        rightWall.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 20, height: self.frame.size.height))
        rightWall.physicsBody?.dynamic = false
        
        self.addChild(rightWall)
    }
    
    func makePegs(numberOfPegsInRow :Int, numberOfRows :Int, pegRadius :CGFloat, rowSpacing :CGFloat, yStart :CGFloat) {
        
        for rowNumber in 0...(numberOfRows - 1) {
        
            let pegSpacing = (self.frame.size.width - (CGFloat(numberOfPegsInRow) * pegRadius * 2)) / CGFloat(numberOfPegsInRow + 1)
            
            var extraSpacing = CGFloat(0)
            if rowNumber % 2 == 1 {
                extraSpacing = pegSpacing / 2
            }
            
            for pegNumber in 0...(numberOfPegsInRow - 1) {
                let peg = SKSpriteNode(color: UIColor.blueColor(), size: CGSize(width: pegRadius * 2, height: pegRadius * 2))
                let xPosition : CGFloat = extraSpacing + pegSpacing * 0.75 + pegRadius + (pegRadius * 2 + pegSpacing) * CGFloat(pegNumber)
                let yPosition : CGFloat = yStart + (CGFloat(rowNumber) * rowSpacing)
                peg.position = CGPoint(x: xPosition, y: yPosition)
                peg.physicsBody = SKPhysicsBody(circleOfRadius: pegRadius)
                peg.physicsBody?.dynamic = false
                
                self.addChild(peg)
            }
        }
        
    }
    
    func makePosts() {

        let postHeight = CGFloat(80)
        
        let post1 = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: self.postWidth, height: postHeight))
        post1.position = CGPoint(x: self.frame.size.width * 0.25, y: postHeight / 2)
        post1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.postWidth, height: postHeight))
        post1.physicsBody?.dynamic = false
        
        self.addChild(post1)
        
        let post2 = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: self.postWidth, height: postHeight))
        post2.position = CGPoint(x: self.frame.size.width * 0.45, y: postHeight / 2)
        post2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.postWidth, height: postHeight))
        post2.physicsBody?.dynamic = false
        
        self.addChild(post2)
        
        let post3 = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: self.postWidth, height: postHeight))
        post3.position = CGPoint(x: self.frame.size.width * 0.55, y: postHeight / 2)
        post3.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.postWidth, height: postHeight))
        post3.physicsBody?.dynamic = false
        
        self.addChild(post3)
        
        let post4 = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: self.postWidth, height: postHeight))
        post4.position = CGPoint(x: self.frame.size.width * 0.75, y: postHeight / 2)
        post4.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: self.postWidth, height: postHeight))
        post4.physicsBody?.dynamic = false
        
        self.addChild(post4)
    }
    
    func makeGoals() {
        let goalHeight = CGFloat(80)
        
        let bigGoalWidth = self.frame.size.width * 0.25 - self.postWidth / 2
        let mediumGoalWidth = self.frame.size.width * 0.2 - self.postWidth
        let smallGoalWidth = self.frame.size.width * 0.1 - self.postWidth
        
        let yPosition = goalHeight / 2
        
        let goal1 = SKSpriteNode(color: UIColor.purpleColor(), size: CGSize(width: bigGoalWidth, height: goalHeight))
        let xPosition1 = bigGoalWidth / 2
        goal1.position = CGPoint(x: xPosition1, y: yPosition)
        goal1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: bigGoalWidth, height: goalHeight))
        goal1.physicsBody?.dynamic = false
        
        self.addChild(goal1)
        
        let goal2 = SKSpriteNode(color: UIColor.purpleColor(), size: CGSize(width: mediumGoalWidth, height: goalHeight))
        let xPosition2 = bigGoalWidth + self.postWidth + mediumGoalWidth / 2
        goal2.position = CGPoint(x: xPosition2, y: yPosition)
        goal2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: mediumGoalWidth, height: goalHeight))
        goal2.physicsBody?.dynamic = false
        
        self.addChild(goal2)
        
        let goal3 = SKSpriteNode(color: UIColor.purpleColor(), size: CGSize(width: smallGoalWidth, height: goalHeight))
        let xPosition3 = bigGoalWidth + self.postWidth * 2 + mediumGoalWidth + smallGoalWidth / 2
        goal3.position = CGPoint(x: xPosition3, y: yPosition)
        goal3.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: smallGoalWidth, height: goalHeight))
        goal3.physicsBody?.dynamic = false
        
        self.addChild(goal3)
        
        let goal4 = SKSpriteNode(color: UIColor.purpleColor(), size: CGSize(width: mediumGoalWidth, height: goalHeight))
        let xPosition4 = bigGoalWidth + self.postWidth * 3 + mediumGoalWidth + smallGoalWidth + mediumGoalWidth / 2
        goal4.position = CGPoint(x: xPosition4, y: yPosition)
        goal4.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: mediumGoalWidth, height: goalHeight))
        goal4.physicsBody?.dynamic = false
        
        self.addChild(goal4)
        
        let goal5 = SKSpriteNode(color: UIColor.purpleColor(), size: CGSize(width: bigGoalWidth, height: goalHeight))
        let xPosition5 = bigGoalWidth + self.postWidth * 4 + mediumGoalWidth * 2 + smallGoalWidth + bigGoalWidth / 2
        goal5.position = CGPoint(x: xPosition5, y: yPosition)
        goal5.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: bigGoalWidth, height: goalHeight))
        goal5.physicsBody?.dynamic = false
        
        self.addChild(goal5)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
            if self.discs.count >= numberOfDiscs {
                self.removeChildrenInArray(discs)
                self.discs = []
            }
            else {
                let disc = SKSpriteNode(imageNamed:"Spaceship")
                
                disc.xScale = 0.05
                disc.yScale = 0.05
                
                disc.position = touch.locationInNode(self)
                
                disc.physicsBody = SKPhysicsBody(circleOfRadius: disc.size.height / 2)
                
                self.addChild(disc)
                
                self.discs.append(disc)
            }
            updateLabels()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
