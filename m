From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 11/28] ARM: dts: Add Actions Semi S500 and LeMaker
 Guitar
Date: Mon, 19 Jun 2017 00:10:04 +0200
Message-ID: <3a132688-07d9-cc3f-b4d1-85a95199ec93@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
 <20170606005426.26446-12-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606005426.26446-12-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 06.06.2017 um 02:54 schrieb Andreas Färber:
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v3 -> v4:
>  * Adopted lower-case timer interrupt-names (Mark)
>  
>  v2 -> v3:
>  * Fixed uart2 reg offset
>  * Enlarged timer reg size
>  * Added 2 Hz timer interrupts, interrupt-names
>  * Disabled CPUs 1-3 for now (cf. later patches)
>  * Added Cortex-A9 SCU, global timer, TWD timer/wdt nodes
>  * Added HOSC clock for timer
>  
>  v1 -> v2:
>  * Reworded subject
>  * Updated ARCH_OWL to ARCH_ACTIONS (Arnd)
>  * Adopted "actions" vendor prefix
>  * Dropped irq.h include
>  * Added memory@0 node for Guitar SoM
>  * Dropped bogus uart3 clock-frequency
>  * Added device_type for CPU nodes
>  * Fixed UART reg size
>  * Adopted SPDX-License-Identifier (Rob)
>  * Added remaining UART nodes
>  * Added timer node
>  
>  arch/arm/boot/dts/Makefile                 |   2 +
>  arch/arm/boot/dts/s500-guitar-bb-rev-b.dts |  26 +++++
>  arch/arm/boot/dts/s500-guitar.dtsi         |  22 ++++
>  arch/arm/boot/dts/s500.dtsi                | 176 +++++++++++++++++++++++++++++
>  4 files changed, 226 insertions(+)
>  create mode 100644 arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
>  create mode 100644 arch/arm/boot/dts/s500-guitar.dtsi
>  create mode 100644 arch/arm/boot/dts/s500.dtsi

Following a previous discussion with Thomas (that Actions unfortunately
didn't follow-up to with replies here...), I am planning to respin with
s500*.dts[i] renamed to owl-s500*. That will avoid name clashes and will
future-proof the file pattern in MAINTAINERS.

For S900 I don't think we need owl-, as we have actions/* there.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
