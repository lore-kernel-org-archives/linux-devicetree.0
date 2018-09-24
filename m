From: Craig <ctatlor97@gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm630 SoC and Sony Pioneer (Xperia XA2) support
Date: Mon, 24 Sep 2018 21:42:29 +0100
Message-ID: <18147804-E195-4A4F-B215-77E8E4FF7C88@gmail.com>
References: <20180811162549.12312-1-ctatlor97@gmail.com> <20180924191929.GQ1367@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924191929.GQ1367@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 24 September 2018 20:19:29 BST, Bjorn Andersson <bjorn=2Eandersson@lina=
ro=2Eorg> wrote:
>On Sat 11 Aug 09:25 PDT 2018, Craig Tatlor wrote:
>
>> Initial device tree support for Qualcomm SDM630 SoC and
>> Sony Pioneer (Xperia XA2)=2E
>>=20
>> SDM630 is based off of the SDM660 soc and all SDM660 specific drivers
>are
>> compatible with it=2E SDM660 is also based off of MSM8998 so it uses
>some
>> of its drivers aswell=2E
>
>Consider adding both sdm630 and sdm660 compatibles to the bindings and
>drivers and use the right one in the dts, in case we find details that
>differs in the future=2E

This includes pinctrl and GCC?
>
>>=20
>> The device tree is based on the CAF 4=2E4 kernel tree=2E
>>=20
>> The device can be booted into the initrd with a shell over UART=2E
>>=20
>> Signed-off-by: Craig Tatlor <ctatlor97@gmail=2Ecom>
>[=2E=2E]
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630-pins=2Edtsi
>b/arch/arm64/boot/dts/qcom/sdm630-pins=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2E78b79c1076f1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm630-pins=2Edtsi
>> @@ -0,0 +1,17 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +/* Copyright (c) 2018, Craig Tatlor=2E */
>> +
>> +&tlmm {
>> +	blsp1_uart1_default: blsp1_uart1_default {
>> +		pinmux {
>> +			pins =3D "gpio0", "gpio1", "gpio2", "gpio3";
>> +			function =3D "gpio";
>
>Please put these in the sdm630=2Edtsi directly, rather than spreading the
>pins out in a separate file=2E
>
Okay, just followed what 8996 did
>> +		};
>> +
>> +		pinconf {
>> +			pins =3D "gpio0", "gpio1", "gpio2", "gpio3";
>> +			drive-strength =3D <2>;
>> +			bias-disable;
>
>Please extend &blsp1_uart1_default in the pioneer dtsi with these
>"electrical properties"=2E
Are you meaning to put this in the pioneer DTS or just drive strength and =
bias?
>
>> +		};
>> +	};
>> +};
>[=2E=2E]
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630-pioneer=2Edtsi
>b/arch/arm64/boot/dts/qcom/sdm630-pioneer=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2E512792c23369
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm630-pioneer=2Edtsi
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +/* Copyright (c) 2018, Craig Tatlor=2E */
>> +
>> +#include "sdm630=2Edtsi"
>> +
>> +/ {
>> +	aliases {
>> +		serial0 =3D &blsp1_uart1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +};
>> +
>> +&soc {
>> +	serial@c170000 {
>
>Please reference this by &blsp1_uart1, rather than duplicating the
>hierarchy=2E
Okay, should the same still apply once more stuff is in soc? Or should I u=
se references for them?
>
>> +		status =3D "okay";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&blsp1_uart1_default>;
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630=2Edtsi
>b/arch/arm64/boot/dts/qcom/sdm630=2Edtsi
>> new file mode 100644
>> index 000000000000=2E=2E8a544979b7c0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm630=2Edtsi
>> @@ -0,0 +1,383 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +/* Copyright (c) 2018, Craig Tatlor=2E */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic=2Eh>
>> +#include <dt-bindings/clock/qcom,gcc-sdm660=2Eh>
>> +
>> +/ {
>> +	model =3D "Qualcomm Technologies, Inc=2E SDM630";
>
>We expect the board to always override this, so no need to specify it
>here=2E
Yup
>> +
>> +	interrupt-parent =3D <&intc>;
>> +
>> +	qcom,msm-id =3D <318 0x0>;
>> +
>> +	#address-cells =3D <2>;
>> +	#size-cells =3D <2>;
>> +
>> +	chosen { };
>> +
>> +	memory {
>> +		device_type =3D "memory";
>> +		/* We expect the bootloader to fill in the reg */
>> +		reg =3D <0 0 0 0>;
>> +	};
>> +
>> +
>
>Extra empty line=2E
Okay
>> +	cpus {
>[=2E=2E]
>> +
>> +	timer {
>
>Please sort these nodes by name, except for "soc" which is convenient
>to have last=2E
Okay
>
>> +		compatible =3D "arm,armv8-timer";
>> +		interrupts =3D <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
>> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>[=2E=2E]
>> +	firmware {
>> +		scm {
>> +			compatible =3D "qcom,scm-sdm660";
>> +		};
>> +	};
>> +
>> +
>
>Extra empty line=2E
Okay
>
>> +	rpm-glink {
>> +		compatible =3D "qcom,glink-rpm";
>> +
>> +		interrupts =3D <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>> +
>> +		qcom,rpm-msg-ram =3D <&rpm_msg_ram>;
>> +
>> +		mboxes =3D <&apcs_glb 0>;
>
>Remove a few of these extra empty lines and add the rpm_requests
>channel
>here while you're at it:
>
Sure
>		rpm_requests: glink-channel {
>                        compatible =3D "qcom,rpm-sdm660";
>                        qcom,glink-channels =3D "rpm_requests";
>                };
>
>> +	};
>> +
>> +	soc: soc {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		ranges =3D <0 0 0 0xffffffff>;
>> +		compatible =3D "simple-bus";
>> +
>> +		intc: interrupt-controller@17a00000 {
>
>Please sort these nodes by base address=2E
>
Will do
>> +			compatible =3D "arm,gic-v3";
>> +			reg =3D <0x17a00000 0x10000>,
>> +			      <0x17b00000 0x100000>;
>> +			#interrupt-cells =3D <3>;
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <1>;
>> +			ranges;
>> +			interrupt-controller;
>> +			#redistributor-regions =3D <1>;
>> +			redistributor-stride =3D <0x0 0x20000>;
>> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		gcc: clock-controller@100000 {
>> +			compatible =3D "qcom,gcc-sdm660";
>> +			#clock-cells =3D <1>;
>> +			#reset-cells =3D <1>;
>> +			#power-domain-cells =3D <1>;
>> +			reg =3D <0x100000 0x94000>;
>
>Please 0-pad addresses in "reg", makes it easier to sort them as well
>(but keep the @address after the node name unpadded)
Sure, how much should I pad up to?
>
>> +		};
>> +
>[=2E=2E]
>> +		rpm_msg_ram: memory@778000 {
>> +			compatible =3D "qcom,rpm-msg-ram";
>> +			reg =3D <0x778000 0x7000>;
>> +		};
>> +
>> +		apcs_glb: mailbox@17911000 {
>> +			compatible =3D "qcom,msm8998-apcs-hmss-global";
>
>Please update the apcs ipc driver with a sdm660 compatible and update
>this=2E
Right
>
>> +			reg =3D <0x17911000 0x1000>;
>> +
>> +			#mbox-cells =3D <1>;
>> +		};
>
>Regards,
>Bjorn
