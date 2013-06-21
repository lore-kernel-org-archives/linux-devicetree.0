From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: Add device tree support for phycard pca100
Date: Fri, 21 Jun 2013 11:46:05 +0800
Message-ID: <20130621034604.GC24268@S2101-09.ap.freescale.net>
References: <1371739815-6666-1-git-send-email-mpa@pengutronix.de>
 <1371739815-6666-7-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1371739815-6666-7-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 04:50:15PM +0200, Markus Pargmann wrote:
> Based on patches from:
> =

> Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
>  - Original patch
>  - ARM: dts: Set partition offsets for phycard
>  - ARM: dts: Use CSPI1 instead of CSPI2 on phycard pca100
>  - ARM: imx27-phytec-phycard-S.dts: resize nand partitions
> =

> Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
>  - ARM: dts: Enable bad block table in NAND
> =

> Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                   |   1 +
>  arch/arm/boot/dts/imx27-phytec-phycard-S.dts | 195 +++++++++++++++++++++=
++++++
>  arch/arm/mach-imx/Kconfig                    |   1 +
>  3 files changed, 197 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx27-phytec-phycard-S.dts
> =

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b3a8661..e8fb0bc 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -105,6 +105,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D \
>  	imx27-pdk.dtb \
>  	imx27-phytec-phycore-som.dtb \
>  	imx27-phytec-phycore-rdk.dtb \
> +	imx27-phytec-phycard-S.dtb \
>  	imx31-bug.dtb \
>  	imx51-apf51.dtb \
>  	imx51-apf51dev.dtb \
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-S.dts b/arch/arm/boot=
/dts/imx27-phytec-phycard-S.dts
> new file mode 100644
> index 0000000..dc3a93b
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx27-phytec-phycard-S.dts
> @@ -0,0 +1,195 @@
> +/*
> + * Copyright 2012 Sascha Hauer, Uwe Kleine-K=F6nig and Steffen Trumtrar,=
 Pengutronix
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "imx27.dtsi"
> +
> +/ {
> +	model =3D "Phytec pca100";
> +	compatible =3D "phytec,imx27-pca100", "fsl,imx27";
> +
> +	memory {
> +		device_type =3D "memory";

It's been covered by skeleton.dtsi.

> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;

They are only needed if there are child nodes with "reg" property.

> +		reg =3D <0x0 0x08000000>;   // 128MB
> +	};
> +
> +	soc {
> +		aipi@10000000 { /* aipi */
> +			wdog@10002000 {
> +				status =3D "okay";
> +			};

We now use node label in board dts files to refer to the nodes defined
in soc dts.

