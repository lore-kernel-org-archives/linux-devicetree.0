From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 10/12] ARM64: dts: marvell: armada-3720-espressobin:
 declare PCIe reset GPIO
Date: Thu, 13 Dec 2018 15:33:06 +0100
Message-ID: <20181213153306.4fc3b511@xps13>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
        <20181212102142.16053-11-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212102142.16053-11-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 12 Dec 2018
11:21:40 +0100:

> Add a reset-gpios property to the PCIe node.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> index 094994a9c68e..76a508da80b9 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> @@ -46,6 +46,9 @@
>  /* J9 */
>  &pcie0 {
>  	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_pins>;
> +	reset-gpios = <&gpiosb 3 GPIO_ACTIVE_HIGH>;
>  };
>  
>  /* J6 */

While this change may be fine for platforms based on Armada 3700 SoC,
it is not for the EspressoBin that has no reset GPIO for PCIe and
instead uses this pin to control the Ethenet switch.

I will re-send a series without this patch. I think it does not hurt to
keep the previous patch adding the pinmux setting in the
Armada-37xx.dtsi file even without using it, so I will drop only this
patch.


Thanks,
Miquèl
