From: Robert Baldyga <r.baldyga@samsung.com>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Fri, 10 Apr 2015 10:46:11 +0200
Message-ID: <55278DD3.3020409@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
 <55264148.8070903@samsung.com> <55264534.4020006@samsung.com>
 <55277910.2070000@samsung.com> <55277FA2.6090700@samsung.com>
 <55278580.2090809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55278580.2090809@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On 04/10/2015 10:10 AM, Chanwoo Choi wrote:
> On 04/10/2015 04:45 PM, Robert Baldyga wrote:
>> On 04/10/2015 09:17 AM, Chanwoo Choi wrote:
>>> Hi Robert,
>>>
>>> On 04/09/2015 06:24 PM, Robert Baldyga wrote:
>>>> Hi Chanwoo,
>>>>
>>>> On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
>>>>> Hi Robert,
>>>>>
>>>>> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>>>>>> Hi Chanwoo,
>>>>>>
>>>>>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>>>>>> Hi Robert,
>>>>>>>
>>>>>
>>>>> [snip]
>>>>>
>>>>>>> But, I have one question about case[3]
>>>>>>>
>>>>>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>>>>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>>>>>
>>>>>>
>>>>>> It's because state of single USB cable connection cannot be completely
>>>>>> described using single extcon cable. USB cable state has two bits (VBUS
>>>>>> and ID), so we need to use two cables for single cable connection. We
>>>>>> use following convention:
>>>>>> cable "USB" = VBUS
>>>>>> cable "USB-HOST" = !ID.
>>>>>
>>>>> I think that extcon provider driver have to update the only one cable state
>>>>> of either USB or USB-HOST because USB and USB-HOST feature can not be used
>>>>> at the same time through one h/w port.
>>>>>
>>>>> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
>>>>> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
>>>>>
>>>>
>>>> It can. USB OTG allows for that. Moreover device can be host even if
>>>> ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
>>>> detected cable type is USB host). Devices would need to have complete
>>>> information about USB cable connection, because OTG state machine needs
>>>
>>> As I knew, USB OTG port don't send the attached cable of both USB and USB-HOST
>>> at the same time. The case3 in your patch update two cable state about one h/w port.
>>>
>>
>> It's because simple "USB" or "USB-HOST" means nothing for USB OTG
>> machine. It needs to know exact VBUS and ID states, which cannot be
>> concluded basing on cable type only. That's why I have used "USB-HOST"
>> name together with "USB" to pass additional information about USB cable
>> connection.
> 
> I think this method is not proper to support this case.
> It may cause the confusion about other case using USB/USB-HOST cable state
> except of you commented case.

That's why I finally proposed to use "USB-ID" and "USB-VBUS" in parallel
with old names. It seems to be simpler solution than adding new
mechanism notifying about VBUS and ID states changes.

> 
>>
>>> I don't agree. 
>>>
>>>> that. As I wrote, current USB cable names are misleading. It would be
>>>> better to have "USB-VBUS" and "USB-ID".
>>>
>>> It is strange cable name. I prefer to use only 'USB' cable name.
>>> But, we could support the other method to get the state of whether USB-VBUS or USB-ID
>>> by using helper API or others.
>>>
>>
>> Ok, so do you have any idea how to do it? Do we want to supply
>> additional API for notifying about VBUS and ID changes?
> 
> No, we need to consider more standard solution to support this case.
> 

Thanks,
Robert Baldyga
