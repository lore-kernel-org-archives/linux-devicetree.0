From: "Huang, Tao" <huangtao@rock-chips.com>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
Date: Mon, 25 Apr 2016 18:19:28 +0800
Message-ID: <571DEF30.90604@rock-chips.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
 <1461211092-26331-1-git-send-email-jay.xu@rock-chips.com>
 <20160421101930.GG6879@leverpostej> <5718AFB8.5070004@rock-chips.com>
 <20160421123018.096d4a75@arm.com> <571DE803.3010902@rock-chips.com>
 <20160425100531.GC25087@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160425100531.GC25087@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, devicetree@vger.kernel.org, davidriley@chromium.org, heiko@sntech.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org, smbarber@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, jwerner@chromium.org, linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Mark:
On 2016=E5=B9=B404=E6=9C=8825=E6=97=A5 18:05, Mark Rutland wrote:
> On Mon, Apr 25, 2016 at 05:48:51PM +0800, Huang, Tao wrote:
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
> That Cortex-A57 PMU fallback should just go. We already have Cortex-A=
72
> PMU support upstream, and I believe there are sufficient differences
> such that the Cortex-A72 PMU is not a strict superset of the Cortex-A=
57
> PMU.
As I say, I tested on v4.4, I don't back port
arch/arm64/kernel/perf_event.c, so I use "arm,cortex-a57-pmu". Upstream
will use "arm,cortex-a72-pmu" only.
BTW, I don't see any differences between A72/A57 in source code:

static int armv8_a57_pmu_init(struct arm_pmu *cpu_pmu)
{
        armv8_pmu_init(cpu_pmu);
        cpu_pmu->name                   =3D "armv8_cortex_a57";
        cpu_pmu->map_event              =3D armv8_a57_map_event;
        cpu_pmu->pmu.attr_groups        =3D armv8_pmuv3_attr_groups;
        return armv8pmu_probe_num_events(cpu_pmu);
}

static int armv8_a72_pmu_init(struct arm_pmu *cpu_pmu)
{
        armv8_pmu_init(cpu_pmu);
        cpu_pmu->name                   =3D "armv8_cortex_a72";
        cpu_pmu->map_event              =3D armv8_a57_map_event;
        cpu_pmu->pmu.attr_groups        =3D armv8_pmuv3_attr_groups;
        return armv8pmu_probe_num_events(cpu_pmu);
}

static const struct of_device_id armv8_pmu_of_device_ids[] =3D {
=2E..
        {.compatible =3D "arm,cortex-a57-pmu",    .data =3D armv8_a57_p=
mu_init},
        {.compatible =3D "arm,cortex-a72-pmu",    .data =3D armv8_a72_p=
mu_init},
=2E..
        {},
};

>
>>         interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part1>;
>>         interrupt-affinity =3D <&cpu_b0>,
>>                      <&cpu_b1>;
>>     };
>>
>> It can boot. And I test with Android simpleperf stat and perf top, i=
t works!
>> So these patches work on RK3399.
> There is still work to do in the driver, as Marc pointed out.
>
> While it may appear to work, it will be requesting percpu IRQs on wro=
ng
> CPUs (e.g. see how cpu_pmu_request_irq calls cpu_pmu_enable_percpu_ir=
q,
> on each CPU), and we will need to update the binding codument to cove=
r
> this case.
I also set interrupt-affinity, maybe this avoid problem. I add some
debug print on driver, I believe irq is request on right cpus.

Thanks,
Huang Tao
