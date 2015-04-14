From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Tue, 14 Apr 2015 19:31:51 +0900
Message-ID: <552CEC97.1050205@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
 <55264148.8070903@samsung.com> <55264534.4020006@samsung.com>
 <55277910.2070000@samsung.com> <55277FA2.6090700@samsung.com>
 <55278580.2090809@samsung.com> <55278DD3.3020409@samsung.com>
 <55279550.1060609@samsung.com> <552CE579.6060702@ti.com>
 <552CE5C0.3010207@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <552CE5C0.3010207-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "Balbi, Felipe" <balbi-l0cyMroinI0@public.gmane.org>, "ABRAHAM, KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/14/2015 07:02 PM, Roger Quadros wrote:
> Fixed Kishon's id.
> 
> On 14/04/15 13:01, Roger Quadros wrote:
>> On 10/04/15 12:18, Chanwoo Choi wrote:
>>> On 04/10/2015 05:46 PM, Robert Baldyga wrote:
>>>> On 04/10/2015 10:10 AM, Chanwoo Choi wrote:
>>>>> On 04/10/2015 04:45 PM, Robert Baldyga wrote:
>>>>>> On 04/10/2015 09:17 AM, Chanwoo Choi wrote:
>>>>>>> Hi Robert,
>>>>>>>
>>>>>>> On 04/09/2015 06:24 PM, Robert Baldyga wrote:
>>>>>>>> Hi Chanwoo,
>>>>>>>>
>>>>>>>> On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
>>>>>>>>> Hi Robert,
>>>>>>>>>
>>>>>>>>> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>>>>>>>>>> Hi Chanwoo,
>>>>>>>>>>
>>>>>>>>>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>>>>>>>>>> Hi Robert,
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> [snip]
>>>>>>>>>
>>>>>>>>>>> But, I have one question about case[3]
>>>>>>>>>>>
>>>>>>>>>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>>>>>>>>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> It's because state of single USB cable connection cannot be completely
>>>>>>>>>> described using single extcon cable. USB cable state has two bits (VBUS
>>>>>>>>>> and ID), so we need to use two cables for single cable connection. We
>>>>>>>>>> use following convention:
>>>>>>>>>> cable "USB" = VBUS
>>>>>>>>>> cable "USB-HOST" = !ID.
>>>>>>>>>
>>>>>>>>> I think that extcon provider driver have to update the only one cable state
>>>>>>>>> of either USB or USB-HOST because USB and USB-HOST feature can not be used
>>>>>>>>> at the same time through one h/w port.
>>>>>>>>>
>>>>>>>>> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
>>>>>>>>> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
>>>>>>>>>
>>>>>>>>
>>>>>>>> It can. USB OTG allows for that. Moreover device can be host even if
>>>>>>>> ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
>>>>>>>> detected cable type is USB host). Devices would need to have complete
>>>>>>>> information about USB cable connection, because OTG state machine needs
>>>>>>>
>>>>>>> As I knew, USB OTG port don't send the attached cable of both USB and USB-HOST
>>>>>>> at the same time. The case3 in your patch update two cable state about one h/w port.
>>>>>>>
>>>>>>
>>>>>> It's because simple "USB" or "USB-HOST" means nothing for USB OTG
>>>>>> machine. It needs to know exact VBUS and ID states, which cannot be
>>>>>> concluded basing on cable type only. That's why I have used "USB-HOST"
>>>>>> name together with "USB" to pass additional information about USB cable
>>>>>> connection.
>>>>>
>>>>> I think this method is not proper to support this case.
>>>>> It may cause the confusion about other case using USB/USB-HOST cable state
>>>>> except of you commented case.
>>>>
>>>> That's why I finally proposed to use "USB-ID" and "USB-VBUS" in parallel
>>>> with old names. It seems to be simpler solution than adding new
>>>> mechanism notifying about VBUS and ID states changes.
>>>
>>>
>>> As I commented on previous reply, I don't agree to use 'USB-ID' and 'USB-VBUS'.
>>> If we add new strange 'USB-ID' and 'USB-VBUS' name, we would add non-general cable
>>> name continuoulsy.
>>>
>>> I think that extcon core provide the helper API to get the value of VBUS.
>>> But I need to consider it.
>>
>> Now it is starting to look like existing extcon states are not suitable for USB/PHY drivers to deliver
>> VBUS and ID information reliably.
>> This is because based on your comments the "USB" and "USB-HOST" states look like some fuzzy states
>> and have no direct correspondence with "VBUS" and "ID". The fact that they can't become
>> attached simultaneously makes me conclude that "USB" and "USB-HOST" cable states are really 
>> capturing only the ID pin state.
>>
>> I can suggest the following options
>> a) let "USB" and "USB-HOST" only indicate ID pin status. Add a new cable state for "VBUS" notification.
>> Maybe call it "USB-POWER" or something.

We must discuss it before using the new cable name
such as "USB-POWER", "USB-ID" and "USB-VBUS".

What is the appropriate method of following two solution?
- Fisrt, use the new cable name "USB-*".
- Second, use the additional API to get the VBUS state.

Cheers,
Chanwoo Choi

>>
>> NOTE: "USB-POWER" can become attached simultaneously with "USB" or "USB-HOST". But "USB-POWER" is now really
>> a different cable like "Fast-Charger" or "Slow-Charger".
>>
>> b) stop using extcon framework for USB VBUS and ID notification.


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
