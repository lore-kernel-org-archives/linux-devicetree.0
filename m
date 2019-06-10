From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 10 Jun 2019 13:29:11 +0000
Message-ID: <20190610132910.srd4j2gtidjeppdx@fsr-ub1664-175>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610131921.GB14647@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190610131921.GB14647@lakrids.cambridge.arm.com>
Content-Language: en-US
Content-ID: <FE565A73B09DD54A9E4FF7ECB4905445@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Jacky Bai <ping.bai@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Marc Zyngier <marc.zyngier@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Abel Vesa <abelvesa@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 19-06-10 14:19:21, Mark Rutland wrote:
> On Mon, Jun 10, 2019 at 03:13:44PM +0300, Abel Vesa wrote:
> > This is another alternative for the RFC:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2019%2F3%2F27%2F545&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C05d512f83dfa4d4f52d908d6eda64321%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C636957695741584637&amp;sdata=d3X0xyWiaotq4VPNW306wdRhsY4TI%2BBjRSABk6vzf%2B8%3D&amp;reserved=0
> > 
> > This new workaround proposal is a little bit more hacky but more contained
> > since everything is done within the irq-imx-gpcv2 driver.
> > 
> > Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_call
> > handler and registers instead a wrapper which calls in the 'hijacked' 
> > handler, after that calling into EL3 which will take care of the actual
> > wake up. This time, instead of expanding the PSCI ABI, we use a new vendor SIP.
> 
> IIUC from last time [1,2], this erratum affects all interrupts
> targetting teh idle CPU, not just IPIs, so even if the bodge is more
> self-contained, it doesn't really solve the issue, and there are still
> cases where a CPU will not be woken from idle when it should be (e.g.
> upon receipt of an LPI).
> 

Wrong, this erratum does not affect any other type of interrupts, other
than IPIs. That is because all the other interrupts go through GPC,
which means the cores will wake up on any other type (again, other than IPI).

> IIUC, Marc, Lorenzo, and Rafael [1,2,3] all thought that that this was
> not worthwhile. What's changed?

The fact that this is done in the imx-gpcv2 driver and it's not spread
around like the old RFC. Yes, I agree that fixing something like this
from the core subsystems (like cpuidle) or irq-gic-v3 driver is a bad
idea, but this is not the case anymore with this new RFC.

> 
> Thanks,
> Mark.
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2019%2F3%2F28%2F197&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C05d512f83dfa4d4f52d908d6eda64321%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C636957695741584637&amp;sdata=cA5UKbFuZHHnk1599lJi2QXCMTKxCJmPPzoBaRhbdCE%3D&amp;reserved=0
> [2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2019%2F3%2F28%2F203&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C05d512f83dfa4d4f52d908d6eda64321%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C636957695741584637&amp;sdata=TrWSY3eozWSd0KwZgIprmPazdDno979NqGnVjpdzi50%3D&amp;reserved=0
> [3] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2019%2F3%2F28%2F198&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C05d512f83dfa4d4f52d908d6eda64321%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C636957695741584637&amp;sdata=ge%2FOXE40T6GSb0x1SmYFXtwLIdyVy1W0Yl0EItKyXNU%3D&amp;reserved=0
> 
> > 
> > I also have the patches ready for TF-A but I'll hold on to them until I see if
> > this has a chance of getting in.
> > 
> > Abel Vesa (2):
> >   irqchip: irq-imx-gpcv2: Add workaround for i.MX8MQ ERR11171
> >   arm64: dts: imx8mq: Add idle states and gpcv2 wake_request broken
> >     property
> > 
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 20 +++++++++++++++
> >  drivers/irqchip/irq-imx-gpcv2.c           | 42 +++++++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> > 
> > -- 
> > 2.7.4
> > 
