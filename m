From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 2/2] devicetree: Add bindings for DA9063
Date: Tue, 20 Jan 2015 15:54:00 +0000
Message-ID: <20150120155400.GI13701@x1>
References: <cover.1421762065.git.stwiss.opensource@diasemi.com>
 <99c7b7fb380070e5a2f7f4e9f333e8a2b12b591a.1421762065.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <99c7b7fb380070e5a2f7f4e9f333e8a2b12b591a.1421762065.git.stwiss.opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, DT <devicetree@vger.kernel.org>, David Dajun Chen <david.chen@diasemi.com>, Grant Likely <grant.likely@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Ortiz <sameo@linux.intel.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Tue, 20 Jan 2015, Steve Twiss wrote:

> From: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> Add device tree bindings for DA9063 regulators; Real-Time Clock
> and Watchdog.
>=20
> This patch is dependent on PATCH V2 1/2=20
>=20
> Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> ---
> This patch applies against linux-next and v3.19-rc4=20
>=20
>  Documentation/devicetree/bindings/mfd/da9063.txt | 93 ++++++++++++++=
++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt

I already Acked this?  Any reason that wasn't carried forward to this
submission?  Has anything changed?

> diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Docum=
entation/devicetree/bindings/mfd/da9063.txt
> new file mode 100644
> index 0000000..42c6fa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/da9063.txt
> @@ -0,0 +1,93 @@
> +* Dialog DA9063 Power Management Integrated Circuit (PMIC)
> +
> +DA9093 consists of a large and varied group of sub-devices (I2C Only=
):
> +
> +Device                   Supply Names    Description
> +------                   ------------    -----------
> +da9063-regulator        :               : LDOs & BUCKs
> +da9063-rtc              :               : Real-Time Clock
> +da9063-watchdog         :               : Watchdog
> +
> +=3D=3D=3D=3D=3D=3D
> +
> +Required properties:
> +
> +- compatible : Should be "dlg,da9063"
> +- reg : Specifies the I2C slave address (this defaults to 0x58 but i=
t can be
> +  modified to match the chip's OTP settings).
> +- interrupt-parent : Specifies the reference to the interrupt contro=
ller for
> +  the DA9063.
> +- interrupts : IRQ line information.
> +- interrupt-controller
> +
> +Sub-nodes:
> +
> +- regulators : This node defines the settings for the LDOs and BUCKs=
=2E The
> +  DA9063 regulators are bound using their names listed below:
> +
> +    bcore1    : BUCK CORE1
> +    bcore2    : BUCK CORE2
> +    bpro      : BUCK PRO
> +    bmem      : BUCK MEM
> +    bio       : BUCK IO
> +    bperi     : BUCK PERI
> +    ldo1      : LDO_1
> +    ldo2      : LDO_2
> +    ldo3      : LDO_3
> +    ldo4      : LDO_4
> +    ldo5      : LDO_5
> +    ldo6      : LDO_6
> +    ldo7      : LDO_7
> +    ldo8      : LDO_8
> +    ldo9      : LDO_9
> +    ldo10     : LDO_10
> +    ldo11     : LDO_11
> +
> +  The component follows the standard regulator framework and the bin=
dings
> +  details of individual regulator device can be found in:
> +  Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +- rtc : This node defines settings for the Real-Time Clock associate=
d with
> +  the DA9063. There are currently no entries in this binding, howeve=
r
> +  compatible =3D "dlg,da9063-rtc" should be added if a node is creat=
ed.
> +
> +- watchdog : This node defines settings for the Watchdog timer assoc=
iated
> +  with the DA9063. There are currently no entries in this binding, h=
owever
> +  compatible =3D "dlg,da9063-watchdog" should be added if a node is =
created.
> +
> +
> +Example:
> +
> +	pmic0: da9063@58 {
> +		compatible =3D "dlg,da9063"
> +		reg =3D <0x58>;
> +		interrupt-parent =3D <&gpio6>;
> +		interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +
> +		rtc {
> +			compatible =3D "dlg,da9063-rtc";
> +		};
> +
> +		wdt {
> +			compatible =3D "dlg,da9063-watchdog";
> +		};
> +
> +		regulators {
> +			DA9063_BCORE1: bcore1 {
> +				regulator-name =3D "BCORE1";
> +				regulator-min-microvolt =3D <300000>;
> +				regulator-max-microvolt =3D <1570000>;
> +				regulator-min-microamp =3D <500000>;
> +				regulator-max-microamp =3D <2000000>;
> +				regulator-boot-on;
> +			};
> +			DA9063_LDO11: ldo11 {
> +				regulator-name =3D "LDO_11";
> +				regulator-min-microvolt =3D <900000>;
> +				regulator-max-microvolt =3D <3600000>;
> +				regulator-boot-on;
> +			};
> +		};
> +	};
> +

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
