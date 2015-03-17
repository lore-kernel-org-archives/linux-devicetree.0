From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v5 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and evaluation board dts
Date: Tue, 17 Mar 2015 12:07:02 -0500
Message-ID: <7BF42995-431A-4D01-A1E9-F6274BE1C0FA@codeaurora.org>
References: <1426262769-26758-1-git-send-email-galak@codeaurora.org> <5507F2B4.2000105@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5507F2B4.2000105@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org


On Mar 17, 2015, at 4:24 AM, Stanimir Varbanov <stanimir.varbanov@linar=
o.org> wrote:

> On 03/13/2015 06:06 PM, Kumar Gala wrote:
>> Add initial device tree support for Qualcomm MSM8916 SoC and MTP8916
>> evaluation board.  At the current time we only boot up a single proc=
essor.
>>=20
>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>> ---
>> v5:
>> * killed use of skeleton, moved to addr/size cells both being 2
>> * Added serial alias in prep of being able to spec uart params
>>  in chosen node
>>=20
>> v4:
>> * Added chosen node so we dont need to spec everything for earlycon
>> * fixed up timer node to armv8, dropped clock-frequency
>>=20
>> v3:
>> * Removed qcom,msm-id and qcom,board-id
>> * Added top level compat for "qcom,msm8916-mtp-smb1360"
>>=20
>> v2:
>> * Updated to dropping CONFIG_ARCH_QCOM_MSM8916
>> * Updated to use qcom-ids.h
>>=20
>> arch/arm64/boot/dts/Makefile              |   1 +
>> arch/arm64/boot/dts/qcom/Makefile         |   5 +
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dts  |  21 ++++
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi |  32 +++++
>> arch/arm64/boot/dts/qcom/msm8916.dtsi     | 195 ++++++++++++++++++++=
++++++++++
>> 5 files changed, 254 insertions(+)
>> create mode 100644 arch/arm64/boot/dts/qcom/Makefile
>> create mode 100644 arch/arm64/boot/dts/qcom/msm8916-mtp.dts
>> create mode 100644 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
>> create mode 100644 arch/arm64/boot/dts/qcom/msm8916.dtsi
>>=20
>> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Make=
file
>> index e0350ca..8517f15 100644
>> --- a/arch/arm64/boot/dts/Makefile
>> +++ b/arch/arm64/boot/dts/Makefile
>> @@ -5,5 +5,6 @@ dts-dirs +=3D cavium
>> dts-dirs +=3D exynos
>> dts-dirs +=3D freescale
>> dts-dirs +=3D mediatek
>> +dts-dirs +=3D qcom
>>=20
>> subdir-y	:=3D $(dts-dirs)
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts=
/qcom/Makefile
>> new file mode 100644
>> index 0000000..360ec4c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -0,0 +1,5 @@
>> +dtb-$(CONFIG_ARCH_QCOM)	+=3D msm8916-mtp.dtb
>> +
>> +always		:=3D $(dtb-y)
>> +subdir-y	:=3D $(dts-dirs)
>> +clean-files	:=3D *.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/b=
oot/dts/qcom/msm8916-mtp.dts
>> new file mode 100644
>> index 0000000..784ad92
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
>> @@ -0,0 +1,21 @@
>> +/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserv=
ed.
>=20
> multi line comment rules
>=20
>> +*
>> +* This program is free software; you can redistribute it and/or mod=
ify
>> +* it under the terms of the GNU General Public License version 2 an=
d
>> +* only version 2 as published by the Free Software Foundation.
>> +*
>> +* This program is distributed in the hope that it will be useful,
>> +* but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +* GNU General Public License for more details.
>> +*/
>> +
>> +/dts-v1/;
>> +
>> +#include "msm8916-mtp.dtsi"
>> +
>> +/ {
>> +	model =3D "Qualcomm Technologies, Inc. MSM 8916 MTP";
>> +	compatible =3D "qcom,msm8916-mtp", "qcom,msm8916-mtp-smb1360",
>> +			"qcom,msm8916", "qcom,mtp";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/=
boot/dts/qcom/msm8916-mtp.dtsi
>> new file mode 100644
>> index 0000000..8dbb77f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
>> @@ -0,0 +1,32 @@
>> +/* Copyright (c) 2014-2014, The Linux Foundation. All rights reserv=
ed.
>=20
> multi line comment rules and 2014-2015
>=20
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
nd
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include "msm8916.dtsi"
>> +
>> +/ {
>> +	aliases {
>> +		serial0 =3D &blsp1_uart2;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0";
>> +	};
>> +
>> +	soc {
>> +		serial@78b0000 {
>> +			status =3D "okay";
>> +			pinctrl-names =3D "default", "sleep";
>> +			pinctrl-0 =3D <&blsp1_uart2_default>;
>> +			pinctrl-1 =3D <&blsp1_uart2_sleep>;
>> +		};
>> +	};
>=20
> Why don't describe this as:
>=20
> &blsp1_uart2 {
> 	status =3D "okay";
> 	pinctrl-names =3D xxxx;
> 	....
> };
>=20
> it looks more readable and obvious. This is what the other boards doi=
ng
> as well.

I find the way it is more explicit and obvious, plus it works for cases=
 that don=92t have a label associated with them.

I=92ll fixup the multiline comment issues.

- k
--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
