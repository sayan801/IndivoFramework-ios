/*
 INDecimal.h
 IndivoFramework
 
 Created by Pascal Pfiffner on 1/24/12.
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

#import "INDecimal.h"

@implementation INDecimal

@synthesize number;


+ (id)newWithDouble:(double)aDouble
{
	INDecimal *d = [self new];
	d.number = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%.16f", aDouble]];
	
	return d;
}



#pragma mark - Overrides
- (void)setFromNode:(INXMLNode *)node
{
	[super setFromNode:node];
	self.number = [NSDecimalNumber decimalNumberWithString:node.text];
}

- (void)setWithAttr:(NSString *)attrName fromNode:(INXMLNode *)aNode
{
	self.number = [NSDecimalNumber decimalNumberWithString:[aNode attr:attrName]];
}


+ (NSString *)nodeType
{
	return @"xs:decimal";
}

- (BOOL)isNull
{
	return (nil == number);
}

- (NSString *)innerXML
{
	if ([self isNull]) {
		return @"";
	}
	return self.number ? [self.number stringValue] : @"";
}

- (NSString *)attributeValue
{
	return self.number ? [self.number stringValue] : @"";
}

- (NSArray *)flatXMLPartsWithPrefix:(NSString *)prefix
{
	NSString *xmlString = [NSString stringWithFormat:@"<Field name=\"%@\">%@</Field>", (prefix ? prefix : @"number"), (self.number ? self.number : @"")];
	return [NSArray arrayWithObject:xmlString];
}


@end
