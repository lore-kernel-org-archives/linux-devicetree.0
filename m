From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC v2 13/17] ARM64: dts: Add Actions Semi S900 and Bubblegum-96
Date: Fri, 24 Feb 2017 04:49:50 +0100
Message-ID: <bf4b321b-3bac-3c52-7136-4ba293e97c2e@suse.de>
References: <20170224034055.18807-1-afaerber@suse.de>
 <20170224034055.18807-14-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170224034055.18807-14-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 24.02.2017 um 04:40 schrieb Andreas Färber:
> Cc: 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
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

Sorry, not this patch but the tty patches 15ff/17 should've been RFC.

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
