//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation MainScene {
    CCButton *parksideBad, *parksideMedium, *parksideGood, *cafe84Bad;
    CCButton *cafe84Medium, *cafe84Good, *evkBad, *evkMedium, *evkGood;
    CCNodeColor *parksideBar, *cafe84Bar, *evkBar;
    NSNumber *parksideStatus, *cafe84Status, *evkStatus;
    float time;
}

- (void) didLoadFromCCB {
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasOpened"]) {
//        [self tutorials];
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasPlayed"];
//    } else {
//        [self addBetPopup];
//    }
//    parksideStatus = cafe84Status = evkStatus = @1;
//    status[@"parkside"] = parksideStatus;
//    status[@"cafe84"] = cafe84Status;
//    status[@"evk"] = evkStatus;
//    [status saveInBackground];
    time = 0;
    PFQuery *query = [PFQuery queryWithClassName:@"status"];
    [query getObjectInBackgroundWithId:@"4FZJk3iZYo" block:^(PFObject *status, NSError *error) {
        parksideStatus = status[@"parkside"];
        cafe84Status = status[@"cafe84"];
        evkStatus = status[@"evk"];
        // Do something with the returned PFObject in the gameScore variable.
    }];
}

- (void) parksideBad {
    if ([parksideStatus floatValue] > 0.7) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*0.7];
    } else if ([parksideStatus floatValue] > 0.3) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*0.8];
    } else {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*0.9];
    }
    PFQuery *query = [PFQuery queryWithClassName:@"status"];
    [query getObjectInBackgroundWithId:@"4FZJk3iZYo" block:^(PFObject *status, NSError *error) {
        status[@"parkside"] = parksideStatus;
        [status saveInBackground];
        // Do something with the returned PFObject in the gameScore variable.
    }];
}

- (void) parksideMedium {
    if ([parksideStatus floatValue] > 0.7) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*0.9];
    } else if ([parksideStatus floatValue] > 0.5) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*0.95];
    } else if ([parksideStatus floatValue] > 0.3) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*1.05];
    } else {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*1.1];
    }
    PFQuery *query = [PFQuery queryWithClassName:@"status"];
    [query getObjectInBackgroundWithId:@"4FZJk3iZYo" block:^(PFObject *status, NSError *error) {
        status[@"parkside"] = parksideStatus;
        [status saveInBackground];
        // Do something with the returned PFObject in the gameScore variable.
    }];
}

- (void) parksideGood {
    if ([parksideStatus floatValue] > 0.7) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*1.1];
        if ([parksideStatus floatValue] > 1) {
            parksideStatus = [NSNumber numberWithFloat:1];
        }
    } else if ([parksideStatus floatValue] > 0.3) {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*1.2];
    } else {
        parksideStatus = [NSNumber numberWithFloat:[parksideStatus floatValue]*1.3];
    }
    PFQuery *query = [PFQuery queryWithClassName:@"status"];
    [query getObjectInBackgroundWithId:@"4FZJk3iZYo" block:^(PFObject *status, NSError *error) {
        status[@"parkside"] = parksideStatus;
        [status saveInBackground];
        // Do something with the returned PFObject in the gameScore variable.
    }];
}

- (void) cafe84Bad {
    
}

- (void) cafe84Medium {
    
}

- (void) cafe84Good {
    
}

- (void) evkBad {
    
}

- (void) evkMedium {
    
}

- (void) evkGood {
    
}

- (void) statusBarChange:(CCNodeColor*)bar forTheStatusNumber:(NSNumber*)status {
    bar.scaleX = [status floatValue];
    if ([status floatValue] > 0.7) {
        [bar setColor:[CCColor colorWithRed:0 green:1 blue:0]];
    } else if ([status floatValue] > 0.3) {
        [bar setColor:[CCColor colorWithRed:1 green:1 blue:0]];
    } else {
        [bar setColor:[CCColor colorWithRed:1 green:0 blue:0]];
    }
}

- (void) update:(CCTime)delta {
    NSLog(@"%f", delta);
    time += delta;
    if (time > 10) {
        PFQuery *query = [PFQuery queryWithClassName:@"status"];
        [query getObjectInBackgroundWithId:@"4FZJk3iZYo" block:^(PFObject *status, NSError *error) {
            parksideStatus = status[@"parkside"];
            cafe84Status = status[@"cafe84"];
            evkStatus = status[@"evk"];
            // Do something with the returned PFObject in the gameScore variable.
        }];
        time = 0;
    }
    [self statusBarChange:parksideBar forTheStatusNumber:parksideStatus];
    [self statusBarChange:cafe84Bar forTheStatusNumber:cafe84Status];
    [self statusBarChange:evkBar forTheStatusNumber:evkStatus];
}

@end
