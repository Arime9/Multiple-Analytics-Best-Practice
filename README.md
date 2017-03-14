# Multiple-Analytics-Sample
How to send to multiple analytics.

## Rule

Screen

<table>
  <tr>
    <th></th>
    <th>Screen name</th>
  </tr>
  <tr>
    <td>GA</td>
    <td>CategoryPage | CategoryHogePage</td>
  </tr>
  <tr>
    <td>Firebase</td>
    <td>CategoryPage | CategoryHogePage</td>
  </tr>
</table>

Event

<table>
  <tr>
    <th></th>
    <th>Category</th>
    <th>Action</th>
    <th>Label</th>
    <th>Value</th>
  </tr>
  <tr>
    <td>GA</td>
    <td>Category</td>
    <td>Action</td>
    <td>Key:Parameter,...</td>
    <td>NSNumber</td>
  </tr>
  <tr>
    <th></th>
    <th colspan=2>Name</th>
    <th colspan=2>Parameters</th>
  </tr>
  <tr>
    <td>Firebase</td>
    <td colspan=2>Category_Action</td>
    <td colspan=2>{Key: Parameter, ..., Value: NSNumber}</td>
  </tr>
</table>

Event / Action

| Action type | Note                                                      |
|:------------|:----------------------------------------------------------|
| Click       | Click button etc.                                         |
| Comp        | Registration and update, deletion with communication etc. |
| View        | Display of dialog etc.                                    |

## Sample
### Screen log
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

### Event log

Add category on the Top page.

    - (IBAction)addButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategoryTop action:MTActionTopAddClick parameters:@{MTLabelCategory: MTAnimal}];
    }

Remove category on the Top page.

    - (IBAction)removeButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategoryTop action:MTActionTopRemoveClick parameters:@{MTLabelCategory: MTScience}];
    }

Registered on the Detail page.

    - (void)registerDidCompletion {
        [MTAnalytics logWithCategory:MTCategoryDetail action:MTActionDetailRegisterComp parameters:@{MTLabelId: @"1"}];
    }

Unregistered on the Detail page.

    - (void)unregisterDidCompletion {
        [MTAnalytics logWithCategory:MTCategoryDetail action:MTActionDetailUnregisterComp parameters:@{MTLabelId: @"3"}];
    }

Show info on the Setting page.

    - (IBAction)infoButtonDidTouch:(id)sender {
        [MTAnalytics logWithCategory:MTCategorySetting action:MTActionSettingInfoView];
    }

Saved setting on the Setting page.

    - (void)saveDidCompletion {
        [MTAnalytics logWithCategory:MTCategorySetting action:MTActionSettingComp];
    }
