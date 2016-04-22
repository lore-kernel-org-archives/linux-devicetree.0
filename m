From: "jay.xu" <jay.xu@rock-chips.com>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Fri, 22 Apr 2016 09:50:09 +0800
Message-ID: <57198351.2060608@rock-chips.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
 <5718AFB8.5070004@rock-chips.com> <20160421123018.096d4a75@arm.com>
 <2131452.5tyGOfVRfi@diego> <20160421221228.359fab3c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160421221228.359fab3c@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: "Huang, Tao" <huangtao@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, will.deacon@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, davidriley@chromium.org, dianders@chromium.org, jwerner@chromium.org, smbarber@chromium.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marc:

On 2016=E5=B9=B404=E6=9C=8822=E6=97=A5 05:12, Marc Zyngier wrote:
> On Thu, 21 Apr 2016 22:24:09 +0200
> Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
>> Am Donnerstag, 21. April 2016, 12:30:18 schrieb Marc Zyngier:
>>> On Thu, 21 Apr 2016 18:47:20 +0800
>>>
>>> "Huang, Tao" <huangtao@rock-chips.com> wrote:
>>>> Hi, Mark:
>>>>
>>>> On 2016=E5=B9=B404=E6=9C=8821=E6=97=A5 18:19, Mark Rutland wrote:
>>>>> On Thu, Apr 21, 2016 at 11:58:12AM +0800, Jianqun Xu wrote:
>>>>>> +		cpu_l0: cpu@0 {
>>>>>> +			device_type =3D "cpu";
>>>>>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>>>>>> +			reg =3D <0x0 0x0>;
>>>>>> +			enable-method =3D "psci";
>>>>>> +			#cooling-cells =3D <2>; /* min followed by max */
>>>>>> +			clocks =3D <&cru ARMCLKL>;
>>>>>> +		};
>>>>>> +		cpu_b0: cpu@100 {
>>>>>> +			device_type =3D "cpu";
>>>>>> +			compatible =3D "arm,cortex-a72", "arm,armv8";
>>>>>> +			reg =3D <0x0 0x100>;
>>>>>> +			enable-method =3D "psci";
>>>>>> +			#cooling-cells =3D <2>; /* min followed by max */
>>>>>> +			clocks =3D <&cru ARMCLKB>;
>>>>>> +		};
>>>>>> +
>>>>>> +	arm-pmu {
>>>>>> +		compatible =3D "arm,armv8-pmuv3";
>>>>>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +	};
>>>>> This is wrong, and must go. There should be a separate node for t=
he PMU
>>>>> of each microarchitecture, with the appropriate compatible string=
 to
>>>>> represent that (see the juno dts).
>>>> You are right. The first version we wrote is:
>>>>      pmu_a53 {
>>>>     =20
>>>>          compatible =3D "arm,cortex-a53-pmu";
>>>>          interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>>          interrupt-affinity =3D <&cpu_l0>,
>>>>         =20
>>>>                       <&cpu_l1>,
>>>>                       <&cpu_l2>,
>>>>                       <&cpu_l3>;
>>>>     =20
>>>>      };
>>>>     =20
>>>>      pmu_a72 {
>>>>     =20
>>>>          compatible =3D "arm,cortex-a72-pmu";
>>>>          interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>>          interrupt-affinity =3D <&cpu_b0>,
>>>>         =20
>>>>                       <&cpu_b1>;
>>>>     =20
>>>>      };
>>>>
>>>> but unfortunately, the arm pmu driver do not support PPI in two cl=
uster
>>>> well,
>>>> so we have to replace with this implementation.
>>>>
>>>>> In this case things are messier as the same PPI number is being u=
sed
>>>>> across clusters. Marc (Cc'd) has been working on PPI partitions, =
which
>>>>> should allow us to support that.
>>>> Great! So what we can do right now? Wait this feature, and delete
>>>> arm-pmu node?
>>> I'd rather you have a look at the patches, test them with your HW,
>>> and comment on what doesn't work!
>> I would think we could do it in two tracks, testing and fixing but a=
lso letting
>> the rk3399 devicetrees move forward without the pmu at first :-) .
> Where would the fun be then? ;-)
thanks for your advices, and I will try to test the percpu-partition=20
patches.

by the way, do you think it's better to let the dtsi be reviewed first,
then the percpu-partition patches could be tested by more people ?

Jianqun
>
> 	M.
