#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#import "iKASveaDarkModeModule.h"

NSString *packageFile;
TVSMButtonViewController *buttonController;
UIImage *theImage;

@implementation iKASveaDarkModeModule

+(long long)buttonStyle {
    return 1;
}

-(id)contentViewController {
    
    buttonController = (TVSMButtonViewController*)[super contentViewController];
    [buttonController setStyle:1];
    packageFile = [[self bundle] pathForResource:@"DarkModeOn" ofType:@"png"];
    theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [buttonController setImage:theImage];
    
    return buttonController;
}


-(void)handleAction {
    
    PBSSystemService *systemService = [NSClassFromString(@"PBSSystemService") sharedInstance];
    
    if (self.contentViewController.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        [systemService setSystemAppearance:0];
        [self changeImageBasedOnSystemAppearance];
    }
    
    else {
     [systemService setSystemAppearance:1];
     [self changeImageBasedOnSystemAppearance];
    }
    
}



-(void)changeImageBasedOnSystemAppearance {
    if (self.contentViewController.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        packageFile = [[self bundle] pathForResource:@"DarkModeOff" ofType:@"png"];
        theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [buttonController setImage:theImage];
    }
    
    else {
        packageFile = [[self bundle] pathForResource:@"DarkModeOn" ofType:@"png"];
        theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [buttonController setImage:theImage];
    }
    
}


-(BOOL)dismissAfterAction {
    return FALSE;
}

@end
