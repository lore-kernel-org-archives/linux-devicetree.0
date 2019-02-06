From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 14/15] ARM64: dts: marvell: armada-37xx: declare PCIe reset pin
Date: Wed, 06 Feb 2019 12:11:59 +0100
Message-ID: <87tvhh6uio.fsf@FE-laptop>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com> <20190108162441.5278-15-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108162441.5278-15-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On mar., janv. 08 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> One pin can be muxed as PCIe endpoint card reset.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index f6f8d2b3b2c1..91c0ec9c382b 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -295,6 +295,15 @@
>  					function = "mii";
>  				};
>  
> +				pcie_reset_pins: pcie-reset-pins {
> +					groups = "pcie1";
> +					function = "pcie";
> +				};
> +
> +				pcie_clkreq_pins: pcie-clkreq-pins {
> +					groups = "pcie1_clkreq";
> +					function = "pcie";
> +				};
>  			};
>  
>  			eth0: ethernet@30000 {
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
