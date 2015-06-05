From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 8/8] dt: regulator: pwm-regulator: Re-write bindings
Date: Fri, 5 Jun 2015 19:47:11 +0100
Message-ID: <20150605184711.GG7058@x1>
References: <1433529771-24496-1-git-send-email-lee.jones@linaro.org>
 <1433529771-24496-9-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433529771-24496-9-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Whoops, nearly forgot the DT folks.

Sorry chaps.

> * Add support for continuous-voltage mode
> * Put more meat on the bones with regards to voltage-table mode
> * Sort out formatting for ease of consumption
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  .../bindings/regulator/pwm-regulator.txt           | 66 ++++++++++++=
++++++----
>  1 file changed, 54 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulato=
r.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> index ce91f61..9a8269f 100644
> --- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> @@ -1,27 +1,69 @@
> -pwm regulator bindings
> +Bindings for the Generic PWM Regulator
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Currently supports 2 modes of operation:
> +
> +voltage-table:		When in this mode, a voltage table (See below) of pr=
edefined
> +			voltage <=3D> duty-cycle values must be provided via DT.
> +			Limitations are that the regulator can only operate at the
> +			voltages supplied in the table.  Intermediary duty-cycle
> +			values which would normally allow finer grained voltage
> +			selection are ignored and rendered useless.  Although more
> +			control is given to the user if the assumptions made in
> +			continuous-voltage mode do not reign true.
> +
> +continuous-voltage:	This mode uses the regulator's maximum and minim=
um supplied
> +			voltages specified in the regulator-{min,max}-microvolt
> +			properties to calculate appropriate duty-cycle values.  This
> +			allows for a much more fine grained solution when compared
> +			with voltage-table mode above.  This solution does make an
> +			assumption that a %50 duty-cycle value will cause the
> +			regulator voltage to run at half way between the supplied
> +			max_uV and min_uV values.
> =20
>  Required properties:
> -- compatible: Should be "pwm-regulator"
> -- pwms: OF device-tree PWM specification (see PWM binding pwm.txt)
> -- voltage-table: voltage and duty table, include 2 members in each s=
et of
> -  brackets, first one is voltage(unit: uv), the next is duty(unit: p=
ercent)
> +--------------------
> +- compatible:		Should be "pwm-regulator"
> +
> +- pwms:			PWM specification (See: ../pwm/pwm.txt)
> +
> +One of these must be provided:
> +- voltage-table: 	Voltage and Duty-Cycle table consisting of 2 cells
> +			    First cell is voltage in microvolts (uV)
> +			    Second cell is duty-cycle in percent (%)
> +
> +- max-duty-cycle:	Maximum Duty-Cycle value -- this will normally be =
255 (0xff)
> +			for an 8 bit PMU device
> =20
> -Any property defined as part of the core regulator binding defined i=
n
> -regulator.txt can also be used.
> +If both are provided, the current default is voltage-table mode.
> =20
> -Example:
> +Any property defined as part of the core regulator binding can also =
be used.
> +(See: ../regulator/regulator.txt)
> +
> +Continuous Voltage Example:
>  	pwm_regulator {
>  		compatible =3D "pwm-regulator;
>  		pwms =3D <&pwm1 0 8448 0>;
> +		regulator-min-microvolt =3D <1016000>;
> +		regulator-max-microvolt =3D <1114000>;
> +		regulator-name =3D "vdd_logic";
> +
> +		max-duty-cycle =3D <255>; /* 8bit PWM */
> +	};
> =20
> +Voltage Table Example:
> +	pwm_regulator {
> +		compatible =3D "pwm-regulator;
> +		pwms =3D <&pwm1 0 8448 0>;
> +		regulator-min-microvolt =3D <1016000>;
> +		regulator-max-microvolt =3D <1114000>;
> +		regulator-name =3D "vdd_logic";
> +
> +			      /* Voltage Duty-Cycle */
>  		voltage-table =3D <1114000 0>,
>  				<1095000 10>,
>  				<1076000 20>,
>  				<1056000 30>,
>  				<1036000 40>,
>  				<1016000 50>;
> -
> -		regulator-min-microvolt =3D <1016000>;
> -		regulator-max-microvolt =3D <1114000>;
> -		regulator-name =3D "vdd_logic";
>  	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
