From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Tue, 2 Jul 2019 08:47:19 +0200
Message-ID: <a6ea252e-cfd4-0816-e688-3d792e956711@posteo.de>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <d217a9d2-fc60-e057-6775-116542e39e8d@posteo.de>
 <20190628085417.vezkoizip75yjjpl@fsr-ub1664-175>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628085417.vezkoizip75yjjpl@fsr-ub1664-175>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jacky Bai <ping.bai@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Abel Vesa <abelvesa@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pen>
List-Id: devicetree@vger.kernel.org

On 28.06.19 10:54, Abel Vesa wrote:
> On 19-06-23 13:47:26, Martin Kepplinger wrote:
>> On 10.06.19 14:13, Abel Vesa wrote:
>>> This is another alternative for the RFC:
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2019%2F3%2F27%2F545&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C6c9d12c1017745750e3908d6f7d0935a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636968872531886931&amp;sdata=DAN3TVPD%2FaQzseYUYAjsnfQM6odM1x8qzsVVslFXAnY%3D&amp;reserved=0
>>>
>>> This new workaround proposal is a little bit more hacky but more contained
>>> since everything is done within the irq-imx-gpcv2 driver.
>>>
>>> Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_call
>>> handler and registers instead a wrapper which calls in the 'hijacked' 
>>> handler, after that calling into EL3 which will take care of the actual
>>> wake up. This time, instead of expanding the PSCI ABI, we use a new vendor SIP.
>>>
>>> I also have the patches ready for TF-A but I'll hold on to them until I see if
>>> this has a chance of getting in.
>>
>> Let's leave out of the picture for now, how generally applicable and
>> mergable your changes are. I'd like to reproduce what you do and test
>> cpuidle on imx8mq:
>>
>> When applying your changes here and the corresponding ATF changes (
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fabelvesa%2Farm-trusted-firmware%2Ftree%2Fimx8mq-err11171&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C6c9d12c1017745750e3908d6f7d0935a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636968872531886931&amp;sdata=nB%2FYGkuRrJYwoBJ1afTjIhoadn9Pn3c2QqRFnShWS0c%3D&amp;reserved=0 if
>> I got that right) I don't yet see any difference in the SoC heating up
>> under zero load. __cpu_do_idle() is called about every 1ms (without your
>> changes, that was even more often but I'm not yet sure if that means
>> anything).
> 
> You will most probably not see any change in the SoC temp since the cpuidle
> only touches the A53s. There are way many more IPs in the SoC that could
> heat it up. If you want some real numbers you'll have to measure the power
> consumtion on VDD_ARM rail. If you don't want to go through that much trouble
> you can use the idlestat tool to measure the times each A53 speends in cpu-sleep
> state.
> 
>>
>> What I also see is that I get about 10x more "arch_timer" (int.3, GICv3)
>> interrupts than without your changes.


thanks for getting back at me here. This is run on the imx8mq
librem5-devkit with your wakeup-workaround applied. Typical measurements
under zero load look like this:

sudo idlestat --trace -f /tmp/mytrace -t 10 -p -c -w
Log is 10.000395 secs long with 31194 events
------------------------------------------------------------------------
| C-state  |  min   |  max    |  avg    |  total | hits | over | under |
------------------------------------------------------------------------
| clusterA                                                             |
------------------------------------------------------------------------
|     WFI |   14us |  3.99ms |  3.90ms |   9.93s | 2543 |    0 |     0 |
------------------------------------------------------------------------
|          cpu0                                                        |
------------------------------------------------------------------------
|     WFI |   14us |  3.99ms |  3.89ms |   9.96s | 2561 |    0 |     0 |
------------------------------------------------------------------------
...


with IRQs coming in:

-------------------------------------------------------
| IRQ |       Name      |  Count  |  early  |  late   |
-------------------------------------------------------
|             cpu0                                    |
-------------------------------------------------------
| IPI | Reschedulin     |      11 |       0 |       0 |
| 3   | arch_timer      |    2505 |       0 |       0 |
| 41  | 30be0000.ethern |      11 |       0 |       0 |
| 36  | mmc0            |       6 |       0 |       0 |
| 33  | 30a20000.i2c    |      12 |       0 |       0 |
| 40  | 30be0000.ethern |       1 |       0 |       0 |
| 43  | 38000000.gpu    |       2 |       0 |       0 |
| 208 | dcss_drm        |      12 |       0 |       0 |
| 207 | dcss_ctxld      |       2 |       0 |       0 |
-------------------------------------------------------
|             cpu1                                    |
-------------------------------------------------------
| IPI | Reschedulin     |      13 |       0 |       0 |
| 3   | arch_timer      |    2500 |       0 |       0 |
| IPI | Functio         |       1 |       0 |       0 |
...


So we seem to spend most of the time in C1/WFI. As mentioned,
"arch_timer" wakes up the cpu often.

Why is that? Do these measurements look like what you would expect them
to be?

(I'm not sure how much sense it makes to come up with something to
compare these to)

thanks a lot,

                                martin
