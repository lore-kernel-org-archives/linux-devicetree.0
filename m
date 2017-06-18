From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 14/28] ARM64: dts: Add Actions Semi S900 and
 Bubblegum-96
Date: Mon, 19 Jun 2017 00:40:20 +0200
Message-ID: <ad4b07e9-bafe-80bc-fc68-3541c914dabf@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
 <20170606005426.26446-15-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170606005426.26446-15-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, =?UTF-8?B?5YiY54Kc?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 06.06.2017 um 02:54 schrieb Andreas Färber:
> UART0/1/4/6 interrupts are guesses.
> 
> Cc: 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v3 -> v4:
>  * Adopted lower-case timer interrupt-names (Mark)
>  
>  v2 -> v3:
>  * Added remaining UART nodes -- some interrupts are guesses
>  * Added timer node -- only TIMER1 interrupt known
>  
>  v1 -> v2:
>  * Reworded subject
>  * Added memory@0 node for Bubblegum-96 (Mark)
>  * Filled in reserved-memory sub-node for Bubblegum-96 (Mark)
>  * Added arm-pmu interrupt-affinity property (Mark)
>  * Changed second GIC reg size 0x1000 -> 0x2000 for Bubblegum-96 (Mark)
>  * Updated ARCH_OWL to ARCH_ACTIONS (Arnd)
>  * Renamed s900-bubblegum96.dts to s900-bubblegum-96.dts
>  * Adopted "actions" vendor prefix
>  * Dropped irq.h include
>  * Adopted SPDX-License-Identifier (Rob)
>  
>  arch/arm64/boot/dts/Makefile                      |   1 +
>  arch/arm64/boot/dts/actions/Makefile              |   5 +
>  arch/arm64/boot/dts/actions/s900-bubblegum-96.dts |  35 +++++
>  arch/arm64/boot/dts/actions/s900.dtsi             | 164 ++++++++++++++++++++++
>  4 files changed, 205 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/actions/Makefile
>  create mode 100644 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
>  create mode 100644 arch/arm64/boot/dts/actions/s900.dtsi

Applying (with extended commit message) to linux-actions.git v4.13/dt64:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.13/dt64

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
