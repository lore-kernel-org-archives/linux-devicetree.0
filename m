From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 12/12] MIPS: Add basic support for the TL-WR1043ND
 version 1
Date: Mon, 8 Jun 2015 13:17:58 +0300
Message-ID: <20150608131758.9d76be074998ea3de0e976a4@gmail.com>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
	<1433031506-7984-5-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433031506-7984-5-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 31 May 2015 02:18:26 +0200
Alban Bedel <albeu-GANU6spQydw@public.gmane.org> wrote:

> Add a DTS for TL-WR1043ND version 1 and allow to have it built in the
> kernel to circumvent the broken u-boot found on these boards.
> Currently only the UART, LEDs and buttons are supported.
>=20
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>

> --- /dev/null
> +++ b/arch/mips/boot/dts/qca/ar9132.dtsi


> +++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> @@ -0,0 +1,112 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +#include "ar9132.dtsi"
> +
> +/ {
> +	compatible =3D "tplink,tl-wr1043nd-v1", "qca,ar9132";
> +	model =3D "TP-Link TL-WR1043ND Version 1";
> +
> +	alias {
> +		serial0 =3D "/ahb/apb/uart@18020000";
> +	};
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x2000000>;
> +	};
> +
> +	extosc: oscillator {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <40000000>;
> +	};
> +
> +	ahb {
> +		apb {
> +			uart@18020000 {
> +				status =3D "okay";
> +			};
> +
> +			pll-controller@18050000 {
> +				clocks =3D <&extosc>;

IMHO AR9132 SoC can't work without external oscilator.

Can we just move basic extosc declaration to SoC dt file (ar9132.dtsi)?
So board dt file ar9132_tl_wr1043nd_v1.dts will contain only oscilator
clock frequency value.

E.g.

ar9132.dtsi:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	extosc: oscillator {
		compatible =3D "fixed-clock";
		#clock-cells =3D <0>;
		clock-frequency =3D <40000000>;
	};
=2E..
	ahb {
		apb {

=2E..

			pll-controller@18050000 {
=2E..
				clocks =3D <&extosc>;
=2E..



ar9132_tl_wr1043nd_v1.dts:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

=2E..
	&extosc {
		clock-frequency =3D <40000000>;
	};


--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
