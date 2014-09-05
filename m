From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3] ARM: dts: qcom: Add initial IFC6540 board device tree
Date: Fri, 5 Sep 2014 10:20:18 -0500
Message-ID: <070D3E01-139E-4EC2-928F-31B8CA5E1BD7@codeaurora.org>
References: <1409763031-16873-1-git-send-email-gdjakov@mm-sol.com> <5409C803.8060007@suse.de>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5409C803.8060007@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Georgi Djakov <gdjakov@mm-sol.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, iivanov@mm-sol.com
List-Id: devicetree@vger.kernel.org


On Sep 5, 2014, at 9:26 AM, Andreas F=E4rber <afaerber@suse.de> wrote:

> Hi,
>=20
> Am 03.09.2014 18:50, schrieb Georgi Djakov:
>> Add basic support for the IFC6540 single-board computer boards, that=
 are
>> based on the APQ8084 SoC. This patch adds the initial device tree an=
d the
>> neccessary nodes required for enabling the serial port and eMMC.
>>=20
>> Signed-off-by: Georgi Djakov <gdjakov@mm-sol.com>
>> ---
>> Changes since v2:
>> - Squashed all patches into one. (suggested by Kumar Gala)
>>=20
>> Changes since v1:
>> - This time add linux-arm-msm list to the CC.
>> - Include a third patch for enabling the eMMC.
>>=20
>> arch/arm/boot/dts/Makefile                 |    1 +
>> arch/arm/boot/dts/qcom-apq8084-ifc6540.dts |   23 ++++++++++++++++++=
+++++
>> arch/arm/boot/dts/qcom-apq8084.dtsi        |   23 ++++++++++++++++++=
+++++
>> 3 files changed, 47 insertions(+)
>> create mode 100644 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
>>=20
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index b022972..df8453a 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -345,6 +345,7 @@ dtb-$(CONFIG_ARCH_PRIMA2) +=3D prima2-evb.dtb
>> dtb-$(CONFIG_ARCH_QCOM) +=3D \
>> 	qcom-apq8064-ifc6410.dtb \
>> 	qcom-apq8074-dragonboard.dtb \
>> +	qcom-apq8084-ifc6540.dtb \
>> 	qcom-apq8084-mtp.dtb \
>> 	qcom-msm8660-surf.dtb \
>> 	qcom-msm8960-cdp.dtb
>> diff --git a/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts b/arch/arm/b=
oot/dts/qcom-apq8084-ifc6540.dts
>> new file mode 100644
>> index 0000000..c9ff108
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom-apq8084-ifc6540.dts
>> @@ -0,0 +1,23 @@
>> +#include "qcom-apq8084.dtsi"
>> +
>> +/ {
>> +	model =3D "Qualcomm APQ8084/IFC6540";
>> +	compatible =3D "qcom,apq8084-ifc6540", "qcom,apq8084";
>> +
>> +	soc {
>> +		serial@f995e000 {
>> +			status =3D "okay";
>> +		};
>> +
>> +		sdhci@f9824900 {
>> +			bus-width =3D <8>;
>> +			non-removable;
>> +			status =3D "okay";
>> +		};
>> +
>> +		sdhci@f98a4900 {
>> +			cd-gpios =3D <&tlmm 122 GPIO_ACTIVE_LOW>;
>> +			bus-width =3D <4>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts=
/qcom-apq8084.dtsi
>> index 21d01e5..1f130bc 100644
>> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
>> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
>> @@ -3,6 +3,7 @@
>> #include "skeleton.dtsi"
>>=20
>> #include <dt-bindings/clock/qcom,gcc-apq8084.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>=20
>> / {
>> 	model =3D "Qualcomm APQ 8084";
>> @@ -203,5 +204,27 @@
>> 			clock-names =3D "core", "iface";
>> 			status =3D "disabled";
>> 		};
>> +
>> +		sdhci@f9824900 {
>> +			compatible =3D "qcom,sdhci-msm-v4";
>> +			reg =3D <0xf9824900 0x11c>, <0xf9824000 0x800>;
>> +			reg-names =3D "hc_mem", "core_mem";
>> +			interrupts =3D <0 123 0>, <0 138 0>;
>=20
> I see that you've used GPIO_ACTIVE_* above. Is the trailing zero here
> possibly IRQ_TYPE_NONE?
>=20
>> +			interrupt-names =3D "hc_irq", "pwr_irq";
>> +			clocks =3D <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names =3D "core", "iface";
>> +			status =3D "disabled";
>> +		};
>> +
>> +		sdhci@f98a4900 {
>> +			compatible =3D "qcom,sdhci-msm-v4";
>> +			reg =3D <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>> +			reg-names =3D "hc_mem", "core_mem";
>> +			interrupts =3D <0 125 0>, <0 221 0>;
>> +			interrupt-names =3D "hc_irq", "pwr_irq";
>> +			clocks =3D <&gcc GCC_SDCC2_APPS_CLK>, <&gcc GCC_SDCC2_AHB_CLK>;
>> +			clock-names =3D "core", "iface";
>> +			status =3D "disabled";
>> +		};
>=20
> If you assign labels to these two nodes, you can reference them in th=
e
> .dts as &labelname {...};. Same for the uart node. That avoids
> duplicating the hierarchy, detects spelling mistakes at compile time =
and
> reduces indentation. Cf. the recent ifc6410 patch.

Got no issues with introducing the labels, but I=92d like to keep the h=
ierarchy in the .dts file.

> Also, is sdhci the best node name here? Usually it's not supposed to
> reflect the exact interface used (e.g., usb vs. ehci).

probably just use sdhc

>=20
>> 	};
>> };
>=20
> Otherwise looks good.
>=20
> Regards,
> Andreas
>=20
> --=20
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FC=
rnberg
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-m=
sm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
