From: Robert Baldyga <r.baldyga@samsung.com>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 09 Apr 2015 11:24:04 +0200
Message-ID: <55264534.4020006@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
 <55264148.8070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55264148.8070903@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Chanwoo,

On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
> Hi Robert,
> 
> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>> Hi Chanwoo,
>>
>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>> Hi Robert,
>>>
> 
> [snip]
> 
>>> But, I have one question about case[3]
>>>
>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>
>>
>> It's because state of single USB cable connection cannot be completely
>> described using single extcon cable. USB cable state has two bits (VBUS
>> and ID), so we need to use two cables for single cable connection. We
>> use following convention:
>> cable "USB" = VBUS
>> cable "USB-HOST" = !ID.
> 
> I think that extcon provider driver have to update the only one cable state
> of either USB or USB-HOST because USB and USB-HOST feature can not be used
> at the same time through one h/w port.
> 
> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
> 

It can. USB OTG allows for that. Moreover device can be host even if
ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
detected cable type is USB host). Devices would need to have complete
information about USB cable connection, because OTG state machine needs
that. As I wrote, current USB cable names are misleading. It would be
better to have "USB-VBUS" and "USB-ID".

>> In fact it would be better to have cables named "USB-VBUS" and "USB-ID"
>> - in this convention it would be more clear.

Thanks,
Robert Baldyga