> +
> +			owire@10009000 {
> +				status =3D "okay";
> +			};
> +
> +			serial@1000a000 {
> +				fsl,uart-has-rtscts;
> +				status =3D "okay";
> +			};
> +
> +			serial@1000b000 {
> +				fsl,uart-has-rtscts;
> +				status =3D "okay";
> +			};
> +
> +			serial@1000c000 {
> +				fsl,uart-has-rtscts;
> +				status =3D "okay";
> +			};
> +
> +			cspi@1000e000 {
> +				fsl,spi-num-chipselects =3D <2>;
> +				cs-gpios =3D <&gpio4 28 0>,
> +					<&gpio4 27 0>;
> +				status =3D "okay";
> +			};
> +
> +			i2c@10012000 {
> +				status =3D "okay";
> +				ioexpander@41 {
> +					compatible =3D "nxp,pca9536";
> +					reg =3D <0x41>;
> +				};

Please put blank line before and after node.

> +				rtc@51 {
> +					compatible =3D "nxp,pcf8563";
> +					reg =3D <0x51>;
> +				};
> +				dimmer@60 {
> +					compatible =3D "nxp,pca9530";
> +					reg =3D <0x60>;

> +					pwm =3D <1 1>;
> +					psc =3D <1 1>;
> +					leds =3D <&led0 &led1>;

Are these documented/accepted bindings?

> +					led0: led0 {
> +						label =3D "pba-lcd_brightness";
> +						default-state =3D "off";
> +						type =3D "led";

What is this "type" property used for?  Is it documented?

> +					};
> +					led1: led1 {
> +						label =3D "pba-free_use";
> +						default-state =3D "off";
> +						type =3D "led";
> +					};
> +				};
> +			};
> +
> +			sdhci@10014000 {
> +				cd-gpios =3D <&gpio3 29 0>;
> +				status =3D "okay";
> +			};
> +
> +			gpio@10015000 {
> +				status =3D "okay";
> +			};
> +
> +			gpio@10015100 {
> +				status =3D "okay";
> +			};
> +
> +			gpio@10015200 {
> +				status =3D "okay";
> +			};
> +
> +			gpio@10015300 {
> +				status =3D "okay";
> +			};
> +
> +			gpio@10015400 {
> +				status =3D "okay";
> +			};
> +
> +			gpio@10015500 {
> +				status =3D "okay";
> +			};
> +
> +			i2c@1001d000 {
> +				status =3D "okay";
> +
> +				lm75@4a {
> +					compatible =3D "national,lm75";
> +					reg =3D <0x4a>;
> +				};
> +
> +				rtc@51 {
> +					compatible =3D "nxp,pcf8563";
> +					reg =3D <0x51>;
> +				};
> +
> +				at24@52 {
> +					compatible =3D "at,24c32";
> +					pagesize =3D <32>;
> +					reg =3D <0x52>;
> +				};
> +			};
> +		};
> +
> +		aipi@10020000 { /* AIPI2 */
> +			fb@10021000 {
> +				status =3D "okay";

Please let it be the last property in the node.

> +				display =3D <&display0>;
> +			};
> +
> +			ethernet@1002b000 {
> +				status =3D "okay";
> +			};
> +		}; /* AIPI */
> +
> +		nand@d8000000 {
> +			status =3D "okay";

Ditto

> +			nand-bus-width =3D <8>;
> +			nand-ecc-mode =3D "hw";
> +			nand-on-flash-bbt;
> +
> +			barebox@0 {
> +				label =3D "barebox";
> +				reg =3D <0x0 0x80000>;
> +			};
> +
> +			bareboxenv@80000 {
> +				label =3D "bareboxenv";
> +				reg =3D <0x80000 0x80000>;
> +			};
> +
> +			kernel@100000 {
> +				label =3D "kernel";
> +				reg =3D <0x100000 0x500000>;
> +			};
> +
> +			rootfs@500000 {
> +				label =3D "rootfs";
> +				reg =3D <0x500000 0x7b00000>;
> +			};

People are against the idea of putting partition layout in device tree.

> +		};
> +	};
> +
> +	display0: display0 {
> +		model =3D "Primeview-PD050VL1";
> +		native-mode =3D <&timing_disp0>;
> +		bits-per-pixel =3D <16>;		/* non-standard but required */
> +		fsl,pcr =3D <0xf0c88080>;	/* non-standard but required */

Has the code/document for these non-standard properties been accepted?

Shawn

> +		display-timings {
> +			timing_disp0: 640x480 {
> +				hactive =3D <640>;
> +				vactive =3D <480>;
> +				hback-porch =3D <112>;
> +				hfront-porch =3D <36>;
> +				hsync-len =3D <32>;
> +				vback-porch =3D <33>;
> +				vfront-porch =3D <33>;
> +				vsync-len =3D <2>;
> +				clock-frequency =3D <25000000>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index f25cf88..5372337 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -441,6 +441,7 @@ config MACH_IMX27IPCAM
>  config MACH_IMX27_DT
>  	bool "Support i.MX27 platforms from device tree"
>  	select SOC_IMX27
> +	select IMX_HAVE_PLATFORM_MXC_NAND
>  	help
>  	  Include support for Freescale i.MX27 based platforms
>  	  using the device tree for discovery
> -- =

> 1.8.2.1
> =
