# Multiple-Analytics-Sample
How to send to multiple analytics.

## Screen log
TopViewController

    - (void)viewDidAppear:(BOOL)animated {
        [super viewDidAppear:animated];
        
        [MTAnalytics logWithScreen:MTScreenTopPage];
    }

DetailViewController

    - (void)viewDidAppear:(BOOL)animated {
        [super viewDidAppear:animated];
        
        [MTAnalytics logWithScreen:MTScreenDetailPage];
    }

SettingViewController

    - (void)viewDidAppear:(BOOL)animated {
        [super viewDidAppear:animated];
        
        [MTAnalytics logWithScreen:MTScreenSettingPage];
    }

## Event log

Add category on the Top page.

    - (IBAction)addButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategoryTop action:MTActionTopAddClick parameters:@{MTLabelCategory: MTAnimal}];
    }

Remove category on the Top page.

    - (IBAction)removeButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategoryTop action:MTActionTopRemoveClick parameters:@{MTLabelCategory: MTScience}];
    }

Registered on the Detail page.

    - (IBAction)registerButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategoryDetail action:MTActionDetailRegisterComp parameters:@{MTLabelId: @"1"}];
    }

Unregistered on the Detail page.

    - (IBAction)unregisterButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategoryDetail action:MTActionDetailUnregisterComp parameters:@{MTLabelId: @"3"}];
    }

Show info on the Setting page.

    - (IBAction)infoButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategorySetting action:MTActionSettingInfoView];
    }

Saved setting on the Setting page.

    - (IBAction)saveButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategorySetting action:MTActionSettingComp];
    }
