From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v4 26/28] ARM: dts: s500: Set power domains for CPU2 and
 CPU3
Date: Thu, 27 Jul 2017 22:58:08 +0200
Message-ID: <819d3189-e3f7-5b6c-a292-693c241b1727@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
 <20170606005426.26446-27-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-27-afaerber@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, support@lemaker.org, =?UTF-8?B?5byg5aSp55uK?= <tyzhang@actions-semi.com>, devicetree@vger.kernel.org, 96boards@ucrobotics.com, linux-kernel@vger.kernel.org, Thomas Liau <thomas.liau@actions-semi.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, mp-cs@actions-semi.com, =?UTF-8?B?5YiY54Kc?= <liuwei@actions-semi.com>, =?UTF-8?B?5byg5Lic6aOO?= <zhangdf@actions-semi.com>, support@cubietech.com, =?UTF-8?B?6buO5L2Q5bu3?= <lee@cubietech.com>
List-Id: devicetree@vger.kernel.org

Am 06.06.2017 um 02:54 schrieb Andreas Färber:
> CPU2 has its own power domain PD_CPU2, and CPU3 has PD_CPU3.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v4: new (split off due to dt-bindings dependency)
>  
>  arch/arm/boot/dts/s500.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Applied to v4.14/dt:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git/log/?h=v4.14/dt

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
