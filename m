From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] Documentation: mfd: Add binding document for
 S2MPA01
Date: Wed, 5 Mar 2014 18:24:42 +0800
Message-ID: <20140305100739.GF10380@lee--X1>
References: <1392273476-32736-1-git-send-email-sachin.kamat@linaro.org>
 <1392273476-32736-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392273476-32736-3-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

=46AO Mark Brown,

> Added initial binding documentation for S2MPA01 MFD.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes since v2:
> * Re-worded as suggested by Mark Rutland
> ---
>  Documentation/devicetree/bindings/mfd/s2mpa01.txt |   90 +++++++++++=
++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/s2mpa01.txt

This document has been sitting on the MLs for nearly a month now. It
seems well written and doesn't add any new bindings. With that in mind
I'm inclined to take it though. However, as most of the important
configuration here is regulator related I'd like Mark Browns Ack on
it.

Mark, would you be so kind?

> diff --git a/Documentation/devicetree/bindings/mfd/s2mpa01.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mpa01.txt
> new file mode 100644
> index 000000000000..c13d3d8c3947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/s2mpa01.txt
> @@ -0,0 +1,90 @@
> +
> +* Samsung S2MPA01 Voltage and Current Regulator
> +
> +The Samsung S2MPA01 is a multi-function device which includes high
> +efficiency buck converters including Dual-Phase buck converter, vari=
ous LDOs,
> +and an RTC. It is interfaced to the host controller using an I2C int=
erface.
> +Each sub-block is addressed by the host system using different I2C s=
lave
> +addresses.
> +
> +Required properties:
> +- compatible: Should be "samsung,s2mpa01-pmic".
> +- reg: Specifies the I2C slave address of the PMIC block. It should =
be 0x66.
> +
> +Optional properties:
> +- interrupt-parent: Specifies the phandle of the interrupt controlle=
r to which
> +  the interrupts from s2mpa01 are delivered to.
> +- interrupts: An interrupt specifier for the sole interrupt generate=
d by the
> +  device.
> +
> +Optional nodes:
> +- regulators: The regulators of s2mpa01 that have to be instantiated=
 should be
> +  included in a sub-node named 'regulators'. Regulator nodes and con=
straints
> +  included in this sub-node use the standard regulator bindings whic=
h are
> +  documented elsewhere.
> +
> +Properties for BUCK regulator nodes:
> +- regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
> +  (default), 25000, or 50000. May be 0 for disabling the ramp delay =
on
> +  BUCK{1,2,3,4}.
> +
> + In the absence of the regulator-ramp-delay property, the default ra=
mp
> + delay will be used.
> +
> +  NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value =
will be set
> +  for a particular group of BUCKs. So provide same regulator-ramp-de=
lay=3D<value>.
> +
> +  The following BUCKs share ramp settings:
> +  * 1 and 6
> +  * 2 and 4
> +  * 8, 9, and 10
> +
> +The following are the names of the regulators that the s2mpa01 PMIC =
block
> +supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK=
 number
> +as per the datasheet of s2mpa01.
> +
> +	- LDOn
> +		  - valid values for n are 1 to 26
> +		  - Example: LDO1, LD02, LDO26
> +	- BUCKn
> +		  - valid values for n are 1 to 10.
> +		  - Example: BUCK1, BUCK2, BUCK9
> +
> +Example:
> +
> +	s2mpa01_pmic@66 {
> +		compatible =3D "samsung,s2mpa01-pmic";
> +		reg =3D <0x66>;
> +
> +		regulators {
> +			ldo1_reg: LDO1 {
> +				regulator-name =3D "VDD_ALIVE";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +			};
> +
> +			ldo2_reg: LDO2 {
> +				regulator-name =3D "VDDQ_MMC2";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +				regulator-always-on;
> +			};
> +
> +			buck1_reg: BUCK1 {
> +				regulator-name =3D "vdd_mif";
> +				regulator-min-microvolt =3D <950000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck2_reg: BUCK2 {
> +				regulator-name =3D "vdd_arm";
> +				regulator-min-microvolt =3D <950000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay =3D <50000>;
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
