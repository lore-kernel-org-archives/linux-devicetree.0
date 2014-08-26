From: kiran.padwal-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org
Subject: Re: [PATCH v2] ARM: apq8064: Add pinmux and i2c pinctrl nodes
Date: Tue, 26 Aug 2014 05:42:09 -0400 (EDT)
Message-ID: <1409046129.71143501@apps.rackspace.com>
References: <1408536133-13824-1-git-send-email-kiran.padwal@smartplayin.com>
 <53F4C085.5060101@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F4C085.5060101-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Wednesday, August 20, 2014 11:36am, "Andreas F=C3=A4rber" <afaerber@=
suse.de> said:

> Hi,
>=20
> Am 20.08.2014 14:02, schrieb Kiran Padwal:
>> This patch adds pinmux and i2c pinctrl DT node for IFC6410 board.
>> It also adds necessary DT support for i2c eeprom which is present on
>> IFC6410.
>>
>> Tested on IFC6410 board.
>>
>> Signed-off-by: Kiran Padwal <kiran.padwal-edOiRQu9Xnj5XLMNweQjbQ@public.gmane.org>
>> ---
>> Chages since v1:
>> 	- Renamed pinmux phandle "qcom_pinmux" to "tlmm_pinmux".
>> 	- Updated pinmux interrupt.
>>
>>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts |   29 ++++++++++++++
>>  arch/arm/boot/dts/qcom-apq8064.dtsi        |   59 +++++++++++++++++=
+++++++++++
>>  2 files changed, 88 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> index 7c2441d..d52ac3c 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> @@ -5,6 +5,15 @@
>>  	compatible =3D "qcom,apq8064-ifc6410", "qcom,apq8064";
>>
>>  	soc {
>> +		pinmux@800000 {
>> +			i2c1_pins: i2c1_pinmux {
>=20
> Is there a requirement to have "_pinmux" in the subnode of the "pinmu=
x"
> node? Otherwise use just "i2c1"? I notice because the general convent=
ion
> seems to be dashes rather than underscores for node names.

Ok, I will change it to i2c1.

>=20
>> +				mux {
>> +					pins =3D "gpio20", "gpio21";
>> +					function =3D "gsbi1";
>> +				};
>> +			};
>> +		};
>> +
>>  		gsbi@16600000 {
>>  			status =3D "ok";
>>  			qcom,mode =3D <GSBI_PROT_I2C_UART>;
>> @@ -12,5 +21,25 @@
>>  				status =3D "ok";
>>  			};
>>  		};
>> +
>> +		gsbi1: gsbi@12440000 {
>> +			qcom,mode =3D <GSBI_PROT_I2C>;
>> +			status =3D "ok";
>=20
> Usually the overridden status property goes first, as seen on the
> previous gsbi node.
>=20
> Further, its canonical value is "okay" (although in practice anything
> other than "disabled" should work), so suggest you adopt it for your =
new
> nodes.
>=20
> Also, you already provide a label "gsbi1" to this node in the .dtsi
> below, so you don't need to do it here again.
> Some architectures prefer in such a case that in the .dts the node is
> referenced as &gsbi1 {...}; below the root node in alphabetical order
> rather than duplicating the full /soc/foo@bar hierarchy.

Indeed, I'll change on v3.

>=20
>> +
>> +			i2c1: i2c@12460000 {
>=20
> Suggest to move the i2c1 label to the .dtsi. Then optionally same cou=
ld
> be done here as outlined for gsbi1.

Indeed, I'll change on v3.

>=20
>> +				status =3D "ok";
>=20
> "okay".

Ok.

>=20
>> +
>> +				clock-frequency =3D <200000>;
>> +
>> +				pinctrl-0 =3D <&i2c1_pins>;
>> +				pinctrl-names =3D "default";
>> +
>> +				eeprom: eeprom@52 {
>> +					compatible =3D "atmel,24c128";
>> +					reg =3D <0x52>;
>> +					pagesize =3D <32>;
>> +				};
>> +			};
>> +		};
>>  	};
>>  };
>> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi
>> b/arch/arm/boot/dts/qcom-apq8064.dtsi
>> index 92bf793..bb2ccde 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
>> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
>> @@ -70,6 +70,17 @@
>>  		ranges;
>>  		compatible =3D "simple-bus";
>>
>> +		tlmm_pinmux: pinmux@800000 {
>> +			compatible =3D "qcom,apq8064-pinctrl";
>> +			reg =3D <0x800000 0x4000>;
>> +
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells =3D <2>;
>> +			interrupts =3D <0 16 0x4>;
>=20
> s/0x4/IRQ_TYPE_LEVEL_HIGH/?

Indeed, I'll change on v3.

>=20
>> +		};
>> +
>>  		intc: interrupt-controller@2000000 {
>>  			compatible =3D "qcom,msm-qgic2";
>>  			interrupt-controller;
>> @@ -133,6 +144,54 @@
>>  			regulator;
>>  		};
>>
>> +		gsbi1: gsbi@12440000 {
>> +			compatible =3D "qcom,gsbi-v1.0.0";
>> +			reg =3D <0x12440000 0x100>;
>> +			clocks =3D <&gcc GSBI1_H_CLK>;
>> +			clock-names =3D "iface";
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <1>;
>> +			ranges;
>> +			status =3D "disabled";
>> +
>> +			i2c@12460000 {
>> +				compatible =3D "qcom,i2c-qup-v1.1.1";
>> +				reg =3D <0x12460000 0x1000>;
>> +				interrupts =3D <0 194 0>;
>=20
> The trailing 0 might be IRQ_TYPE_NONE?

Indeed, I'll change on v3.

>=20
>> +
>> +				clocks =3D <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
>> +				clock-names =3D "core", "iface";
>> +				status =3D "disabled";
>=20
> I'd guess this is redundant since the parent is already disabled?

Indeed, I'll change on v3.

>=20
>> +
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +			};
>> +		};
>> +
>> +		gsbi2: gsbi@12480000 {
>> +			compatible =3D "qcom,gsbi-v1.0.0";
>> +			reg =3D <0x12480000 0x100>;
>> +			clocks =3D <&gcc GSBI2_H_CLK>;
>> +			clock-names =3D "iface";
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <1>;
>> +			ranges;
>> +			status =3D "disabled";
>> +
>> +			i2c@124a0000 {
>> +				compatible =3D "qcom,i2c-qup-v1.1.1";
>> +				reg =3D <0x124a0000 0x1000>;
>> +				interrupts =3D <0 196 0>;
>=20
> Again, IRQ_TYPE_NONE possibly?

Indeed, I'll change on v3.
Thanks.

>=20
> Cheers,
> Andreas
>=20
>> +
>> +				clocks =3D <&gcc GSBI2_QUP_CLK>, <&gcc GSBI2_H_CLK>;
>> +				clock-names =3D "core", "iface";
>> +				status =3D "disabled";
>> +
>> +				#address-cells =3D <1>;
>> +				#size-cells =3D <0>;
>> +			};
>> +		};
>> +
>>  		gsbi7: gsbi@16600000 {
>>  			status =3D "disabled";
>>  			compatible =3D "qcom,gsbi-v1.0.0";
>=20
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
