From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 10 Jun 2019 14:19:21 +0100
Message-ID: <20190610131921.GB14647@lakrids.cambridge.arm.com>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190610121346.15779-1-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abelvesa@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Bai Ping <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 03:13:44PM +0300, Abel Vesa wrote:
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

IIUC from last time [1,2], this erratum affects all interrupts
targetting teh idle CPU, not just IPIs, so even if the bodge is more
self-contained, it doesn't really solve the issue, and there are still
cases where a CPU will not be woken from idle when it should be (e.g.
upon receipt of an LPI).

IIUC, Marc, Lorenzo, and Rafael [1,2,3] all thought that that this was
not worthwhile. What's changed?

Thanks,
Mark.

[1] https://lkml.org/lkml/2019/3/28/197
[2] https://lkml.org/lkml/2019/3/28/203
[3] https://lkml.org/lkml/2019/3/28/198

> 
> I also have the patches ready for TF-A but I'll hold on to them until I see if
> this has a chance of getting in.
> 
> Abel Vesa (2):
>   irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ ERR11171
>   arm64: dts: imx8mq: Add idle states and gpcv2 wake_request broken
>     property
> 
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 20 +++++++++++++++
>  drivers/irqchip/irq-imx-gpcv2.c           | 42 +++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> -- 
> 2.7.4
> 
