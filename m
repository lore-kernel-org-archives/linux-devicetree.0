From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6ul: Add csi node
Date: Wed, 14 Aug 2019 12:42:37 +0300
Message-ID: <20190814094237.GJ2527@valkosipuli.retiisi.org.uk>
References: <20190731163257.32448-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20190731163257.32448-1-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, devel@driverdev.osuosl.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi S=E9bastien,

On Wed, Jul 31, 2019 at 06:32:57PM +0200, S=E9bastien Szymanski wrote:
> Add csi node for i.MX6UL SoC.
> =

> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

This should be probably merged through the ARM tree.

I can take the other two.

> ---
> =

> Changes for v3:
>  - none
> =

> Changes for v2:
>  - only "mclk" clock is required now.
> =

>  arch/arm/boot/dts/imx6ul.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> =

> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index 81d4b4925127..56cfcf0e5084 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -957,6 +957,15 @@
>  				};
>  			};
>  =

> +			csi: csi@21c4000 {
> +				compatible =3D "fsl,imx6ul-csi", "fsl,imx7-csi";
> +				reg =3D <0x021c4000 0x4000>;
> +				interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clks IMX6UL_CLK_CSI>;
> +				clock-names =3D "mclk";
> +				status =3D "disabled";
> +			};
> +
>  			lcdif: lcdif@21c8000 {
>  				compatible =3D "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
>  				reg =3D <0x021c8000 0x4000>;

-- =

Sakari Ailus
