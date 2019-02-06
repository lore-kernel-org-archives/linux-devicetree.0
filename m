From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 15/15] ARM64: dts: marvell: armada-3720-espressobin: declare PCIe warm reset pin
Date: Wed, 06 Feb 2019 12:12:46 +0100
Message-ID: <87r2cl6uhd.fsf@FE-laptop>
References: <20190108162441.5278-1-miquel.raynal@bootlin.com> <20190108162441.5278-16-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108162441.5278-16-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On mar., janv. 08 2019, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Ensure the PCIe endpoint card reset that is toggled by the PCIe
> controller itself is muxed correctly on the EspressoBin.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> index c5c72902c647..f19c1ecd5703 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> @@ -47,6 +47,8 @@
>  &pcie0 {
>  	status = "okay";
>  	phys = <&comphy1 0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_reset_pins &pcie_clkreq_pins>;
>  };
>  
>  /* J6 */
> -- 
> 2.19.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
