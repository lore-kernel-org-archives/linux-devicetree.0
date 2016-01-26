From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 1/3] Documentation: tps65086: Add DT bindings for the
 TPS65086 PMIC
Date: Tue, 26 Jan 2016 14:02:34 +0000
Message-ID: <20160126140234.GA3368@x1>
References: <1453737012-3130-1-git-send-email-afd@ti.com>
 <1453737012-3130-2-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453737012-3130-2-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jan 2016, Andrew F. Davis wrote:

> The TPS65086 PMIC contains several regulators and a GPO controller.
> Add bindings for the TPS65086 PMIC.
>=20
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/tps65086.txt | 55 ++++++++++++=
++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65086.tx=
t

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/mfd/tps65086.txt b/Doc=
umentation/devicetree/bindings/mfd/tps65086.txt
> new file mode 100644
> index 0000000..d370561
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/tps65086.txt
> @@ -0,0 +1,55 @@
> +* TPS65086 Power Management Integrated Circuit (PMIC) bindings
> +
> +Required properties:
> + - compatible		: Should be "ti,tps65086".
> + - reg			: I2C slave address.
> + - interrupt-parent	: Phandle to the parent interrupt controller.
> + - interrupts		: The interrupt line the device is connected to.
> + - interrupt-controller	: Marks the device node as an interrupt cont=
roller.
> + - #interrupt-cells	: The number of cells to describe an IRQ, should=
 be 2.
> +			    The first cell is the IRQ number.
> +			    The second cell is the flags, encoded as trigger
> +			    masks from ../interrupt-controller/interrupts.txt.
> + - gpio-controller      : Marks the device node as a GPIO Controller=
=2E
> + - #gpio-cells          : Should be two.  The first cell is the pin =
number and
> +                            the second cell is used to specify flags=
=2E
> +                            See ../gpio/gpio.txt for more informatio=
n.
> + - regulators:          : List of child nodes that specify the regul=
ator
> +                            initialization data. Child nodes must be=
 named
> +                            after their hardware counterparts: buck[=
1-6],
> +                            ldoa[1-3], swa1, swb[1-2], and vtt. Each=
 child
> +                            node is defined using the standard bindi=
ng for
> +                            regulators and the optional regulator pr=
operties
> +                            defined below.
> +
> +Optional regulator properties:
> + - ti,regulator-step-size-25mv	: This is applicable for buck[1,2,6],=
 set this
> +				    if the regulator is factory set with a 25mv
> +				    step voltage mapping.
> + - ti,regulator-decay		: This is applicable for buck[1-6], set this =
if
> +				    the output needs to decay, default is for
> +				    the output to slew down.
> +
> +Example:
> +
> +	pmic: tps65086@5e {
> +		compatible =3D "ti,tps65086";
> +		reg =3D <0x5e>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		regulators {
> +			buck1 {
> +				regulator-name =3D "vcc1";
> +				regulator-min-microvolt =3D <1600000>;
> +				regulator-max-microvolt =3D <1600000>;
> +				regulator-boot-on;
> +				ti,regulator-decay;
> +				ti,regulator-step-size-25mv;
> +			};
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
