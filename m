From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 16 Apr 2015 16:00:39 +0900
Message-ID: <552F5E17.5020902@samsung.com>
References: <55278DD3.3020409@samsung.com> <55279550.1060609@samsung.com>
 <552CE579.6060702@ti.com> <552CE5C0.3010207@ti.com>
 <552CEC97.1050205@samsung.com> <552CEE42.1050907@ti.com>
 <552CFA1E.5070400@samsung.com> <20150415032734.GA29095@shlinux2>
 <552E1862.6090709@ti.com> <552E2EBF.5090906@samsung.com>
 <20150416015922.GB22269@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20150416015922.GB22269@shlinux2>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>, "Balbi, Felipe" <balbi@ti.com>, "ABRAHAM, KISHON VIJAY" <kishon@ti.com>
Cc: Roger Quadros <rogerq@ti.com>, Robert Baldyga <r.baldyga@samsung.com>, myungjoo.ham@samsung.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 04/16/2015 10:59 AM, Peter Chen wrote:
> On Wed, Apr 15, 2015 at 06:26:23PM +0900, Chanwoo Choi wrote:
>> Hi Roger and Peter,
>>
>> On 04/15/2015 04:50 PM, Roger Quadros wrote:
>>> On 15/04/15 06:27, Peter Chen wrote:
>>>> On Tue, Apr 14, 2015 at 08:29:34PM +0900, Chanwoo Choi wrote:
>>>>> On 04/14/2015 07:38 PM, Roger Quadros wrote:
>>>>>> On 14/04/15 13:31, Chanwoo Choi wrote:
>>>>>>> On 04/14/2015 07:02 PM, Roger Quadros wrote:
>>>>>>>> Fixed Kishon's id.
>>>>>>>>
>>>>>>>> On 14/04/15 13:01, Roger Quadros wrote:
>>>>>>>>> On 10/04/15 12:18, Chanwoo Choi wrote:
>>>>>>>>>> On 04/10/2015 05:46 PM, Robert Baldyga wrote:
>>>>>>>>>>> On 04/10/2015 10:10 AM, Chanwoo Choi wrote:
>>>>>>>>>>>> On 04/10/2015 04:45 PM, Robert Baldyga wrote:
>>>>>>>>>>>>> On 04/10/2015 09:17 AM, Chanwoo Choi wrote:
>>>>>>>>>>>>>> Hi Robert,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 04/09/2015 06:24 PM, Robert Baldyga wrote:
>>>>>>>>>>>>>>> Hi Chanwoo,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
>>>>>>>>>>>>>>>> Hi Robert,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>>>>>>>>>>>>>>>>> Hi Chanwoo,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>>>>>>>>>>>>>>>>> Hi Robert,
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> [snip]
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> But, I have one question about case[3]
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>>>>>>>>>>>>>>>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> It's because state of single USB cable connection cannot be completely
>>>>>>>>>>>>>>>>> described using single extcon cable. USB cable state has two bits (VBUS
>>>>>>>>>>>>>>>>> and ID), so we need to use two cables for single cable connection. We
>>>>>>>>>>>>>>>>> use following convention:
>>>>>>>>>>>>>>>>> cable "USB" = VBUS
>>>>>>>>>>>>>>>>> cable "USB-HOST" = !ID.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I think that extcon provider driver have to update the only one cable state
>>>>>>>>>>>>>>>> of either USB or USB-HOST because USB and USB-HOST feature can not be used
>>>>>>>>>>>>>>>> at the same time through one h/w port.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
>>>>>>>>>>>>>>>> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> It can. USB OTG allows for that. Moreover device can be host even if
>>>>>>>>>>>>>>> ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
>>>>>>>>>>>>>>> detected cable type is USB host). Devices would need to have complete
>>>>>>>>>>>>>>> information about USB cable connection, because OTG state machine needs
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> As I knew, USB OTG port don't send the attached cable of both USB and USB-HOST
>>>>>>>>>>>>>> at the same time. The case3 in your patch update two cable state about one h/w port.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> It's because simple "USB" or "USB-HOST" means nothing for USB OTG
>>>>>>>>>>>>> machine. It needs to know exact VBUS and ID states, which cannot be
>>>>>>>>>>>>> concluded basing on cable type only. That's why I have used "USB-HOST"
>>>>>>>>>>>>> name together with "USB" to pass additional information about USB cable
>>>>>>>>>>>>> connection.
>>>>>>>>>>>>
>>>>>>>>>>>> I think this method is not proper to support this case.
>>>>>>>>>>>> It may cause the confusion about other case using USB/USB-HOST cable state
>>>>>>>>>>>> except of you commented case.
>>>>>>>>>>>
>>>>>>>>>>> That's why I finally proposed to use "USB-ID" and "USB-VBUS" in parallel
>>>>>>>>>>> with old names. It seems to be simpler solution than adding new
>>>>>>>>>>> mechanism notifying about VBUS and ID states changes.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> As I commented on previous reply, I don't agree to use 'USB-ID' and 'USB-VBUS'.
>>>>>>>>>> If we add new strange 'USB-ID' and 'USB-VBUS' name, we would add non-general cable
>>>>>>>>>> name continuoulsy.
>>>>>>>>>>
>>>>>>>>>> I think that extcon core provide the helper API to get the value of VBUS.
>>>>>>>>>> But I need to consider it.
>>>>>>>>>
>>>>>>>>> Now it is starting to look like existing extcon states are not suitable for USB/PHY drivers to deliver
>>>>>>>>> VBUS and ID information reliably.
>>>>>>>>> This is because based on your comments the "USB" and "USB-HOST" states look like some fuzzy states
>>>>>>>>> and have no direct correspondence with "VBUS" and "ID". The fact that they can't become
>>>>>>>>> attached simultaneously makes me conclude that "USB" and "USB-HOST" cable states are really 
>>>>>>>>> capturing only the ID pin state.
>>>>>>>>>
>>>>>>>>> I can suggest the following options
>>>>>>>>> a) let "USB" and "USB-HOST" only indicate ID pin status. Add a new cable state for "VBUS" notification.
>>>>>>>>> Maybe call it "USB-POWER" or something.
>>>>>>>
>>>>>>> We must discuss it before using the new cable name
>>>>>>> such as "USB-POWER", "USB-ID" and "USB-VBUS".
>>>>>>
>>>>>> I didn't say to add "USB-ID" or "USB-VBUS". solution (a) was to have the following
>>>>>
>>>>> Right. Robert suggested the "USB-ID" and "USB-VBUS" cable name on previous mail in mail thread.
>>>>
>>>> From USB/USB-PHY driver point, it needs to know id and vbus value
>>>> for their internal logic, so as extcon users, the cable name
>>>> is better to reflect meaning of id and vbus, like "USB-ID" and "USB-VBUS",
>>>> if the power is from vbus pin at USB cable, I don't think we need another
>>>> cable name "USB-POWER" even the USB/USB-PHY driver don't need it.
>>>
>>> I agree as well that this is the *best* option for USB case. Just because Chanwoo was
>>> objecting these names I suggested "USB-POWER".
>>>
>>> Chanwoo, can we simply get rid of "USB" and "USB-HOST" cables and move to
>>> "USB-ID" and "USB-VBUS"?
>>
>> I'm wondering about changing the previous cable name from 'USB'/'USB-HOST'
>> to 'USB-ID/USB-VBUS' because extcon framework update the state of cable by
>> using uevent and the user-space process would catch the changed state by
>> using cable name ('USB'/'USB-HOST').
>>
>> The user-space process may not consider the both id and vbus of USB.
>> If 'USB-ID'/'USB-VBUS' cable name is used instead of 'USB'/'USB-HOST',
>> It may cause the confusion about what is meaning of cable name
>> on user-space process.
> 
>>From the user point, maybe the name of 'USB-OTG' is more suitable
> due to below reasons:
> - The users usually call this Micro-AB cable as 'USB-OTG' cable
> - When this Micro-AB cable is inserted, the current port may will work as
> host role, but if OTG HNP is supported, this port may be switched to device
> role on the fly, eg, use case like Apple Carplay.

