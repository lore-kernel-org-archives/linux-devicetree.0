From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/3] irqchip: irq-bcm2836: add support for DT interrupt
 polarity
Date: Wed, 3 Jan 2018 18:10:40 +0100
Message-ID: <60587e4d-d285-34e7-3d27-ea1daa1f97d1@i2se.com>
References: <1513024752-11246-1-git-send-email-stefan.wahren@i2se.com>
 <d0c81267-8379-d4a1-ec56-fec3492c1df6@i2se.com>
 <a7939fae-31d1-c743-5957-d88be98a0c63@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a7939fae-31d1-c743-5957-d88be98a0c63-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marc,


Am 19.12.2017 um 17:36 schrieb Marc Zyngier:
> On 19/12/17 07:02, Stefan Wahren wrote:
>> Hi Marc,
>>
>> Am 11.12.2017 um 21:39 schrieb Stefan Wahren:
>>> This patch series implements DT polarity support for the 1st level interrupt
>>> controller.
>>>
>>> Stefan Wahren (3):
>>>     dt-bindings: bcm2836-l1-intc: add interrupt polarity support
>>>     irqchip: irq-bcm2836: add support for DT interrupt polarity
>>>     ARM: dts: bcm283x: Define polarity of per-cpu interrupts
>>>
>>>    .../interrupt-controller/brcm,bcm2836-l1-intc.txt  |  4 +-
>>>    arch/arm/boot/dts/bcm2836.dtsi                     | 14 +++----
>>>    arch/arm/boot/dts/bcm2837.dtsi                     | 12 +++---
>>>    arch/arm/boot/dts/bcm283x.dtsi                     |  1 +
>>>    drivers/irqchip/irq-bcm2836.c                      | 46 +++++++++++++---------
>>>    5 files changed, 44 insertions(+), 33 deletions(-)
>>>
>> is this series okay?
> Yes, it does look good. I'll queue that for 4.16.
>
> Thanks,
>
> 	M.

since i didn't found this in linux-next, please take this as a gentle 
reminder.

Thanks
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
