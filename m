From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Sun, 23 Jun 2019 13:47:26 +0200
Message-ID: <d217a9d2-fc60-e057-6775-116542e39e8d@posteo.de>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610121346.15779-1-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abelvesa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Bai Ping <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: devicetree@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10.06.19 14:13, Abel Vesa wrote:
> This is another alternative for the RFC:
> https://lkml.org/lkml/2019/3/27/545
> 
> This new workaround proposal is a little bit more hacky but more contained
> since everything is done within the irq-imx-gpcv2 driver.
> 
> Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_call
> handler and registers instead a wrapper which calls in the 'hijacked' 
> handler, after that calling into EL3 which will take care of the actual
> wake up. This time, instead of expanding the PSCI ABI, we use a new vendor SIP.
> 
> I also have the patches ready for TF-A but I'll hold on to them until I see if
> this has a chance of getting in.

Let's leave out of the picture for now, how generally applicable and
mergable your changes are. I'd like to reproduce what you do and test
cpuidle on imx8mq:

When applying your changes here and the corresponding ATF changes (
https://github.com/abelvesa/arm-trusted-firmware/tree/imx8mq-err11171 if
I got that right) I don't yet see any difference in the SoC heating up
under zero load. __cpu_do_idle() is called about every 1ms (without your
changes, that was even more often but I'm not yet sure if that means
anything).

What I also see is that I get about 10x more "arch_timer" (int.3, GICv3)
interrupts than without your changes.

What am I doing wrong? I'd be happy to test, again, regardless of how
acceptable the workaround is in the end.

thanks,

                                  martin
