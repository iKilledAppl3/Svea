#import <TVSystemMenuUI/TVSMModuleContentViewControllerDelegate.h>
#import <TVSystemMenuUI/TVSMModuleContentViewController.h>
#import <TVSystemMenuUI/TVSMActionModule.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@interface iKASveaDarkModeModule : TVSMActionModule
+(long long)buttonStyle;
-(id)contentViewController;
-(void)handleAction;
-(BOOL)dismissAfterAction;
-(void)changeImageBasedOnSystemAppearance;
@end

@interface PBSSystemService : NSObject
+(id)sharedInstance;
-(void)setSystemAppearance:(long long)arg1 ;
@end
