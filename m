From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Mon, 25 Apr 2016 11:06:52 +0100
Message-ID: <571DEC3C.9070209@arm.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
 <1461211092-26331-1-git-send-email-jay.xu@rock-chips.com>
 <20160421101930.GG6879@leverpostej> <5718AFB8.5070004@rock-chips.com>
 <20160421123018.096d4a75@arm.com> <571DE803.3010902@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571DE803.3010902-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Huang, Tao" <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/04/16 10:48, Huang, Tao wrote:
> Hi, Marc:
> On 2016=E5=B9=B404=E6=9C=8821=E6=97=A5 19:30, Marc Zyngier wrote:
>> On Thu, 21 Apr 2016 18:47:20 +0800
>> "Huang, Tao" <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>
>>> Hi, Mark:
>>> On 2016=E5=B9=B404=E6=9C=8821=E6=97=A5 18:19, Mark Rutland wrote:
>>>> On Thu, Apr 21, 2016 at 11:58:12AM +0800, Jianqun Xu wrote:
>>>>> +		cpu_l0: cpu@0 {
>>>>> +			device_type =3D "cpu";
>>>>> +			compatible =3D "arm,cortex-a53", "arm,armv8";
>>>>> +			reg =3D <0x0 0x0>;
>>>>> +			enable-method =3D "psci";
>>>>> +			#cooling-cells =3D <2>; /* min followed by max */
>>>>> +			clocks =3D <&cru ARMCLKL>;
>>>>> +		};
>>>>> +		cpu_b0: cpu@100 {
>>>>> +			device_type =3D "cpu";
>>>>> +			compatible =3D "arm,cortex-a72", "arm,armv8";
>>>>> +			reg =3D <0x0 0x100>;
>>>>> +			enable-method =3D "psci";
>>>>> +			#cooling-cells =3D <2>; /* min followed by max */
>>>>> +			clocks =3D <&cru ARMCLKB>;
>>>>> +		};
>>>>> +
>>>>> +	arm-pmu {
>>>>> +		compatible =3D "arm,armv8-pmuv3";
>>>>> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>>> +	};
>>>> This is wrong, and must go. There should be a separate node for th=
e PMU
>>>> of each microarchitecture, with the appropriate compatible string =
to
>>>> represent that (see the juno dts).
>>> You are right. The first version we wrote is:
>>>     pmu_a53 {
>>>         compatible =3D "arm,cortex-a53-pmu";
>>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>         interrupt-affinity =3D <&cpu_l0>,
>>>                      <&cpu_l1>,
>>>                      <&cpu_l2>,
>>>                      <&cpu_l3>;
>>>     };
>>>
>>>     pmu_a72 {
>>>         compatible =3D "arm,cortex-a72-pmu";
>>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>         interrupt-affinity =3D <&cpu_b0>,
>>>                      <&cpu_b1>;
>>>     };
>>> but unfortunately, the arm pmu driver do not support PPI in two clu=
ster
>>> well,
>>> so we have to replace with this implementation.
>>>> In this case things are messier as the same PPI number is being us=
ed
>>>> across clusters. Marc (Cc'd) has been working on PPI partitions, w=
hich
>>>> should allow us to support that.
>>> Great! So what we can do right now? Wait this feature, and delete
>>> arm-pmu node?
>> I'd rather you have a look at the patches, test them with your HW,
>> and comment on what doesn't work!
>>
>> You can find the patches over there:
>>
>> https://lkml.org/lkml/2016/4/11/182
>>
>> and on the following branch:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
>> irq/percpu-partition
>=20
> I tested these patches. Because our kernel is based on v4.4, so I bac=
k
> port most changes about
> include/linux/irqdomain.h
> kernel/irq/irqdomain.c
> drivers/irqchip/irq-gic-v3.c
> and change rk3399.dtsi base on your arm,gic-v3.txt:
>=20
>      gic: interrupt-controller@fee00000 {
>          compatible =3D "arm,gic-v3";
> -        #interrupt-cells =3D <3>;
> +        #interrupt-cells =3D <4>;
>          #address-cells =3D <2>;
>          #size-cells =3D <2>;
> ...
> +
> +        ppi-partitions {
> +            part0: interrupt-partition-0 {
> +                affinity =3D <&cpu_l0 &cpu_l1 &cpu_l2 &cpu_l3>;
> +            };
> +
> +            part1: interrupt-partition-1 {
> +                affinity =3D <&cpu_b0 &cpu_b1>;
> +            };
> +        };
>=20
> and change every interrupts from three cells to four cells, such as
>      saradc: saradc@ff100000 {
>          compatible =3D "rockchip,rk3399-saradc";
>          reg =3D <0x0 0xff100000 0x0 0x100>;
> -        interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>;
>          #io-channel-cells =3D <1>;
>          clocks =3D <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
>          clock-names =3D "saradc", "apb_pclk";
>=20
> and pmu define as:
>     pmu_a53 {
>         compatible =3D "arm,cortex-a53-pmu";
>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part0>;
>         interrupt-affinity =3D <&cpu_l0>,
>                      <&cpu_l1>,
>                      <&cpu_l2>,
>                      <&cpu_l3>;
>     };
>=20
>     pmu_a72 {
>         compatible =3D "arm,cortex-a72-pmu", "arm,cortex-a57-pmu";
>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part1>;
>         interrupt-affinity =3D <&cpu_b0>,
>                      <&cpu_b1>;
>     };
>=20
> It can boot. And I test with Android simpleperf stat and perf top, it=
 works!
> So these patches work on RK3399.

Good, thanks for testing.

> But as I mentioned, we must change every interrupt in dts, do you thi=
nk
> this is acceptable?

I can't see why not.

>>
>> Of course, you'll have to hack a bit in the PMU code to make it
>> understand per-PMU affinity together with percpu interrupts, but it
>> wouldn't be fun if there was nothing to do...
> I don't change drivers/perf/arm_pmu.c, it just work.

Having had a look with Mark, it may work, but it is rather unsafe. I ma=
y
have a go at it, but I'm going to have to rely on you to test it (or yo=
u
can send me a board ;-).

Thanks,

	M.
--=20
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
