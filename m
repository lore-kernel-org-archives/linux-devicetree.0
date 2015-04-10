From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Fri, 10 Apr 2015 16:39:37 +0900
Message-ID: <55277E39.1020806@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
 <55264148.8070903@samsung.com> <55264534.4020006@samsung.com>
 <55264D8B.7010301@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55264D8B.7010301@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: Robert Baldyga <r.baldyga@samsung.com>, myungjoo.ham@samsung.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Roger,

On 04/09/2015 06:59 PM, Roger Quadros wrote:
> Hi,
> 
> On 09/04/15 12:24, Robert Baldyga wrote:
>> Hi Chanwoo,
>>
>> On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
>>> Hi Robert,
>>>
>>> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>>>> Hi Chanwoo,
>>>>
>>>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>>>> Hi Robert,
>>>>>
>>>
>>> [snip]
>>>
>>>>> But, I have one question about case[3]
>>>>>
>>>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>>>
>>>>
>>>> It's because state of single USB cable connection cannot be completely
>>>> described using single extcon cable. USB cable state has two bits (VBUS
>>>> and ID), so we need to use two cables for single cable connection. We
>>>> use following convention:
>>>> cable "USB" = VBUS
>>>> cable "USB-HOST" = !ID.
>>>
>>> I think that extcon provider driver have to update the only one cable state
>>> of either USB or USB-HOST because USB and USB-HOST feature can not be used
>>> at the same time through one h/w port.
> 
> At least for the kernel users [1] we are treating USB-HOST as !ID and USB as VBUS.
> So it is not an issue for these kernel users if both USB and USB-HOST are attached.
> This is a valid USB state.

This case is only valid kernel users[1]. I think that we must
consider all case about extcon consumer driver and some framework.

> If we don't do so then extcon with 3 cable states is not sufficient to capture the
> entire USB scenario. (we need 4 states for 2 pins).
> 
> [1]
> - drivers/usb/phy/phy-omap-otg.c
> - drivers/usb/dwc3/dwc3-omap.c
> 

I think that extcon-usb-gpio.c send the only attached state of USB-HOST
and extcon could provider VBUS state with other solution instead of 
sending the attached state of both USB and USB-HOST cable at the same time.

Thanks,
Chanwoo Choi
