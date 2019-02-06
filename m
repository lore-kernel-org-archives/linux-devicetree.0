From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v5 6/7] ARM64: dts: marvell: armada-37xx: fix SATA node scope
Date: Wed, 06 Feb 2019 10:37:42 +0100
Message-ID: <878syt8dg9.fsf@FE-laptop>
References: <20190108163124.6409-1-miquel.raynal@bootlin.com> <20190108163124.6409-7-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108163124.6409-7-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On mar., janv. 08 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Fix the SATA IP memory area which is only 0x178 bytes long (from
> Marvell A3700 specification). Actually, starting from the offset
> 0xe0178, there is an area dedicated to the COMPHY driver.
>
> Suggested-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

As this one don't depend of the other part of the series I applied thi
patches to mvebu/dt64.

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index 4472bcd8f9fb..e7405931f381 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -358,7 +358,7 @@
>  
>  			sata: sata@e0000 {
>  				compatible = "marvell,armada-3700-ahci";
> -				reg = <0xe0000 0x2000>;
> +				reg = <0xe0000 0x178>;
>  				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
