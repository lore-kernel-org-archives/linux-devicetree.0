From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and evaluation board dts
Date: Thu, 12 Mar 2015 12:33:22 -0500
Message-ID: <E114AF0E-5DA9-412A-B3E2-DDD95D224C66@codeaurora.org>
References: <1426107080-29079-1-git-send-email-galak@codeaurora.org> <1426107080-29079-2-git-send-email-galak@codeaurora.org> <20150312170541.GE30145@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150312170541.GE30145@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 12, 2015, at 12:05 PM, Mark Rutland <mark.rutland@arm.com> wrote=
:

> Hi Kumar,
>=20
>> +/ {
>> +	model =3D "Qualcomm Technologies, Inc. MSM 8916 MTP";
>> +	compatible =3D "qcom,msm8916-mtp", "qcom,msm8916-mtp-smb1360",
>> +			"qcom,msm8916", "qcom,mtp";
>> +};
>=20
> No /chosen/stdout-path?

Nope ;).

>=20
> Does your UART driver support earlycon?

It does.

>=20
> [...]
>=20
>> +	cpus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		CPU0: cpu@0 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0>;
>> +		};
>> +
>> +		CPU1: cpu@1 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x1>;
>> +		};
>> +
>> +		CPU2: cpu@2 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x2>;
>> +		};
>> +
>> +		CPU3: cpu@3 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x3>;
>> +		};
>> +	};
>=20
> The secondary CPUs need an enable-method. Are you using PSCI or
> spin-table?

This is on purpose.  We aren=92t using either PSCI or spin-table.  Righ=
t now the dts is for booting on a single core.  I can drop CPU1..CPU3 i=
f that helps.

> Which exception level do the CPUs enter the kernel?
>=20
>> +	timer {
>> +		compatible =3D "arm,armv7-timer";
>=20
> This should be "arm,armv8-timer=94.

will change

>=20
>> +		interrupts =3D <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVE=
L_LOW)>,
>> +			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>> +		clock-frequency =3D <19200000>;
>> +	};
>=20
> NAK. CNTFRQ should be programmed on all CPUs prior to entering the
> kernel, per the boot protocol. You should not need clock-frequency he=
re.

Will drop clock-frequency.

> [...]
>=20
>> +		intc: interrupt-controller@b000000 {
>> +			compatible =3D "qcom,msm-qgic2";
>=20
> This string isn't documented (but seems to be supported by the GIC
> driver).

There=92s a patch posted to add =91qcom,msm-qgic2=92 to the binding doc=
=2E

> How does this differ from other GIC implementations?

Not sure the exact details, just that its qcom=92s on implementation of=
 the GIC spec.

>=20
>> +			interrupt-controller;
>> +			#interrupt-cells =3D <3>;
>> +			reg =3D <0x0b000000 0x1000>, <0x0b002000 0x1000>;
>> +		};
>=20
> No GICH, GICV, maintenance interrupt?

Nope.

>=20
> Minor nit, but I'd prefer if the reg entries were on individual lines=
 as
> happens in other dts.
>=20
> Thanks,
> Mark.

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
