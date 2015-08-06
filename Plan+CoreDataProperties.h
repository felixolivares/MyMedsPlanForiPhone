//
//  Plan+CoreDataProperties.h
//  
//
//  Created by Felix Olivares on 8/6/15.
//
//
//  Delete this file and regenerate it using "Create NSManagedObject Subclass…"
//  to keep your implementation up to date with your model.
//

#import "Plan.h"

NS_ASSUME_NONNULL_BEGIN

@interface Plan (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *medicineName;
@property (nullable, nonatomic, retain) NSString *medicineKind;
@property (nullable, nonatomic, retain) NSString *additionalInfo;
@property (nullable, nonatomic, retain) NSString *otherUser;
@property (nullable, nonatomic, retain) NSNumber *periodicity;
@property (nullable, nonatomic, retain) NSNumber *unitsPerDose;

@end

NS_ASSUME_NONNULL_END
