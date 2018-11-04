From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: lx2160aqds: Add mdio mux nodes
Date: Sun, 4 Nov 2018 16:45:43 +0800
Message-ID: <20181104084541.GF26016@tiger>
References: <20181024183017.15142-1-pankaj.bansal@nxp.com>
 <HE1PR0402MB3323371C130088B2A26F1627F1F60@HE1PR0402MB3323.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <HE1PR0402MB3323371C130088B2A26F1627F1F60@HE1PR0402MB3323.eurprd04.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Leo Li <leoyang.li@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 01:18:32PM +0000, Pankaj Bansal wrote:
> Hi All,
> 
> As per the device tree ePappr https://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf
> section 2.2.1
> 
> Each node in the device tree is named according to the following convention:
> node-name@unit-address 
> 
> The node-name shall start with a lower or uppercase character and should describe the general class of device.
> The unit-address component of the name is specific to the bus type on which the node sits. It consists of one or more ASCII characters from the set of characters in Table 2-1. The unit-address must match the first address specified in the reg property of the node. If the node has no reg property, the @ and unit-address must be omitted and the node-name alone differentiates the node from other nodes at the same level in the tree.
> 
> I am having a hard time following this convention when defining mdio-mux nodes for LX2160AQDS.
> The mdio-mux in LX2160AQDS is controlled by same register in fpga. Only some bits are different for the two buses' mux.
> How to differentiate between the node names for two buses' muxes?
> 
> For now I have made their names as mdio-mux@54_f8 and mdio-mux@54_07.
> The first number is register address and second number indicates the bit mask that is used to select the bits from that register for a bus.

No.  DTC will report warnings against that, because unit-address has to
match 'reg' property.  I would suggest mdio-mux-1@54, mdio-mux-2@54 etc.

Shawn

> 
> Any better alternatives?
> 
> Regards,
> Pankaj Bansal
> 
> -----Original Message-----
> From: Pankaj Bansal
> Sent: Wednesday, October 24, 2018 6:35 PM
> To: Pankaj Bansal <pankaj.bansal@nxp.com>
> Subject: [RFC] arm64: dts: lx2160aqds: Add mdio mux nodes
> 
> The two external MDIO buses used to communicate with phy devices that
> are external to SOC are muxed in LX2160AQDS board.
> 
> These buses can be routed to any one of the eight IO slots on LX2160AQDS
> board depending on value in fpga register 0x54.
> 
> Additionally the external MDIO1 is used to communicate to the onboard
> RGMII phy devices.
> 
> The mdio1 is controlled by bits 4-7 of fpga register and mdio2 is controlled by
> bits 0-3 of fpga register.
> 
> Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
> ---
> 
> Notes:
>     This patch depends on below patches:
>     [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=369563
>     [2] https://patchwork.kernel.org/patch/10645287/
> 
>     This patch is used by below patches:
>     [1]https://patchwork.ozlabs.org/project/netdev/list/?series=69426&state=%2A&archive=both
> 
>  .../boot/dts/freescale/fsl-lx2160a-qds.dts   | 115 +++++++++++++++++
>  .../boot/dts/freescale/fsl-lx2160a.dtsi      |  22 ++++
>  2 files changed, 137 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> index 99a22abbe725..4b282bf6c36a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> @@ -46,6 +46,121 @@
>  &i2c0 {
>  	status = "okay";
> 
> +	fpga@66 {
> +		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c";
> +		reg = <0x66>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mdio-mux@54_f8 {
> +			mdio-parent-bus = <&emdio1>;
> +			reg = <0x54>;		 /* BRDCFG4 */
> +			mux-mask = <0xf8>;      /* EMI1_MDIO */
> +			#address-cells=<1>;
> +			#size-cells = <0>;
> +
> +			mdio@0 {
> +				reg = <0x00>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@40 {
> +				reg = <0x40>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@c0 {
> +				reg = <0xc0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@c8 {
> +				reg = <0xc8>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@d0 {
> +				reg = <0xd0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@d8 {
> +				reg = <0xd8>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@e0 {
> +				reg = <0xe0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@e8 {
> +				reg = <0xe8>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@f0 {
> +				reg = <0xf0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@f8 {
> +				reg = <0xf8>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		mdio-mux@54_07 {
> +			mdio-parent-bus = <&emdio2>;
> +			reg = <0x54>;		 /* BRDCFG4 */
> +			mux-mask = <0x07>;      /* EMI2_MDIO */
> +			#address-cells=<1>;
> +			#size-cells = <0>;
> +
> +			mdio@0 {
> +				reg = <0x00>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@1 {
> +				reg = <0x01>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@2 {
> +				reg = <0x02>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@3 {
> +				reg = <0x03>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@4 {
> +				reg = <0x04>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@5 {
> +				reg = <0x05>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@6 {
> +				reg = <0x06>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +			mdio@7 {
> +				reg = <0x07>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
> +
>  	i2c-mux@77 {
>  		compatible = "nxp,pca9547";
>  		reg = <0x77>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 56f846c55812..e16b1643595b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -761,5 +761,27 @@
>  				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
>  			dma-coherent;
>  		};
> +
> +		/* TODO: WRIOP (CCSR?) */
> +		emdio1: mdio@0x8B96000 { /* WRIOP0: 0x8B8_0000, E-MDIO1: 0x1_6000 */
> +			compatible = "fsl,fman-memac-mdio";
> +			reg = <0x0 0x8B96000 0x0 0x1000>;
> +			device_type = "mdio";			/* TODO: is this necessary? */
> +			little-endian;	/* force the driver in LE mode */
> +
> +			/* Not necessary on the QDS, but needed on the RDB*/
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		emdio2: mdio@0x8B97000 { /* WRIOP0: 0x8B8_0000, E-MDIO2: 0x1_7000 */
> +			compatible = "fsl,fman-memac-mdio";
> +			reg = <0x0 0x8B97000 0x0 0x1000>;
> +			device_type = "mdio";			/* TODO: is this necessary? */
> +			little-endian;	/* force the driver in LE mode */
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
>  	};
>  };
> --
> 2.17.1
> 
