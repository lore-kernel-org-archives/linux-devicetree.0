From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 2/2] ARM: dts: at91: add support for Arietta G25
Date: Wed, 31 Jul 2019 13:36:49 +0200
Message-ID: <20190731113648.kyktpnk3exly57fw@M43218.corp.atmel.com>
References: <20190728210403.2730-1-uwe@kleine-koenig.org>
 <20190728210403.2730-3-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190728210403.2730-3-uwe@kleine-koenig.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, info@acmesystems.it, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 11:04:03PM +0200, Uwe Kleine-K=F6nig wrote:
> =

> The Arietta G25 is a SBC powered by a AT91SAMG25 running at 400 MHz.
> See https://www.acmesystems.it/arietta for more details.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
>  arch/arm/boot/dts/at91sam9g25-arietta.dts | 86 +++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 arch/arm/boot/dts/at91sam9g25-arietta.dts
> =

> diff --git a/arch/arm/boot/dts/at91sam9g25-arietta.dts b/arch/arm/boot/dt=
s/at91sam9g25-arietta.dts
> new file mode 100644
> index 000000000000..6c20e02f0ea9
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91sam9g25-arietta.dts
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arietta - System On Module
> + * https://www.acmesystems.it/arietta
> + */
> +
> +/dts-v1/;
> +#include "at91sam9g25.dtsi"
> +
> +/ {
> +	model =3D "Acme Systems Arietta G25";
> +	compatible =3D "acme,ariettag25", "atmel,at91sam9x5", "atmel,at91sam9";
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	memory {
> +		reg =3D <0x20000000 0x8000000>;
> +	};
> +
> +	clocks {
> +		slow_xtal {
> +			clock-frequency =3D <32768>;
> +		};
> +
> +		main_xtal {
> +			clock-frequency =3D <12000000>;
> +		};
> +	};
> +
> +	ahb {
> +		apb {
> +			rtc@fffffeb0 {
> +				status =3D "okay";
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		arietta_led {
> +			label =3D "arietta_led";
> +			gpios =3D <&pioB 8 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +};
> +
> +&dbgu {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-0 =3D <
> +		&pinctrl_mmc0_slot0_clk_cmd_dat0
> +		&pinctrl_mmc0_slot0_dat1_3>;
> +	status =3D "okay";
> +
> +	slot@0 {
> +		reg =3D <0>;
> +		bus-width =3D <4>;
> +	};
> +};
> +
> +&usart0 {
> +	status =3D"okay";
> +};
> +
> +&usart1 {
> +	status =3D"okay";
> +};
> +
> +&usb0 {
> +	status =3D "okay";
> +	num-ports =3D <3>;
> +};
> +
> +&usb1 {
> +	status =3D "okay";
> +};
> +
> +&usb2 {
> +	status =3D "okay";
> +};
> -- =

> 2.20.1
> =
