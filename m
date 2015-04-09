From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 9 Apr 2015 12:59:39 +0300
Message-ID: <55264D8B.7010301@ti.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com> <1427980385-21285-3-git-send-email-r.baldyga@samsung.com> <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com> <55264148.8070903@samsung.com> <55264534.4020006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55264534.4020006-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 09/04/15 12:24, Robert Baldyga wrote:
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

At least for the kernel users [1] we are treating USB-HOST as !ID and USB as VBUS.
So it is not an issue for these kernel users if both USB and USB-HOST are attached.
This is a valid USB state.
If we don't do so then extcon with 3 cable states is not sufficient to capture the
entire USB scenario. (we need 4 states for 2 pins).

[1]
- drivers/usb/phy/phy-omap-otg.c
- drivers/usb/dwc3/dwc3-omap.c


>>
>> If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
>> at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.
>>
> 
> It can. USB OTG allows for that. Moreover device can be host even if
> ID=1 (so detected cable type is USB device), or peripheral when ID=0 (so
> detected cable type is USB host). Devices would need to have complete
> information about USB cable connection, because OTG state machine needs
> that. As I wrote, current USB cable names are misleading. It would be
> better to have "USB-VBUS" and "USB-ID".

We need to first understand how user space is using "USB" and "USB-HOST" events
and does it cause an issue if both USB and USB-HOST become attached.

What is the "ABI" explanation for "USB" and "USB-HOST" cable states?

cheers,
-roger

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
