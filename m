From: "Huang, Tao" <huangtao@rock-chips.com>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Thu, 21 Apr 2016 18:47:20 +0800
Message-ID: <5718AFB8.5070004@rock-chips.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
 <1461211092-26331-1-git-send-email-jay.xu@rock-chips.com>
 <20160421101930.GG6879@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160421101930.GG6879@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Jianqun Xu <jay.xu@rock-chips.com>, will.deacon@arm.com, marc.zyngier@arm.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, heiko@sntech.de, davidriley@chromium.org, dianders@chromium.org, jwerner@chromium.org, smbarber@chromium.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, Mark:
On 2016=E5=B9=B404=E6=9C=8821=E6=97=A5 18:19, Mark Rutland wrote:
> On Thu, Apr 21, 2016 at 11:58:12AM +0800, Jianqun Xu wrote:
>> +		cpu_l0: cpu@0 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>> +			reg =3D <0x0 0x0>;
>> +			enable-method =3D "psci";
>> +			#cooling-cells =3D <2>; /* min followed by max */
>> +			clocks =3D <&cru ARMCLKL>;
>> +		};
>> +		cpu_b0: cpu@100 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a72", "arm,armv8";
>> +			reg =3D <0x0 0x100>;
>> +			enable-method =3D "psci";
>> +			#cooling-cells =3D <2>; /* min followed by max */
>> +			clocks =3D <&cru ARMCLKB>;
>> +		};
>> +
>> +	arm-pmu {
>> +		compatible =3D "arm,armv8-pmuv3";
>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +	};
> This is wrong, and must go. There should be a separate node for the P=
MU
> of each microarchitecture, with the appropriate compatible string to
> represent that (see the juno dts).
You are right. The first version we wrote is:
    pmu_a53 {
        compatible =3D "arm,cortex-a53-pmu";
        interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
        interrupt-affinity =3D <&cpu_l0>,
                     <&cpu_l1>,
                     <&cpu_l2>,
                     <&cpu_l3>;
    };

    pmu_a72 {
        compatible =3D "arm,cortex-a72-pmu";
        interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
        interrupt-affinity =3D <&cpu_b0>,
                     <&cpu_b1>;
    };
but unfortunately, the arm pmu driver do not support PPI in two cluster
well,
so we have to replace with this implementation.
> In this case things are messier as the same PPI number is being used
> across clusters. Marc (Cc'd) has been working on PPI partitions, whic=
h
> should allow us to support that.
Great! So what we can do right now? Wait this feature, and delete
arm-pmu node?

Thanks,
Huang, Tao
