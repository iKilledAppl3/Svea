@import UIKit;
#import <TVSystemMenuUI/TVSMModuleContentViewControllerDelegate.h>
#import <TVSystemMenuUI/TVSMModuleContentViewController.h>
#import <TVSystemMenuUI/TVSMActionModule.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#import <objc/runtime.h>


@interface PBSSystemService : NSObject
+(id)sharedInstance;
-(void)setSystemAppearance:(long long)arg1 ;
@end

//14+ code (thanks nitoTV)
@interface TVSMButtonViewController (science)
@property (assign,nonatomic) BOOL toggledOn API_AVAILABLE(tvos(14.0));
@property (nonatomic,copy) UIColor *symbolTintColor API_AVAILABLE(tvos(14.0));
-(BOOL)toggledOn;
@end


@interface iKASveaDarkModeModule : TVSMActionModule {
	NSString *packageFile;
	TVSMButtonViewController *_buttonController;
	UIImage *theImage;
	PBSSystemService *systemService;
}
@property (nonatomic, retain) TVSMButtonViewController *buttonController;
+(long long)buttonStyle;
-(id)contentViewController;
-(void)handleAction;
-(BOOL)dismissAfterAction;
-(void)changeImageBasedOnSystemAppearance;
@end
