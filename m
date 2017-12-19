From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/3] irqchip: irq-bcm2836: add support for DT interrupt
 polarity
Date: Tue, 19 Dec 2017 08:02:14 +0100
Message-ID: <d0c81267-8379-d4a1-ec56-fec3492c1df6@i2se.com>
References: <1513024752-11246-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513024752-11246-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marc,

Am 11.12.2017 um 21:39 schrieb Stefan Wahren:
> This patch series implements DT polarity support for the 1st level interrupt
> controller.
>
> Stefan Wahren (3):
>    dt-bindings: bcm2836-l1-intc: add interrupt polarity support
>    irqchip: irq-bcm2836: add support for DT interrupt polarity
>    ARM: dts: bcm283x: Define polarity of per-cpu interrupts
>
>   .../interrupt-controller/brcm,bcm2836-l1-intc.txt  |  4 +-
>   arch/arm/boot/dts/bcm2836.dtsi                     | 14 +++----
>   arch/arm/boot/dts/bcm2837.dtsi                     | 12 +++---
>   arch/arm/boot/dts/bcm283x.dtsi                     |  1 +
>   drivers/irqchip/irq-bcm2836.c                      | 46 +++++++++++++---------
>   5 files changed, 44 insertions(+), 33 deletions(-)
>

is this series okay?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
