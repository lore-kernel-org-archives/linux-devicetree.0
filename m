From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v3] ARM: dts: qcom: Add initial IFC6540 board device tree
Date: Fri, 05 Sep 2014 18:00:34 +0200
Message-ID: <5409DE22.3070506@suse.de>
References: <1409763031-16873-1-git-send-email-gdjakov@mm-sol.com> <5409C803.8060007@suse.de> <070D3E01-139E-4EC2-928F-31B8CA5E1BD7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <070D3E01-139E-4EC2-928F-31B8CA5E1BD7@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Georgi Djakov <gdjakov@mm-sol.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, iivanov@mm-sol.com
List-Id: devicetree@vger.kernel.org

Am 05.09.2014 17:20, schrieb Kumar Gala:
> On Sep 5, 2014, at 9:26 AM, Andreas F=E4rber <afaerber@suse.de> wrote=
:
>> Am 03.09.2014 18:50, schrieb Georgi Djakov:
>>> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dt=
s/qcom-apq8084.dtsi
>>> index 21d01e5..1f130bc 100644
>>> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
>>> @@ -3,6 +3,7 @@
>>> #include "skeleton.dtsi"
>>>
>>> #include <dt-bindings/clock/qcom,gcc-apq8084.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>>
>>> / {
>>> 	model =3D "Qualcomm APQ 8084";
>>> @@ -203,5 +204,27 @@
>>> 			clock-names =3D "core", "iface";
>>> 			status =3D "disabled";
>>> 		};
>>> +
>>> +		sdhci@f9824900 {
>>> +			compatible =3D "qcom,sdhci-msm-v4";
>>> +			reg =3D <0xf9824900 0x11c>, <0xf9824000 0x800>;
>>> +			reg-names =3D "hc_mem", "core_mem";
>>> +			interrupts =3D <0 123 0>, <0 138 0>;
>>
>> I see that you've used GPIO_ACTIVE_* above. Is the trailing zero her=
e
>> possibly IRQ_TYPE_NONE?
>>
>>> +			interrupt-names =3D "hc_irq", "pwr_irq";
>>> +			clocks =3D <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>>> +			clock-names =3D "core", "iface";
>>> +			status =3D "disabled";
>>> +		};
>>> +
>>> +		sdhci@f98a4900 {
>>> +			compatible =3D "qcom,sdhci-msm-v4";
>>> +			reg =3D <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>>> +			reg-names =3D "hc_mem", "core_mem";
>>> +			interrupts =3D <0 125 0>, <0 221 0>;
>>> +			interrupt-names =3D "hc_irq", "pwr_irq";
>>> +			clocks =3D <&gcc GCC_SDCC2_APPS_CLK>, <&gcc GCC_SDCC2_AHB_CLK>;
>>> +			clock-names =3D "core", "iface";
>>> +			status =3D "disabled";
>>> +		};
>>
>> If you assign labels to these two nodes, you can reference them in t=
he
>> .dts as &labelname {...};. Same for the uart node. That avoids
>> duplicating the hierarchy, detects spelling mistakes at compile time=
 and
>> reduces indentation. Cf. the recent ifc6410 patch.
>=20
> Got no issues with introducing the labels, but I=92d like to keep the=
 hierarchy in the .dts file.

Any explanation why? The Samsung guys have been very strict to adopt
this new style, with inherited nodes sorted alphabetically after / {};,
and the ifc6540 is a new .dts we could apply the new pattern to.

But if you don't reference the node anywhere, there's no real benefit t=
o
adding a label in the first place. It can still be done once needed.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
