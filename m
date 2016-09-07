From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH V3 RFT 3/5] ARM64: dts: bcm283x: Use dtsi for USB host
 mode
Date: Wed, 7 Sep 2016 14:02:14 +0200
Message-ID: <18641a83-ddd7-1689-535a-c5a15b8a54f9@i2se.com>
References: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com>
 <1471792204-21908-4-git-send-email-stefan.wahren@i2se.com>
 <bb073ea3-2f89-4fc5-e3af-2e27c54f221e@i2se.com>
 <1473245956.28663.50.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473245956.28663.50.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gerd,

Am 07.09.2016 um 12:59 schrieb Gerd Hoffmann:
> On Mi, 2016-08-31 at 09:59 +0200, Stefan Wahren wrote:
>> Hi Gerd,
>>
>> Am 21.08.2016 um 17:10 schrieb Stefan Wahren:
>>> In case dr_mode isn't passed via DT, the dwc2 driver defaults
>>> to OTG mode. But the Raspberry Pi 3 is designed only for host mode.
>>> So fix this issue by linking to the dtsi file which set the dr_mode
>>> to host.
>> this patch is pending and the rest has been merged. Since i don't have a
>> RPi 3 it's only compile tested.
>>
>> Could you please test it (requires patch 1 and 2 of this series) on your
>> RPi 3?
> Have a git tree to test?  Patch doesn't apply cleanly (using 4.8-rc5
> with eric's for-next branch which already has 1+2), seems to depend on
> more device tree changes.

as i wrote in the changelog the patch series based on Ian Campbell's patches

ARM: dts: Remove use of skeleton.dtsi from bcm283x.dtsi
ARM64: dts: bcm: Use a symlink to R-Pi dtsi files from arch=arm

Unfortunately i don't have a repo well prepared with this patch series.
My development repo doesn't contain the final series V3 [1], but the
master already has the necessary DT patches above.

> Also usb is working fine for me on the rpi3 even without this, so why is
> this needed? 

In case of a multiplatform config with following settings the driver
isn't able to "detect" the role:

CONFIG_USB=y
CONFIG_USB_OTG=y
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_DUAL_ROLE=y
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
CONFIG_USB_GADGET=y
CONFIG_USB_ZERO=y

Also please refer to my answer here [2] and this bug [3].

> Is dwc2 defaulting to otg mode a recent change?

No, it's a default for all OTG host controller in case no dr_mode is
defined.

Regards
Stefan

[1] - https://github.com/lategoodbye/rpi-zero
[2] -
http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-August/004242.html
[3] - http://marc.info/?l=linux-usb&m=147169822213074&w=2

>
> cheers,
>   Gerd
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