OK. I agree that using the 'USB-OTG' cable name instead of 'USB-HOST'.
- 'USB' for usb device
- 'USB-HOST' -> 'USB-OTG' for usb host

> 
>>
>> So,
>> I prefer to use existing 'USB' and 'USB-HOST' cable name.
>> and then want to add additional method to get the vbus state.
>>
>> I think two following method to get the vbus state.
>> 1) Add the extcon_{get|set}_vbus_state()
>> - extcon_{get|set}_vbus_state()
>> - the list of of return value
>> 	#define EXTCON_USB_VBUS_OFF	0
>> 	#define EXTCON_USB_VBUS_ON	1
>>
>> When USB/USB-HOST is attached and receive the notification onextcon consumer driver
>> ,extcon consumer driver would get the vbus state by extcon_get_vbus_state().
>>
>> 2) Add the notifier chain for vbus state update
>> - extcon_{register|unregister}_vbus_notifier()
>> - the list of notifier event
>> 	#define EXTCON_USB_VBUS_OFF	0
>> 	#define EXTCON_USB_VBUS_ON	1
>>
> 
> Ok, from USB point, external id/vbus value can't decide
> which role the controller will be, the controller driver 
> will decide role according to many things, eg, user configurations,
> id/vbus value, OTG HNP, etc.
> 
> So, from USB controller/phy driver, it doesn't care which cable is
> inserted, it cares about id/vbus value. Eg, it can get id/vbus value
> and it will be notified when the id/vbus value has changed.

OK, I change the notifier name and add notifier events as following:

- extcon_{register|unregister}_usb_notifier(struct extcon_dev *edev, struct notifier_block *nb);
- list of notifier events
	#define EXTCON_USB_ID_L_VBUS_L	0	/* ID low  and VBUS low */
	#define EXTCON_USB_ID_L_VBUS_H	1	/* ID low  and VBUS high */
	#define EXTCON_USB_ID_H_VBUS_L	2	/* ID high and VBUS low */
	#define EXTCON_USB_ID_H_VBUS_H	3	/* ID high and VBUS high */

I think that we need the opinion of Felipe and Kishon about this notifier chain.

> 
>>
>> 3) add the new cable 'USB-POWER' by Roger suggestion .
>> - When 'USB-POWER' cable is attached, extcon will update the cable state
>> 'USB-POWER' means only the vbus state. But, 'USB-POWER' is not h/w cable.
>> The user-space process would handle this uevent of 'USB-POWER'
>> such as h/w cable's uevent. I think it is not clear on the user-space process aspect.
> 
> Would you explain the user for 'USB-POWER', and what it stands for from
> user point?

IMO, I think '*-POWER' keyword is not standard cable name on the user-space.
As I commend on upper reply, I agree USB/USB-OTG cable name.

[snip]

Thanks,
Chanwoo Choi
