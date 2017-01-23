From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: add support for I2SE Duckbill 2 SPI
Date: Mon, 23 Jan 2017 18:16:22 +0100
Message-ID: <8725d685-2723-79a2-b694-f65b8526978a@i2se.com>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
 <1485123764-14754-9-git-send-email-mhei@heimpold.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485123764-14754-9-git-send-email-mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 22.01.2017 um 23:22 schrieb Michael Heimpold:
> This machine is based on I2SE's Duckbill 2 board and is sold as part of I2SE's
> PLC Bundle for IoT. This is a development kit for Homeplug Green PHY based
> powerline products based on Qualcomms QCA7000 chip.
>
> Signed-off-by: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
> Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/imx28-duckbill-2-spi.dts | 199 +++++++++++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx28-duckbill-2-spi.dts
>
...
> diff --git a/arch/arm/boot/dts/imx28-duckbill-2-spi.dts b/arch/arm/boot/dts/imx28-duckbill-2-spi.dts
> new file mode 100644
> index 0000000..738eaa7
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx28-duckbill-2-spi.dts
> @@ -0,0 +1,199 @@
> +/*
> + * Copyright (C) 2015-2017 I2SE GmbH <info-eS4NqCHxEME@public.gmane.org>
> + * Copyright (C) 2016 Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
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
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx28.dtsi"
> +
> +/ {
> +	model = "I2SE Duckbill 2 SPI";
> +	compatible = "i2se,duckbill", "fsl,imx28";
> +
> +	aliases {
> +		ethernet1 = &qca7000;
> +	};
> +
> +	memory {
> +		reg = <0x40000000 0x08000000>;
> +	};
> +
> +	apb@80000000 {
> +		apbh@80000000 {
> +			ssp0: ssp@80010000 {
> +				compatible = "fsl,imx28-mmc";
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&mmc0_8bit_pins_a
> +					&mmc0_cd_cfg &mmc0_sck_cfg>;
> +				bus-width = <8>;
> +				vmmc-supply = <&reg_3p3v>;
> +				status = "okay";
> +				non-removable;
> +			};
> +
> +			ssp2: ssp@80014000 {
> +				compatible = "fsl,imx28-spi";
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&spi2_pins_a>;
> +				status = "okay";
> +
> +				qca7000: ethernet@0 {
> +					compatible = "qca,qca7000";
> +					pinctrl-names = "default";
> +					pinctrl-0 = <&qca7000_pins>;
> +					reg = <0>;

Just a nit. Please place the reg property before the compatible in order
to keep it like the others.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
