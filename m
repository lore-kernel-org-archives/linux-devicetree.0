From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V2 RFC 6/6] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Tue, 16 Aug 2016 15:07:09 -0700
Message-ID: <ac20c0e9-0cab-7e3f-4abf-75223538a816@synopsys.com>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <1469559213-16160-7-git-send-email-stefan.wahren@i2se.com>
 <722dafcb-2f67-88c7-69df-d442c56c058f@synopsys.com>
 <263309088.290419.51598113-17aa-4db0-9dc0-6e58e3fafe07.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <263309088.290419.51598113-17aa-4db0-9dc0-6e58e3fafe07.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8/16/2016 12:58 PM, Stefan Wahren wrote:
> Hi John,
> 
>> John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> hat am 16. August 2016 um 21:30
>> geschrieben:
>>
>>
>> On 7/26/2016 11:54 AM, Stefan Wahren wrote:
>> ...
>>> +/*
>>> + * Settings for otg
>>> + *
>>> +	dr_mode = "otg";
>>> +	h-rx-fifo-size = <774>;
>>> +	h-np-tx-fifo-size = <32>;
>>> +	h-tx-fifo-size = <0>;
>>
>> This seems odd. It should be non-zero for use when operating as host.
>>
> 
> like in host mode i took the default values in otg mode for the last two here
> (please refer to the logs). The BCM2835 datasheet isn't very helpful.
> 
> Do you have any suggestions for valid values or how to get them?
> 

The same values used in host-only mode should work.

It seems that the reset values for host-mode aren't being read
correctly with dr_mode == otg. I suspect this is the core reset and
force-mode delay problem.

Can you try with this patch series to see if you get the proper
values?

http://marc.info/?l=linux-kernel&m=145921907525708

This series fixes known issues, but it also breaks at least one
platform and I haven't had time to look at it properly yet.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
