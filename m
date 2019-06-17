From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 00/28] drivers: Consolidate device lookup helpers
Date: Mon, 17 Jun 2019 11:07:29 +0100
Message-ID: <c6813d08-b70b-f153-a651-94d1bcaa5522@arm.com>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <3aa6d42db4b64c625b8461ee7d442f3f1830e8c3.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3aa6d42db4b64c625b8461ee7d442f3f1830e8c3.camel@perches.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: joe@perches.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org
List-Id: devicetree@vger.kernel.org

Cc: Greg, Rafael

Hi Joe,

On 14/06/2019 19:24, Joe Perches wrote:
> (dropping the very long cc list just cc'ing LKML and devicetree)
> 
> On Fri, 2019-06-14 at 18:53 +0100, Suzuki K Poulose wrote:
>> We have device iterators to find a particular device matching a criteria
>> for a given bus/class/driver. i.e, {bus,class,driver}_find_device() APIs.
>> The matching criteria is a function pointer for the APIs. Often the lookup
>> is based on a generic property of a device (e.g, name, fwnode, of node pointer
>> or device type) rather than a driver specific information. However, each driver
>> writes up its own "match" function, spilling the similar match functions all
>> over the driver subsystems.
>>
>> Additionally the prototype for the "match" functions accepted by the above APIs
>> have a minute difference which prevents us otherwise sharing the match functions.
>> i.e,
>> 	int (*match)(struct device *dev, void *data) for {bus/driver}_find_device()
>> 	  vs
>> 	int (*match)(struct device *dev, const void *) for class_find_device()
>>
> 
> As you are doing treewide conversions, perhaps using
> 
> 	bool (*match)(...)
> 
> is a more sensible api.

I agree that it is more suitable api. However, that would need much more
conversions for the existing "class_find_device()" , which are not touched by
the series and would make this series even more bigger. With that said, I
am fine with implementing the suggestion if Greg/Rafael thinks that is fine.

>> Changes since v1:
>>   - Drop start parameter for *_find_device_by_devt().
>>   - Fix build warnings for s390
>>   - Add *_find_device_by_acpi_dev() wrappers.
>>   - Group wrappers and the consumers into single patch, reducing
>>     the total patches to 28 from 57. (Rafael).
>>   - Better description for acpi cleanup patch.
>>   - Added tags from v1.
> 
> Below this is a _very_ long list of cc:'s.

Unfortunately, yes.

> If the list is generated using scripts/get_maintainer.pl
> perhaps it is more sensible to add --nogit --nogit-fallback

Yes, and trimmed manually a bit to remove the "commit-signers".
I have tried to keep only the maintainers/reviewers/supporters.
Thanks for the option, I will give that a try.

> to its arguments to cc actual maintainers and avoid people
> that have submitted cleanup style patches to various files.
> 

Cheers
Suzuki
