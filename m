From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ul: fix PWM[1-4] interrupts
Date: Mon, 24 Jun 2019 08:47:04 +0800
Message-ID: <20190624004703.GF3800@dragon>
References: <20190618155834.15545-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190618155834.15545-1-sebastien.szymanski@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

+Lothar

On Tue, Jun 18, 2019 at 05:58:34PM +0200, S=E9bastien Szymanski wrote:
> According to the i.MX6UL/L RM, table 3.1 "ARM Cortex A7 domain interrupt
> summary", the interrupts for the PWM[1-4] go from 83 to 86.
> =

> Fixes: b9901fe84f02 ("ARM: dts: imx6ul: add pwm[1-4] nodes")
> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

Just curious - did you spot the error by testing PWM or merely by
looking at the code and document?

Shawn

> ---
>  arch/arm/boot/dts/imx6ul.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index bbf010c73336..a7f6d1d58e20 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -358,7 +358,7 @@
>  			pwm1: pwm@2080000 {
>  				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
>  				reg =3D <0x02080000 0x4000>;
> -				interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clks IMX6UL_CLK_PWM1>,
>  					 <&clks IMX6UL_CLK_PWM1>;
>  				clock-names =3D "ipg", "per";
> @@ -369,7 +369,7 @@
>  			pwm2: pwm@2084000 {
>  				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
>  				reg =3D <0x02084000 0x4000>;
> -				interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clks IMX6UL_CLK_PWM2>,
>  					 <&clks IMX6UL_CLK_PWM2>;
>  				clock-names =3D "ipg", "per";
> @@ -380,7 +380,7 @@
>  			pwm3: pwm@2088000 {
>  				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
>  				reg =3D <0x02088000 0x4000>;
> -				interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clks IMX6UL_CLK_PWM3>,
>  					 <&clks IMX6UL_CLK_PWM3>;
>  				clock-names =3D "ipg", "per";
> @@ -391,7 +391,7 @@
>  			pwm4: pwm@208c000 {
>  				compatible =3D "fsl,imx6ul-pwm", "fsl,imx27-pwm";
>  				reg =3D <0x0208c000 0x4000>;
> -				interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&clks IMX6UL_CLK_PWM4>,
>  					 <&clks IMX6UL_CLK_PWM4>;
>  				clock-names =3D "ipg", "per";
> -- =

> 2.21.0
> =
