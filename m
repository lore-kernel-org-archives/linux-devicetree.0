From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: dts: bcm2835-rpi-zero: Enable OTG mode
Date: Fri, 9 Jun 2017 09:05:37 +0200
Message-ID: <6a45fcd8-0d88-bc17-6432-d38fe771dc80@i2se.com>
References: <1495385079-3697-1-git-send-email-stefan.wahren@i2se.com>
 <542130487.90500.1496306283902@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542130487.90500.1496306283902-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 01.06.2017 um 10:38 schrieb Stefan Wahren:
>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 21. Mai 2017 um 18:44 geschrieben:
>>
>>
>> This patch series enable OTG mode for Raspberry Pi Zero because dwc2 driver
>> has been fixed now.
>>
>> Patch 1 adds a new dtsi file to setup OTG mode (could also be used for boards
>> like RPi Zero W or the Compute Module). The second patch adds the USB PHY and
>> was part of Raspberry Pi Zero support patch series before split up [1].
>> The enabling of OTG mode of RPi Zero is done by patch number 3. The last patch
>> updates the BCM2835 defconfig.
>>
>> [1] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-July/004153.html
>>
>> Stefan Wahren (4):
>>   ARM: dts: bcm283x: Add dtsi for OTG mode
>>   ARM: dts: bcm283x: Add generic USB PHY
>>   ARM: dts: bcm2835-rpi-zero: Enable OTG mode
>>   ARM: bcm2835_defconfig: Enable serial & ethernet USB gadget support
>>
> No comments to this patch series?
>
> Regards
> Stefan

@Eric

Should i merge them?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
