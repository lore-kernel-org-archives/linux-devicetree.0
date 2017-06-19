From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 10/27] ARM: dts: Add Actions Semi S500 and LeMaker
 Guitar
Date: Mon, 19 Jun 2017 04:01:52 +0200
Message-ID: <db4b8f3a-197c-ae39-0c42-765cea228ae1@suse.de>
References: <3a132688-07d9-cc3f-b4d1-85a95199ec93@suse.de>
 <20170619010828.3401-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170619010828.3401-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 19.06.2017 um 03:08 schrieb Andreas Färber:
> Add Device Trees for Actions Semiconductor S500 SoC and LeMaker Guitar SoM
> and base board.
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v4 -> v5:
>  * Renamed files from s500* to owl-s500*
> 
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
>  arch/arm/boot/dts/Makefile                     |   2 +
>  arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |  26 ++++
>  arch/arm/boot/dts/owl-s500-guitar.dtsi         |  22 ++++
>  arch/arm/boot/dts/owl-s500.dtsi                | 176 +++++++++++++++++++++++++
>  4 files changed, 226 insertions(+)
>  create mode 100644 arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts
>  create mode 100644 arch/arm/boot/dts/owl-s500-guitar.dtsi
>  create mode 100644 arch/arm/boot/dts/owl-s500.dtsi

Applying to linux-actions.git v4.13/dt branch:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.13/dt

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
