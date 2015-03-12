From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and evaluation board dts
Date: Thu, 12 Mar 2015 14:54:15 -0500
Message-ID: <F0B0524B-AC0E-4E60-9A21-1208C4A978F5@codeaurora.org>
References: <1426107080-29079-1-git-send-email-galak@codeaurora.org> <1426107080-29079-2-git-send-email-galak@codeaurora.org> <20150312170541.GE30145@leverpostej> <E114AF0E-5DA9-412A-B3E2-DDD95D224C66@codeaurora.org> <20150312182508.GF30145@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150312182508.GF30145@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 12, 2015, at 1:25 PM, Mark Rutland <mark.rutland@arm.com> wrote:

>>>> +	cpus {
>>>> +		#address-cells =3D <1>;
>>>> +		#size-cells =3D <0>;
>>>> +
>>>> +		CPU0: cpu@0 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>>>> +			reg =3D <0x0>;
>>>> +		};
>>>> +
>>>> +		CPU1: cpu@1 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>>>> +			reg =3D <0x1>;
>>>> +		};
>>>> +
>>>> +		CPU2: cpu@2 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>>>> +			reg =3D <0x2>;
>>>> +		};
>>>> +
>>>> +		CPU3: cpu@3 {
>>>> +			device_type =3D "cpu";
>>>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>>>> +			reg =3D <0x3>;
>>>> +		};
>>>> +	};
>>>=20
>>> The secondary CPUs need an enable-method. Are you using PSCI or
>>> spin-table?
>>=20
>> This is on purpose.  We aren=92t using either PSCI or spin-table.  R=
ight
>> now the dts is for booting on a single core.  I can drop CPU1..CPU3 =
if
>> that helps.
>=20
> We won't poke the CPUs without an enable-method, so personally I'm no=
t
> too worried either way about having the CPUs listed.

That was my thinking, so left them in.

> Which of spin-table/psci are you planning on using for SMP support, a=
nd
> when would that be likely to appear?

We have a qcom specific SMP enablement method for this device.  This wa=
s one of our first devices so it utilized as much from arm 32-bit as po=
ssible.

> Which exception level do CPUs enter the kernel? Even without a
> virt-capable GIC booting at EL2 is less work for the FW and gives the
> kernel a better chance of fixing things up (e.g. CNTVOFF).

I think the enter in EL1.

- k
--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
