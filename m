From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Mon, 25 Apr 2016 11:39:07 +0100
Message-ID: <571DF3CB.3030904@arm.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
 <1461211092-26331-1-git-send-email-jay.xu@rock-chips.com>
 <20160421101930.GG6879@leverpostej> <5718AFB8.5070004@rock-chips.com>
 <20160421123018.096d4a75@arm.com> <571DE803.3010902@rock-chips.com>
 <571DEC3C.9070209@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <571DEC3C.9070209@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Huang, Tao" <huangtao@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, davidriley@chromium.org, heiko@sntech.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org, smbarber@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, jwerner@chromium.org, linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 25/04/16 11:06, Marc Zyngier wrote:
> On 25/04/16 10:48, Huang, Tao wrote:
>> Hi, Marc:
>> On 2016=E5=B9=B404=E6=9C=8821=E6=97=A5 19:30, Marc Zyngier wrote:
>>> On Thu, 21 Apr 2016 18:47:20 +0800
>>> "Huang, Tao" <huangtao@rock-chips.com> wrote:
>>>
>>>> Hi, Mark:
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
>>>>     pmu_a53 {
>>>>         compatible =3D "arm,cortex-a53-pmu";
>>>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>>         interrupt-affinity =3D <&cpu_l0>,
>>>>                      <&cpu_l1>,
>>>>                      <&cpu_l2>,
>>>>                      <&cpu_l3>;
>>>>     };
>>>>
>>>>     pmu_a72 {
>>>>         compatible =3D "arm,cortex-a72-pmu";
>>>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>>>>         interrupt-affinity =3D <&cpu_b0>,
>>>>                      <&cpu_b1>;
>>>>     };
>>>> but unfortunately, the arm pmu driver do not support PPI in two cl=
uster
>>>> well,
>>>> so we have to replace with this implementation.
>>>>> In this case things are messier as the same PPI number is being u=
sed
>>>>> across clusters. Marc (Cc'd) has been working on PPI partitions, =
which
>>>>> should allow us to support that.
>>>> Great! So what we can do right now? Wait this feature, and delete
>>>> arm-pmu node?
>>> I'd rather you have a look at the patches, test them with your HW,
>>> and comment on what doesn't work!
>>>
>>> You can find the patches over there:
>>>
>>> https://lkml.org/lkml/2016/4/11/182
>>>
>>> and on the following branch:
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
>>> irq/percpu-partition
>>
>> I tested these patches. Because our kernel is based on v4.4, so I ba=
ck
>> port most changes about
>> include/linux/irqdomain.h
>> kernel/irq/irqdomain.c
>> drivers/irqchip/irq-gic-v3.c
>> and change rk3399.dtsi base on your arm,gic-v3.txt:
>>
>>      gic: interrupt-controller@fee00000 {
>>          compatible =3D "arm,gic-v3";
>> -        #interrupt-cells =3D <3>;
>> +        #interrupt-cells =3D <4>;
>>          #address-cells =3D <2>;
>>          #size-cells =3D <2>;
>> ...
>> +
>> +        ppi-partitions {
>> +            part0: interrupt-partition-0 {
>> +                affinity =3D <&cpu_l0 &cpu_l1 &cpu_l2 &cpu_l3>;
>> +            };
>> +
>> +            part1: interrupt-partition-1 {
>> +                affinity =3D <&cpu_b0 &cpu_b1>;
>> +            };
>> +        };
>>
>> and change every interrupts from three cells to four cells, such as
>>      saradc: saradc@ff100000 {
>>          compatible =3D "rockchip,rk3399-saradc";
>>          reg =3D <0x0 0xff100000 0x0 0x100>;
>> -        interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH 0>;
>>          #io-channel-cells =3D <1>;
>>          clocks =3D <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
>>          clock-names =3D "saradc", "apb_pclk";
>>
>> and pmu define as:
>>     pmu_a53 {
>>         compatible =3D "arm,cortex-a53-pmu";
>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part0>;
>>         interrupt-affinity =3D <&cpu_l0>,
>>                      <&cpu_l1>,
>>                      <&cpu_l2>,
>>                      <&cpu_l3>;
>>     };
>>
>>     pmu_a72 {
>>         compatible =3D "arm,cortex-a72-pmu", "arm,cortex-a57-pmu";
>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part1>;
>>         interrupt-affinity =3D <&cpu_b0>,
>>                      <&cpu_b1>;
>>     };
>>
>> It can boot. And I test with Android simpleperf stat and perf top, i=
t works!
>> So these patches work on RK3399.
>=20
> Good, thanks for testing.
>=20
>> But as I mentioned, we must change every interrupt in dts, do you th=
ink
>> this is acceptable?
>=20
> I can't see why not.
>=20
>>>
>>> Of course, you'll have to hack a bit in the PMU code to make it
>>> understand per-PMU affinity together with percpu interrupts, but it
>>> wouldn't be fun if there was nothing to do...
>> I don't change drivers/perf/arm_pmu.c, it just work.
>=20
> Having had a look with Mark, it may work, but it is rather unsafe. I =
may
> have a go at it, but I'm going to have to rely on you to test it (or =
you
> can send me a board ;-).

I came up with the following (untested) patch. Please let me know if th=
is
works for you.

Thanks,

	M.

=46rom b88c08bb689d3fe40c46788453a07ba22dae9220 Mon Sep 17 00:00:00 200=
1
=46rom: Marc Zyngier <marc.zyngier@arm.com>
Date: Mon, 25 Apr 2016 11:23:54 +0100
Subject: [PATCH] drivers/perf: arm-pmu: Handle per-interrupt affinity m=
ask

On a big-little system, PMUs can be wired to CPUs using per CPU
interrups (PPI). In this case, it is important to make sure that
the enable/disable do happen on the right set of CPUs.

Do this by querying the corresponding cpumask on the corresponding
paths

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 drivers/perf/arm_pmu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index f700908..3de5e1c 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -603,7 +603,11 @@ static void cpu_pmu_free_irq(struct arm_pmu *cpu_p=
mu)
=20
 	irq =3D platform_get_irq(pmu_device, 0);
 	if (irq >=3D 0 && irq_is_percpu(irq)) {
-		on_each_cpu(cpu_pmu_disable_percpu_irq, &irq, 1);
+		struct cpumask ppi_cpumask;
+
+		irq_get_percpu_devid_partition(irq, &ppi_cpumask);
+		on_each_cpu_mask(&ppi_cpumask, cpu_pmu_disable_percpu_irq,
+				 &irq, 1);
 		free_percpu_irq(irq, &hw_events->percpu_pmu);
 	} else {
 		for (i =3D 0; i < irqs; ++i) {
@@ -638,6 +642,8 @@ static int cpu_pmu_request_irq(struct arm_pmu *cpu_=
pmu, irq_handler_t handler)
=20
 	irq =3D platform_get_irq(pmu_device, 0);
 	if (irq >=3D 0 && irq_is_percpu(irq)) {
+		struct cpumask ppi_cpumask;
+
 		err =3D request_percpu_irq(irq, handler, "arm-pmu",
 					 &hw_events->percpu_pmu);
 		if (err) {
@@ -645,7 +651,10 @@ static int cpu_pmu_request_irq(struct arm_pmu *cpu=
_pmu, irq_handler_t handler)
 				irq);
 			return err;
 		}
-		on_each_cpu(cpu_pmu_enable_percpu_irq, &irq, 1);
+
+		irq_get_percpu_devid_partition(irq, &ppi_cpumask);
+		on_each_cpu_mask(&ppi_cpumask, cpu_pmu_enable_percpu_irq,
+				 &irq, 1);
 	} else {
 		for (i =3D 0; i < irqs; ++i) {
 			int cpu =3D i;
--=20
2.1.4

--=20
Jazz is not dead. It just smells funny...
