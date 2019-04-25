From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Thu, 25 Apr 2019 18:16:59 +0100
Message-ID: <20190425171659.GB4319@lakrids.cambridge.arm.com>
References: <1555447156-28306-1-git-send-email-Frank.Li@nxp.com>
 <1555447156-28306-2-git-send-email-Frank.Li@nxp.com>
 <20190424105822.GA14614@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190424105822.GA14614@fuggles.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2019 at 11:58:22AM +0100, Will Deacon wrote:
> Hi Frank,
> 
> On Tue, Apr 16, 2019 at 08:39:33PM +0000, Frank Li wrote:
> > Add ddr performance monitor support for iMX8QXP
> > 
> > There are 4 counters for ddr perfomance events.
> > counter 0 is dedicated for cycles.
> > you choose any up to 3 no cycles events.
> 
> I was about to pick this up, but I still have a few questions/comments
> on the code:
> 
> > +static irqreturn_t ddr_perf_irq_handler(int irq, void *p)
> > +{
> > +	int i;
> > +	u8 reg;
> > +	int val;
> > +	int counter;
> > +	struct ddr_pmu *pmu = (struct ddr_pmu *) p;
> > +	struct perf_event *event;
> > +
> > +	/* Only cycles counter overflowed can issue irq. all counters will
> > +	 * be stopped when cycles counter overflow. but other counter don't stop
> > +	 * when overflow happen. Update all of the local counter values,
> > +	 * then reset the cycles counter, so the others can continue
> > +	 * counting. cycles counter is fastest counter in all events. at last
> > +	 * 4 times than other counters.
> > +	 */
> > +	for (i = 0; i < NUM_COUNTER; i++) {
> > +
> > +		if (!pmu->active_events[i])
> > +			continue;
> > +
> > +		event = pmu->active_events[i];
> > +		counter = event->hw.idx;
> > +		reg = counter * 4 + COUNTER_CNTL;
> > +		val = readl(pmu->base + reg);
> 
> Does this read have a side-effect, or can it be removed given that you don't
> use val for anything else?
> 
> > +		ddr_perf_event_update(event);
> > +
> > +		if (counter == EVENT_CYCLES_COUNTER) {
> > +			ddr_perf_event_enable(pmu,
> > +					      EVENT_CYCLES_ID,
> > +					      EVENT_CYCLES_COUNTER,
> > +					      true);
> > +			ddr_perf_event_update(event);
> > +		}
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> 
> What stops the IRQ handler running concurrently with perf callbacks? I can't
> see any locking here, or is the IRQ supposed to be affine to the same CPU
> that's handling the perf context?

To be correct, the IRQ affinity should be set to match the logical
affinity of the PMU, but it looks like that's not done at setup or
migrate time.

Frank, please take a look at what drivers/perf/arm-ccn.c does with teh
IRQ, including the use of IRQF_NOBALANCING | IRQF_NO_THREAD flags when
requesting the IRQ to begin with.

Thanks,
Mark.
