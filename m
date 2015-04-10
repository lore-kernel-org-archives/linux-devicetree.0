From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Fri, 10 Apr 2015 16:17:36 +0900
Message-ID: <55277910.2070000@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
 <55264148.8070903@samsung.com> <55264534.4020006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <55264534.4020006-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 04/09/2015 06:24 PM, Robert Baldyga wrote:
> Hi Chanwoo,
> 
> On 04/09/2015 11:07 AM, Chanwoo Choi wrote:
>> Hi Robert,
>>
>> On 04/09/2015 04:57 PM, Robert Baldyga wrote:
>>> Hi Chanwoo,
>>>
>>> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>>>> Hi Robert,
>>>>
>>
>> [snip]
>>
>>>> But, I have one question about case[3]
>>>>
>>>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>>>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>>>
>>>
>>> It's because state of single USB cable connection cannot be completely
>>> described using single extcon cable. USB cable state has two bits (VBUS
>>> and ID), so we need to use two cables for single cable connection. We
>>> use following convention:
>>> cable "USB" = VBUS
>>> cable "USB-HOST" = !ID.
>>
>> I think that extcon provider driver have to update the only one cable state
>> of either USB or USB-HOST because USB and USB-HOST feature can not be used
>> at the same time through one h/w port.
>>
>> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
>> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
>>
> 
> It can. USB OTG allows for that. Moreover device can be host even if
> ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
> detected cable type is USB host). Devices would need to have complete
> information about USB cable connection, because OTG state machine needs

As I knew, USB OTG port don't send the attached cable of both USB and USB-HOST
at the same time. The case3 in your patch update two cable state about one h/w port.

I don't agree. 

> that. As I wrote, current USB cable names are misleading. It would be
> better to have "USB-VBUS" and "USB-ID".

It is strange cable name. I prefer to use only 'USB' cable name.
But, we could support the other method to get the state of whether USB-VBUS or USB-ID
by using helper API or others.

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
