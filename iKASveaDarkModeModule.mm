#import "iKASveaDarkModeModule.h"

@implementation iKASveaDarkModeModule

+(long long)buttonStyle {
    return 1;
}

-(id)contentViewController {
    
    self.buttonController = (TVSMButtonViewController*)[super contentViewController];
    [self.buttonController setStyle:1];
    [self defaultImage];
    return self.buttonController;
}


-(void)handleAction {
    
   systemService = [NSClassFromString(@"PBSSystemService") sharedInstance];
    
    if (self.contentViewController.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        [systemService setSystemAppearance:0];
        [self changeImageBasedOnSystemAppearance];
    }
    
    else {
     [systemService setSystemAppearance:1];
     [self changeImageBasedOnSystemAppearance];
    }
    
}


-(void)defaultImage {
        packageFile = [[self bundle] pathForResource:@"DarkModeOn" ofType:@"png"];
        theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.buttonController setImage:theImage];
}


-(void)changeImageBasedOnSystemAppearance {
    if (self.contentViewController.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        packageFile = [[self bundle] pathForResource:@"DarkModeOff" ofType:@"png"];
        theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.buttonController setImage:theImage];

        if (@available(tvOS 14.0, *)) {
            [self.buttonController setToggledOn:FALSE];
        }
    }
    
    else {
        packageFile = [[self bundle] pathForResource:@"DarkModeOn" ofType:@"png"];
        theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.buttonController setImage:theImage];

        if (@available(tvOS 14.0, *)) {
            [self.buttonController setToggledOn:TRUE];
            [self.buttonController setSymbolTintColor:[UIColor blackColor]];
        }
    }
    
}


-(BOOL)dismissAfterAction {
    return FALSE;
}

@end
