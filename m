From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/1] ARM: dts: imx6ul: Add PXP node
Date: Thu, 13 Jun 2019 15:31:41 +0200
Message-ID: <20190613133141.36h5cq3xueyfdp2k@pengutronix.de>
References: <20190613102355.20580-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190613102355.20580-1-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 19-06-13 12:23, S=E9bastien Szymanski wrote:
> Add PXP node for i.MX6UL/L SoC.
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> =

> Changes for v2:
>  - remove status property
>  =

>  arch/arm/boot/dts/imx6ul.dtsi  | 8 ++++++++
>  arch/arm/boot/dts/imx6ull.dtsi | 6 ++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index f10012de5eb6..751caaca85c6 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -971,6 +971,14 @@
>  				status =3D "disabled";
>  			};
>  =

> +			pxp: pxp@21cc000 {
> +				compatible =3D "fsl,imx6ul-pxp";
> +				reg =3D <0x021cc000 0x4000>;
> +				interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clks IMX6UL_CLK_PXP>;
> +				clock-names =3D "axi";
> +			};
> +
>  			qspi: spi@21e0000 {
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> diff --git a/arch/arm/boot/dts/imx6ull.dtsi b/arch/arm/boot/dts/imx6ull.d=
tsi
> index 22e4a307fa59..b017e925bd87 100644
> --- a/arch/arm/boot/dts/imx6ull.dtsi
> +++ b/arch/arm/boot/dts/imx6ull.dtsi
> @@ -34,6 +34,12 @@
>  	compatible =3D "fsl,imx6ull-ocotp", "syscon";
>  };
>  =

> +&pxp {
> +	compatible =3D "fsl,imx6ull-pxp";
> +	interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
>  &usdhc1 {
>  	compatible =3D "fsl,imx6ull-usdhc", "fsl,imx6sx-usdhc";
>  };
> -- =

> 2.19.2
> =

> =

> =


-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
