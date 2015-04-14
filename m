From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Tue, 14 Apr 2015 20:29:34 +0900
Message-ID: <552CFA1E.5070400@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
 <55264148.8070903@samsung.com> <55264534.4020006@samsung.com>
 <55277910.2070000@samsung.com> <55277FA2.6090700@samsung.com>
 <55278580.2090809@samsung.com> <55278DD3.3020409@samsung.com>
 <55279550.1060609@samsung.com> <552CE579.6060702@ti.com>
 <552CE5C0.3010207@ti.com> <552CEC97.1050205@samsung.com>
 <552CEE42.1050907@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <552CEE42.1050907@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: Robert Baldyga <r.baldyga@samsung.com>, myungjoo.ham@samsung.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, "Balbi, Felipe" <balbi@ti.com>, "ABRAHAM, KISHON VIJAY" <kishon@ti.com>, Peter Chen <peter.chen@freescale.com>
List-Id: devicetree@vger.kernel.org

On 04/14/2015 07:38 PM, Roger Quadros wrote:
> On 14/04/15 13:31, Chanwoo Choi wrote:
>> On 04/14/2015 07:02 PM, Roger Quadros wrote:
>>> Fixed Kishon's id.
>>>
>>> On 14/04/15 13:01, Roger Quadros wrote:
>>>> On 10/04/15 12:18, Chanwoo Choi wrote:
>>>>> On 04/10/2015 05:46 PM, Robert Baldyga wrote:
>>>>>> On 04/10/2015 10:10 AM, Chanwoo Choi wrote:
>>>>>>> On 04/10/2015 04:45 PM, Robert Baldyga wrote:
>>>>>>>> On 04/10/2015 09:17 AM, Chanwoo Choi wrote:
>>>>>>>>> Hi Robert,
>>>>>>>>>
>>>>>>>>> On 04/09/2015 06:24 PM, Robert Baldyga wrote:
>>>>>>>>>> Hi Chanwoo,
>>>>>>>>>>
>>>>>>>>>> On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
>>>>>>>>>>> Hi Robert,
>>>>>>>>>>>
>>>>>>>>>>> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>>>>>>>>>>>> Hi Chanwoo,
>>>>>>>>>>>>
>>>>>>>>>>>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>>>>>>>>>>>> Hi Robert,
>>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> [snip]
>>>>>>>>>>>
>>>>>>>>>>>>> But, I have one question about case[3]
>>>>>>>>>>>>>
>>>>>>>>>>>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>>>>>>>>>>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> It's because state of single USB cable connection cannot be completely
>>>>>>>>>>>> described using single extcon cable. USB cable state has two bits (VBUS
>>>>>>>>>>>> and ID), so we need to use two cables for single cable connection. We
>>>>>>>>>>>> use following convention:
>>>>>>>>>>>> cable "USB" = VBUS
>>>>>>>>>>>> cable "USB-HOST" = !ID.
>>>>>>>>>>>
>>>>>>>>>>> I think that extcon provider driver have to update the only one cable state
>>>>>>>>>>> of either USB or USB-HOST because USB and USB-HOST feature can not be used
>>>>>>>>>>> at the same time through one h/w port.
>>>>>>>>>>>
>>>>>>>>>>> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
>>>>>>>>>>> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> It can. USB OTG allows for that. Moreover device can be host even if
>>>>>>>>>> ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
>>>>>>>>>> detected cable type is USB host). Devices would need to have complete
>>>>>>>>>> information about USB cable connection, because OTG state machine needs
>>>>>>>>>
>>>>>>>>> As I knew, USB OTG port don't send the attached cable of both USB and USB-HOST
>>>>>>>>> at the same time. The case3 in your patch update two cable state about one h/w port.
>>>>>>>>>
>>>>>>>>
>>>>>>>> It's because simple "USB" or "USB-HOST" means nothing for USB OTG
>>>>>>>> machine. It needs to know exact VBUS and ID states, which cannot be
>>>>>>>> concluded basing on cable type only. That's why I have used "USB-HOST"
>>>>>>>> name together with "USB" to pass additional information about USB cable
>>>>>>>> connection.
>>>>>>>
>>>>>>> I think this method is not proper to support this case.
>>>>>>> It may cause the confusion about other case using USB/USB-HOST cable state
>>>>>>> except of you commented case.
>>>>>>
>>>>>> That's why I finally proposed to use "USB-ID" and "USB-VBUS" in parallel
>>>>>> with old names. It seems to be simpler solution than adding new
>>>>>> mechanism notifying about VBUS and ID states changes.
>>>>>
>>>>>
>>>>> As I commented on previous reply, I don't agree to use 'USB-ID' and 'USB-VBUS'.
>>>>> If we add new strange 'USB-ID' and 'USB-VBUS' name, we would add non-general cable
>>>>> name continuoulsy.
>>>>>
>>>>> I think that extcon core provide the helper API to get the value of VBUS.
>>>>> But I need to consider it.
>>>>
>>>> Now it is starting to look like existing extcon states are not suitable for USB/PHY drivers to deliver
>>>> VBUS and ID information reliably.
>>>> This is because based on your comments the "USB" and "USB-HOST" states look like some fuzzy states
>>>> and have no direct correspondence with "VBUS" and "ID". The fact that they can't become
>>>> attached simultaneously makes me conclude that "USB" and "USB-HOST" cable states are really 
>>>> capturing only the ID pin state.
>>>>
>>>> I can suggest the following options
>>>> a) let "USB" and "USB-HOST" only indicate ID pin status. Add a new cable state for "VBUS" notification.
>>>> Maybe call it "USB-POWER" or something.
>>
>> We must discuss it before using the new cable name
>> such as "USB-POWER", "USB-ID" and "USB-VBUS".
> 
> I didn't say to add "USB-ID" or "USB-VBUS". solution (a) was to have the following

Right. Robert suggested the "USB-ID" and "USB-VBUS" cable name on previous mail in mail thread.

> "USB" - attached means ID is high. i.e. Type-B plug attached.
> "USB-HOST" - attached means ID is low. i.e. Type-A plug attached.
> "USB-POWER" - attached means USB power is present. i.e. VBUS is alive.
> 
> This way the definition of USB and USB-HOST remain true to their name and avoid further confusions.
> VBUS state is got through the "USB-POWER" cable state.

There is the same case for MHL cable.
Also, MHL cable could be connected to VBUS line.
- MHL : attached just MHL cable.
- MHL-POWER : attache MHL cable which is connected with VBUS line.

We must need the opinion of USB/PHY driver's maintainer.

> 
>>
>> What is the appropriate method of following two solution?
>> - Fisrt, use the new cable name "USB-*".
> I explained this above.
> 
>> - Second, use the additional API to get the VBUS state.
> 
> You keep mentioning additional API for VBUS. But I don't see any such API. Can you please
> suggest what API you are talking about?

I'm considering following functions for VBUS state. But it is my opinion,
If USB/PHY drivers's maintainers don't agree the new cable ("USB-POWER"),
We could use the following function to get VBUS state.
Because new cable name will affect the USB/PHY drivers.
- int extcon_{get|set}_vbus_state(struct extcon_dev *edev);

Cheers,
Chanwoo Choi
