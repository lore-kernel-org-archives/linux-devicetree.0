From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 2/2] arm64: dts: imx8qxp: Add EDMA0/EDMA1 nodes
Date: Thu, 28 Mar 2019 02:31:25 +0000
Message-ID: <AM0PR04MB4211B89650EA1AC9133F4EBE80590@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190327190244.9208-1-daniel.baluta@nxp.com>
 <20190327190244.9208-3-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327190244.9208-3-daniel.baluta@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Teo Hall <teo.hall@nxp.com>
List-Id: devicetree@vger.kernel.org

> From: Daniel Baluta
> Sent: Thursday, March 28, 2019 3:03 AM
>=20
> i.MX8QXP contains a total of 4 EDMA controllers of which two are primaril=
y
> for audio components and the other two are for non-audio periperhals.
>=20
> This patch adds the EDMA0/EDMA1 nodes used by audio peripherals.
>=20
> EDMA0 contains channels for:
> 	* ASRC0
> 	* ESAI0
> 	* SPDIF0
> 	* SAI0, SAI1, SAI2, SAI3
>=20
> EDMA1 contains channels for:
> 	* ASRC1
> 	* SAI4, SAI5
>=20
> See chapter Audio DMA Memory Maps (2.2.3) from i.MX8QXP RM [1]
>=20
> This patch is based on the dtsi file initially submitted by Teo Hall in i=
.MX NXP
> internal tree.
>=20
> [1] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
>=20
> Cc: Teo Hall <teo.hall@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 72
> ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 0cb939861a60..84c7c3eca1a1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -182,6 +182,78 @@
>  			#clock-cells =3D <1>;
>  		};
>=20
> +		edma0: dma-controller@591f0000 {
> +			compatible =3D "fsl,imx8qxp-edma";
> +			reg =3D <0x59200000 0x10000>,   /* asrc0 pair A input req */
> +				<0x59210000 0x10000>, /* asrc0 pair B input req */
> +				<0x59220000 0x10000>, /* asrc0 pair C input req */
> +				<0x59230000 0x10000>, /* asrc0 pair A output req */
> +				<0x59240000 0x10000>, /* asrc0 pair B output req */
> +				<0x59250000 0x10000>, /* asrc0 pair C output req */
> +				<0x59260000 0x10000>, /* esai0 rx */
> +				<0x59270000 0x10000>, /* esai0 tx */
> +				<0x59280000 0x10000>, /* spdif0 rx */
> +				<0x59290000 0x10000>, /* spdif0 tx */
> +				<0x592c0000 0x10000>, /* sai0 rx */
> +				<0x592d0000 0x10000>, /* sai0 tx */
> +				<0x592e0000 0x10000>, /* sai1 rx */
> +				<0x592f0000 0x10000>, /* sai1 tx */
> +			#dma-cells =3D <3>;

In binding doc, it's 2.
- #dma-cells : Must be <2>.
        The 1st cell specifies the DMAMUX(0 for DMAMUX0 and 1 for DMAMUX1).
        Specific request source can only be multiplexed by specific channel=
s
        group called DMAMUX.
        The 2nd cell specifies the request source(slot) ID.

Need update binding doc?

> +			shared-interrupt;

Undocumented property?

Checkpatch did not complain?

Regards
Dong Aisheng

> +			dma-channels =3D <14>;
> +			interrupts =3D <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,    /* asrc 0
> */
> +					<GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>, /* esai0 */
> +					<GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>, /* spdif0 */
> +					<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>, /* sai0 */
> +					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>, /* sai1 */
> +					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupt-names =3D "edma0-chan0-rx", "edma0-chan1-rx", /*
> asrc0 */
> +					"edma0-chan2-rx", "edma0-chan3-tx",
> +					"edma0-chan4-tx", "edma0-chan5-tx",
> +					"edma0-chan6-rx", "edma0-chan7-tx",   /* esai0 */
> +					"edma0-chan8-rx", "edma0-chan9-tx",   /* spdif0 */
> +					"edma0-chan12-rx", "edma0-chan13-tx", /* sai0 */
> +					"edma0-chan14-rx", "edma0-chan15-tx", /* sai1 */
> +		};
> +
> +		edma1: dma-controller@599F0000 {
> +			compatible =3D "fsl,imx8qxp-edma";
> +			reg =3D <0x0 0x59A00000 0x0 0x10000>, /* asrc1 */
> +				<0x0 0x59A10000 0x0 0x10000>,
> +				<0x0 0x59A20000 0x0 0x10000>,
> +				<0x0 0x59A30000 0x0 0x10000>,
> +				<0x0 0x59A40000 0x0 0x10000>,
> +				<0x0 0x59A50000 0x0 0x10000>,
> +				<0x0 0x59A80000 0x0 0x10000>, /* sai4 rx */
> +				<0x0 0x59A90000 0x0 0x10000>, /* sai4 tx */
> +				<0x0 0x59AA0000 0x0 0x10000>; /* sai5 tx */
> +			#dma-cells =3D <3>;
> +			shared-interrupt;
> +			dma-channels =3D <9>;
> +			interrupts =3D <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>, /* asrc 1 */
> +					<GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>, /* sai4 */
> +					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>; /* sai5 */
> +			interrupt-names =3D "edma1-chan0-rx", "edma1-chan1-rx", /*
> asrc1 */
> +					"edma1-chan2-rx", "edma1-chan3-tx",
> +					"edma1-chan4-tx", "edma1-chan5-tx",
> +					"edma1-chan8-rx", "edma1-chan9-tx", /* sai4 */
> +					"edma1-chan10-tx"; /* sai5 */
> +		};
> +
>  		adma_lpuart0: serial@5a060000 {
>  			compatible =3D "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
>  			reg =3D <0x5a060000 0x1000>;
> --
> 2.17.1
