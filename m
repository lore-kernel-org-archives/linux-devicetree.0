Return-Path: <SRS0=JUtF=N6=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <1be47ef6-1a92-e032-12c1-1deae5b67960@linaro.org>
 <OSBPR01MB210312547BBCBBC9FC01A616B8D80@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <67cf2385-9379-f02a-36fd-b2e07dfd5497@linaro.org>
 <TYAPR01MB2111A4092907D265493DDF3FB8D80@TYAPR01MB2111.jpnprd01.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <dbc5f62d-aff0-8c6a-e957-e7dea15cc002@linaro.org>
Date: Mon, 19 Nov 2018 18:14:37 +0100
MIME-Version: 1.0
In-Reply-To: <TYAPR01MB2111A4092907D265493DDF3FB8D80@TYAPR01MB2111.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On 19/11/2018 16:50, Biju Das wrote:
> Hi Daniel,
> 
> Thanks for the feedback.
> 
>>>> Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device
>>>> nodes
>>>>
>>>> On 26/10/2018 10:25, Biju Das wrote:
>>>>> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>>>> ---
>>>>> This patch is tested against renesas-dev
>>>>>
>>>>> I have executed on inconsistency-check, nanosleep and
>>>>> clocksource_switch selftests on this arm64 SoC. The
>>>>> inconsistency-check and nanosleep tests are working fine.The
>>>>> clocksource_switch asynchronous test is failing due to
>>>>> inconsistency-check
>>>> failure on "arch_sys_counter".
>>>>>
>>>>> But if i skip the clocksource_switching of "arch_sys_counter", the
>>>>> asynchronous test is passing for CMT0/1/2/3 timer.
>>>>>
>>>>> Has any one noticed this issue?
>>>>
>>>> So now that you mention that, I've been through the
>>>> clocksource_switch on another ARM64 platform (hikey960) and disabled
>>>> the
>>>> ARM64_ERRATUM_858921 config option. I can see the same issue.
>>>>
>>>> Is this option set on your config ?
>>>
>>> No.  As per  " config ARM64_ERRATUM_858921", it is "Workaround for
>> Cortex-A73 erratum 858921"
>>>
>>> Our SoC is 2xCA-57 + 4 x CA-53.  Does  it impact CA-57 + CA_53?
>>
>> Dunno :/
>>
>>> Any way I will enable this config option and will provide you the results.
>>
>> Ok, thanks!
> 
> The following config is enabled by default on upstream kernel(4.20-rc3)
> CONFIG_ARM_ARCH_TIMER_EVTSTREAM=y
> CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND=y
> CONFIG_FSL_ERRATUM_A008585=y
> CONFIG_HISILICON_ERRATUM_161010101=y
> CONFIG_ARM64_ERRATUM_858921=y
> 
> For a quick testing,  I have activated the erratum using the property "fsl,erratum-a008585" on device tree.
> With this I confirm the issue is fixed.
> 
> I have  some questions on this.
> 1) Based  on the test result ,do you think renesas soc also  impacted by the ARM64_ERRATUM_858921?
> 2) Is there any way to find, is this Erratum actually causing the asynchronous test to fail?

I guess, you can hack the __fsl_a008585_read_reg macro and check if the
invalid condition is reached.

This thread https://lkml.org/lkml/2018/5/10/773 will give you all the
answers you are looking for (well very likely).

Let me know if it helped.


> timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
>                                       <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
>                                       <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
>                                       <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
> +                fsl,erratum-a008585;
> }




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
