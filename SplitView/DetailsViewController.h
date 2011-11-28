//
//  DetailsViewController.h
//  SplitView
//
//  Created by Adar Porat on 3/27/11.
//  Copyright 2011 Kosher Penguin LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGSplitViewController.h"

@interface DetailsViewController : TTViewController <UIPopoverControllerDelegate, MGSplitViewControllerDelegate> {
  MGSplitViewController* _splitController;
  UIPopoverController* popoverController;
}

- (void)setItem:(NSString*)item;

@end
