/*
 INDateTime.m
 IndivoFramework
 
 Created by Pascal Pfiffner on 9/26/11.
 Copyright (c) 2011 Children's Hospital Boston
 
 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#import "INDateTime.h"

@implementation INDateTime

@synthesize date;


- (void)setFromNode:(INXMLNode *)node
{
	[super setFromNode:node];
	self.date = [[self class] parseDateFromISOString:node.text];
}

+ (NSString *)nodeType
{
	return @"xs:dateTime";
}

- (BOOL)isNull
{
	return (nil == self.date);
}

- (NSString *)xml
{
	return [NSString stringWithFormat:@"<%@>%@</%@>", self.nodeName, [[self class] isoStringFrom:self.date], self.nodeName];
}



#pragma mark - Date Formatting
static NSDateFormatter *isoDateFormatter = nil;

+ (NSString *)isoStringFrom:(NSDate *)aDate
{
	if (!aDate) {
		return @"0000-00-00T00:00:00Z";
	}
	
	if (!isoDateFormatter) {
		isoDateFormatter = [NSDateFormatter new];
		[isoDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	}
	
	return [isoDateFormatter stringFromDate:aDate];
}

+ (NSDate *)parseDateFromISOString:(NSString *)dateString
{
	if (!isoDateFormatter) {
		isoDateFormatter = [NSDateFormatter new];
		[isoDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
	}
	
	return [isoDateFormatter dateFromString:dateString];
}


@end
