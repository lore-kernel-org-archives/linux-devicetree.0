From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v5 7/7] ARM64: dts: marvell: armada-37xx: declare the COMPHY node
Date: Wed, 06 Feb 2019 15:00:20 +0100
Message-ID: <87ef8l6mq3.fsf@FE-laptop>
References: <20190108163124.6409-1-miquel.raynal@bootlin.com> <20190108163124.6409-8-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108163124.6409-8-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On mar., janv. 08 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Describe the A3700 COMPHY node. It has three PHYs that can be
> configured as follow:
> * PCIe or GbE
> * USB3 or GbE
> * SATA or USB3
> Each of them has its own memory area.
>
> Suggested-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 29 ++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> index e7405931f381..036d6fd6c9ef 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -242,6 +242,35 @@
>  				reg = <0x14000 0x60>;
>  			};
>  
> +			comphy: phy@18300 {
> +				compatible = "marvell,comphy-a3700";
> +				reg = <0x18300 0x300>,
> +				      <0x1F000 0x400>,
> +				      <0x5C000 0x400>,
> +				      <0xe0178 0x8>;
> +				reg-names = "comphy",
> +					    "lane1_pcie_gbe",
> +					    "lane0_usb3_gbe",
> +					    "lane2_sata_usb3";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				comphy0: phy@0 {
> +					reg = <0>;
> +					#phy-cells = <1>;
> +				};
> +
> +				comphy1: phy@1 {
> +					reg = <1>;
> +					#phy-cells = <1>;
> +				};
> +
> +				comphy2: phy@2 {
> +					reg = <2>;
> +					#phy-cells = <1>;
> +				};
> +			};
> +
>  			pinctrl_sb: pinctrl@18800 {
>  				compatible = "marvell,armada3710-sb-pinctrl",
>  					     "syscon", "simple-mfd";
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
