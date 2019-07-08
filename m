From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 8 Jul 2019 14:20:02 +0200
Message-ID: <c8cd5b59-5bd3-1b89-62db-497ffede3918@posteo.de>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <d217a9d2-fc60-e057-6775-116542e39e8d@posteo.de>
 <20190628085417.vezkoizip75yjjpl@fsr-ub1664-175>
 <a6ea252e-cfd4-0816-e688-3d792e956711@posteo.de>
 <20190702113305.zo2w5xkfhsfpwrx7@fsr-ub1664-175>
 <9bf3c0d4-7a15-90a0-fbe9-336b855faf81@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9bf3c0d4-7a15-90a0-fbe9-336b855faf81@posteo.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jacky Bai <ping.bai@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Abel Vesa <abelvesa@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 08.07.19 09:54, Martin Kepplinger wrote:
> On 02.07.19 13:33, Abel Vesa wrote:
>> On 19-07-02 08:47:19, Martin Kepplinger wrote:
>>> On 28.06.19 10:54, Abel Vesa wrote:
>>>> On 19-06-23 13:47:26, Martin Kepplinger wrote:
>>>>> On 10.06.19 14:13, Abel Vesa wrote:
>>>>>> This is another alternative for the RFC:
>>>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2019%2F3%2F27%2F545&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7Ccfc582f9977d479b7dda08d6feb9258a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636976468485275045&amp;sdata=L%2Byn29%2FBS3KMjm9eCPBTZBTl30PmZywSjIj11bMQw5c%3D&amp;reserved=0
>>>>>>
>>>>>> This new workaround proposal is a little bit more hacky but more contained
>>>>>> since everything is done within the irq-imx-gpcv2 driver.
>>>>>>
>>>>>> Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_call
>>>>>> handler and registers instead a wrapper which calls in the 'hijacked' 
>>>>>> handler, after that calling into EL3 which will take care of the actual
>>>>>> wake up. This time, instead of expanding the PSCI ABI, we use a new vendor SIP.
>>>>>>
>>>>>> I also have the patches ready for TF-A but I'll hold on to them until I see if
>>>>>> this has a chance of getting in.
>>>>>
>>>>> Let's leave out of the picture for now, how generally applicable and
>>>>> mergable your changes are. I'd like to reproduce what you do and test
>>>>> cpuidle on imx8mq:
>>>>>
>>>>> When applying your changes here and the corresponding ATF changes (
>>>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fabelvesa%2Farm-trusted-firmware%2Ftree%2Fimx8mq-err11171&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7Ccfc582f9977d479b7dda08d6feb9258a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636976468485275045&amp;sdata=VT3duSl70DNxcY8Ev4FFrHlWoOjkcckeM8BgxrSkr8A%3D&amp;reserved=0 if
>>>>> I got that right) I don't yet see any difference in the SoC heating up
>>>>> under zero load. __cpu_do_idle() is called about every 1ms (without your
>>>>> changes, that was even more often but I'm not yet sure if that means
>>>>> anything).
>>>>
>>>> You will most probably not see any change in the SoC temp since the cpuidle
>>>> only touches the A53s. There are way many more IPs in the SoC that could
>>>> heat it up. If you want some real numbers you'll have to measure the power
>>>> consumtion on VDD_ARM rail. If you don't want to go through that much trouble
>>>> you can use the idlestat tool to measure the times each A53 speends in cpu-sleep
>>>> state.
>>>>
>>>>>
>>>>> What I also see is that I get about 10x more "arch_timer" (int.3, GICv3)
>>>>> interrupts than without your changes.
>>>
>>>
>>> thanks for getting back at me here. This is run on the imx8mq
>>> librem5-devkit with your wakeup-workaround applied. Typical measurements
>>> under zero load look like this:
>>>
>>> sudo idlestat --trace -f /tmp/mytrace -t 10 -p -c -w
>>> Log is 10.000395 secs long with 31194 events
>>> ------------------------------------------------------------------------
>>> | C-state  |  min   |  max    |  avg    |  total | hits | over | under |
>>> ------------------------------------------------------------------------
>>> | clusterA                                                             |
>>> ------------------------------------------------------------------------
>>> |     WFI |   14us |  3.99ms |  3.90ms |   9.93s | 2543 |    0 |     0 |
>>> ------------------------------------------------------------------------
>>> |          cpu0                                                        |
>>> ------------------------------------------------------------------------
>>> |     WFI |   14us |  3.99ms |  3.89ms |   9.96s | 2561 |    0 |     0 |
>>> ------------------------------------------------------------------------
>>> ...
>>>
>>
>> I don't see the cpu-sleep state at all in your idlestat log. Maybe the cpuidle
>> isn't enabled. Or probably the workaround itself is not applied. You'll have
>> to look into that.
>>
>> Here is how it looks like with the workaround enabled:
>>
>> Log is 10.001685 secs long with 1175 events
>> --------------------------------------------------------------------------------
>> | C-state  |   min    |   max    |   avg    |   total  | hits  |  over | under |
>> --------------------------------------------------------------------------------
>> | clusterA                                                                     |
>> --------------------------------------------------------------------------------
>> |      WFI |      2us |  50.04ms |  29.63ms |    9.99s |   337 |     0 |     0 |
>> --------------------------------------------------------------------------------
>> |             cpu0                                                             |
>> --------------------------------------------------------------------------------
>> |      WFI |     11us |  50.04ms |  40.44ms |    9.62s |   238 |     0 |   219 |
>> | cpu-sleep |    537us |  50.58ms |  14.11ms | 366.94ms |    26 |     7 |     0 |
>> --------------------------------------------------------------------------------
>> |             cpu1                                                             |
>> --------------------------------------------------------------------------------
>> |      WFI |     11us | 539.04ms |  93.20ms |    5.78s |    62 |     0 |    38 |
>> | cpu-sleep |    536us | 607.90ms | 183.38ms |    4.22s |    23 |    12 |     0 |
>> --------------------------------------------------------------------------------
>> |             cpu2                                                             |
>> --------------------------------------------------------------------------------
>> |      WFI |     41us | 265.99ms |  17.51ms | 332.66ms |    19 |     0 |    11 |
>> | cpu-sleep |    568us |    6.56s |    1.38s |    9.67s |     7 |     2 |     0 |
>> --------------------------------------------------------------------------------
>> |             cpu3                                                             |
>> --------------------------------------------------------------------------------
>> |      WFI |   7.94ms | 881.50ms | 367.81ms |    1.10s |     3 |     0 |     3 |
>> | cpu-sleep |    549us |    2.02s | 808.72ms |    8.90s |    11 |     1 |     0 |
>> --------------------------------------------------------------------------------
>>
>> You can see that the cpu2 was once for 6.56 seconds (out of 10s) in cpu-sleep.
>>
> 
> So I run this ATF tree
> https://github.com/abelvesa/arm-trusted-firmware/tree/imx8mq-err11171
> and, on top of "v5.2-rc7" I have your commits
> ("irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ ERR11171") and
> ("arm64: dts: imx8mq: Add idle states and gpcv2 wake_request broken
> property") applied.
> 
> Then simply enabled CONFIG_ARM_CPUIDLE.
> 
> (I also use the "imx-cpufreq-dt" driver, but this should be unrelated here).
> 
> I do see the possible cpuidle states:
> /sys/devices/system/cpu/cpu0/cpuidle$ cat state*/name
> 
> WFI
> 
> cpu-sleep
> 
> but idlestat doesn't see it or it is (thus) never used. Do you know a
> needed change I might be missing?
> 

looks like I mess things up myself here and somehow prevent
cpu_pm_enter() from being called...
