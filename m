From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 6/7] arm64: allwinner: h6: add the basical Allwinner
 H6 DTSI file
Date: Fri, 23 Feb 2018 16:20:38 +0100
Message-ID: <20180223152038.2bflylwa6vj4gzfj@flea.lan>
References: <20180223123555.64009-6-icenowy@aosc.io>
 <20180223123555.64009-7-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2156292381715828893=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180223123555.64009-7-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2156292381715828893==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l2fdrnpsmitlpdua"
Content-Disposition: inline


--l2fdrnpsmitlpdua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 08:35:54PM +0800, Icenowy Zheng wrote:
> Allwinner H6 is a new SoC with Cortex-A53 cores from Allwinner, with its
> memory map fully reworked and some high-speed peripherals (PCIe, USB
> 3.0) introduced.
>=20
> This commit adds the basical DTSI file of it, including the clock
> support and UART support.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changes in v3:
> - SPDX license identifier fix.
>=20
> Changes in v2:
> - Add APB1 clock as PIO's APB clock.
> - Switched to SPDX license identifier.
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 177 +++++++++++++++++++++=
++++++
>  1 file changed, 177 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> new file mode 100644
> index 000000000000..4a6236bd9778
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun50i-h6-ccu.h>
> +#include <dt-bindings/reset/sun50i-h6-ccu.h>
> +
> +/ {
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> +			device_type =3D "cpu";
> +			reg =3D <1>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu2: cpu@2 {
> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> +			device_type =3D "cpu";
> +			reg =3D <2>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu3: cpu@3 {
> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> +			device_type =3D "cpu";
> +			reg =3D <3>;
> +			enable-method =3D "psci";
> +		};
> +	};
> +
> +	iosc: internal-osc-clk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <16000000>;
> +		clock-accuracy =3D <300000000>;
> +		clock-output-names =3D "iosc";
> +	};

You're not using it anywhere

> +	osc24M: osc24M_clk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "osc24M";
> +	};
> +
> +	osc32k: osc32k_clk {
> +		#clock-cells =3D <0>;
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <32768>;
> +		clock-output-names =3D "osc32k";
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";
> +	};

Is it needed? The bootloader should fill it with whatever version it
has, shouldn't it?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--l2fdrnpsmitlpdua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqQMUUACgkQ0rTAlCFN
r3TVHRAAk/zurzZNX92aYYFuKKrNaIZVtlQ3TjMUrhpHWREtUKOY6Eqww5ymSq/A
lMJMDtBPP4cUMWqGfhJsOevAqzfpEVzta4QoIhUo44TclVAOVegBbDwEFemWsfg7
S1RzpeAXmW2rNvbHdqp519L97tHZQTxZ1aPsyGDGcnMDOyej6moAPjj+im5istOW
+rPlNSqd6Wa5/ZUoEJUJn/5U6R8sKvZNPgxdl3YlXWHlNNkzkJ36KaEu6vykwhV6
6GgHdoVuTcWU/XtnNjIsC3j5GfQxOvGXBtvhKcnZowo1Vxt+p2Gb3bDkHtqjbLUy
tNrFFxUTKZK0F06Ct/+cgm6N6SkFsu8WHlp7Ak4zP6uUvMHS+5FlycRCI49gmp05
HkXbHndRnRJvSc+MKj6qjBhpceFzBtbViD2iUL3SEsQi1j+v75t6mZiHo7nFVbT6
oPLAF/89ZFjO6XyfmMIEc0nVRr1UvEXo6XuOlByvXv2/ttcZQlHK62ruqjuiK1dE
4bHknI2POiMi8/3AJkUwhS+g8h6KGhmTUyUR1cy99CSagRsnbe4Wd/YOsFFDeSAp
LT5mvFcWSPUIrlYSfmxa98NFXi6DH7PL/+5m7IVjUzz1IfXBTR+rZ6zGoR1yko3o
gn2hMHXn/YRQaewgp6zhorbffutDGzM+Wb+nYwMWCmQVe3YC7Og=
=xle5
-----END PGP SIGNATURE-----

--l2fdrnpsmitlpdua--


--===============2156292381715828893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2156292381715828893==--
