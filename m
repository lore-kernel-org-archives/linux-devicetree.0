From: Abel Vesa <abelvesa@gmail.com>
Subject: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 10 Jun 2019 15:13:44 +0300
Message-ID: <20190610121346.15779-1-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Bai Ping <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: devicetree@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is another alternative for the RFC:
https://lkml.org/lkml/2019/3/27/545

This new workaround proposal is a little bit more hacky but more contained
since everything is done within the irq-imx-gpcv2 driver.

Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_call
handler and registers instead a wrapper which calls in the 'hijacked' 
handler, after that calling into EL3 which will take care of the actual
wake up. This time, instead of expanding the PSCI ABI, we use a new vendor SIP.

I also have the patches ready for TF-A but I'll hold on to them until I see if
this has a chance of getting in.

Abel Vesa (2):
  irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ ERR11171
  arm64: dts: imx8mq: Add idle states and gpcv2 wake_request broken
    property

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 20 +++++++++++++++
 drivers/irqchip/irq-imx-gpcv2.c           | 42 +++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

-- 
2.7.4
