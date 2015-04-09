From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 09 Apr 2015 18:07:20 +0900
Message-ID: <55264148.8070903@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
 <5525E012.5050207@samsung.com> <552630E4.9030309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <552630E4.9030309-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 04/09/2015 04:57 PM, Robert Baldyga wrote:
> Hi Chanwoo,
> 
> On 04/09/2015 04:12 AM, Chanwoo Choi wrote:
>> Hi Robert,
>>

[snip]

>> But, I have one question about case[3]
>>
>> If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
>> Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?
>>
> 
> It's because state of single USB cable connection cannot be completely
> described using single extcon cable. USB cable state has two bits (VBUS
> and ID), so we need to use two cables for single cable connection. We
> use following convention:
> cable "USB" = VBUS
> cable "USB-HOST" = !ID.

I think that extcon provider driver have to update the only one cable state
of either USB or USB-HOST because USB and USB-HOST feature can not be used
at the same time through one h/w port.

If extcon-usb-gpio.c update two connected event of both USB and USB-HOST cable
at the same time, the extcon consumer driver can not decide what handle either USB or USB-HOST.

> In fact it would be better to have cables named "USB-VBUS" and "USB-ID"
> - in this convention it would be more clear.

Thanks,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
