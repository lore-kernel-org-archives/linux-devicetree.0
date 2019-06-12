From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Wed, 12 Jun 2019 09:37:58 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1906120937430.2214@nanos.tec.linutronix.de>
References: <20190610121346.15779-1-abel.vesa@nxp.com> <20190610131921.GB14647@lakrids.cambridge.arm.com> <20190610132910.srd4j2gtidjeppdx@fsr-ub1664-175> <6f1052ea-623a-b2e8-9aa8-22aef5fab4ca@arm.com> <20190610135514.xd5myavjsloos2y3@fsr-ub1664-175>
 <7b86aa90-6d64-589c-f11e-d2ee6ab3fd54@arm.com> <VI1PR04MB5055A808A08A1C47784E4332EE130@VI1PR04MB5055.eurprd04.prod.outlook.com> <alpine.DEB.2.21.1906120913090.2214@nanos.tec.linutronix.de> <86ftofgss2.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86ftofgss2.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Abel Vesa <abelvesa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Jun 2019, Marc Zyngier wrote:
> On Wed, 12 Jun 2019 08:14:16 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
> > On Mon, 10 Jun 2019, Leonard Crestez wrote:
> > > On 6/10/2019 5:08 PM, Marc Zyngier wrote:
> > > > Nobody is talking about performance here. It is strictly about
> > > > correctness, and what I read about this system is that it cannot
> > > > reliably use cpuidle.
> > > My argument was that it's fine if PPIs and LPIs are broken as long as 
> > > they're not used:
> > > 
> > >   * PPIs are only used for local timer which is not used for wakeup.
> > 
> > Huch? The timer has to bring the CPU out of idle as any other
> > interrupt.
> 
> They use a separate hack for that, pretending that the timer is
> stopped during idle (it isn't), and setup a broadcast timer when
> entering idle. That timer uses an interrupt that can wake-up the
> target CPU, and all is well in the world. Sort of.
> 
> Of course, this breaks as PPIs are not only used by the timer, but
> also by a number of other HW bits (PMU, GIC, guest and hypervisor
> timers), and they don't have corresponding hacks to back them up.

Eew.
