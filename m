From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 15:26:24 +0000
Message-ID: <90ab45ff-3995-600d-c263-e6d350a35aaf@arm.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
 <e2295a5d-3224-1198-8b46-f45b153b540a@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e2295a5d-3224-1198-8b46-f45b153b540a@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>Ma
List-Id: devicetree@vger.kernel.org

On 18/01/17 15:16, Javier Martinez Canillas wrote:
> Hello Marc,
> 
> On 01/18/2017 07:53 AM, Marc Zyngier wrote:
>> Since everybody copied my own mistake from the DT binding example,
>> let's address all the offenders in one swift go.
>>
>> Most of them got the CPU interface size wrong (4kB, while it should
>> be 8kB), except for both keystone platforms which got the control
>> interface wrong (4kB instead of 8kB).
>>
>> In the couple of cases were I knew for sure what implementation
>> was used, I've added the "arm,gic-400" compatible string. I'm 99%
>> sure that this is what everyong is using, but short of having the
>> TRM for all the other SoCs, I've let them alone.
>>
>> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
>> ---
>>  arch/arm/boot/dts/exynos3250.dtsi    | 2 +-
>>  arch/arm/boot/dts/exynos5.dtsi       | 2 +-
>>  arch/arm/boot/dts/exynos5260.dtsi    | 2 +-
>>  arch/arm/boot/dts/exynos5440.dtsi    | 2 +-
> 
> I've looked at the Exynos5250 and Exynos5420 TRM and both say that adopts
> GIC-400, so I think it's safe for you to also update the compatible in the
> exynos5.dtsi. Unfortunately I don't have manuals for 3250, 5260 and 5440.

Thanks for taking the time to find out, I'll update the patch.

> 
> The register map changes looks good to me, so for Exynos:
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thank you.

	M.
-- 
Jazz is not dead. It just smells funny...
