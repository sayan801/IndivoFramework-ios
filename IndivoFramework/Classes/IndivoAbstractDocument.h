/*
 IndivoAbstractDocument.h
 IndivoFramework
 
 Created by Pascal Pfiffner on 10/16/11.
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

#import "INServerObject.h"
#import "INObjects.h"

@class INXMLNode;
@class IndivoRecord;


/**
 *	An abstract superclass to all Indivo Documents as well as Indivo Metadata.
 *	This class can auto-generate its XML from its direct properties, so you don't need to write your own "xml" method
 *	implementation in subclasses unless the auto-generated XML is not the one you want.
 */
@interface IndivoAbstractDocument : INServerObject

@property (nonatomic, readonly, assign) IndivoRecord *record;							///< The owning record
@property (nonatomic, copy) NSString *nameSpace;										///< The namespace
@property (nonatomic, copy) NSString *type;												///< This document's type

- (id)initFromNode:(INXMLNode *)node forRecord:(IndivoRecord *)aRecord;
+ (id)newWithRecord:(IndivoRecord *)aRecord;

+ (NSString *)nameSpace;
+ (NSString *)type;


@end


INDocumentStatus documentStatusFor(NSString *stringStatus);
NSString* stringStatusFor(INDocumentStatus documentStatus);

