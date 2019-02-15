From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V3 1/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Fri, 15 Feb 2019 17:02:38 +0000
Message-ID: <20190215170238.GB10859@lakrids.cambridge.arm.com>
References: <1550081533-25000-1-git-send-email-Frank.Li@nxp.com>
 <20190215142241.GB55505@lakrids.cambridge.arm.com>
 <CAHrpEqT9sS2gmvB9iSH6V2-B3iza05qMGGLYRwR2sR3ZjO4wqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqT9sS2gmvB9iSH6V2-B3iza05qMGGLYRwR2sR3ZjO4wqA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhi Li <lznuaa@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 15, 2019 at 10:04:10AM -0600, Zhi Li wrote:
> On Fri, Feb 15, 2019 at 8:22 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Wed, Feb 13, 2019 at 06:12:27PM +0000, Frank Li wrote:
> > > +struct fsl_ddr_devtype_data {
> > > +     unsigned int flags;
> > > +};
> > > +
> > > +static const struct fsl_ddr_devtype_data imx8_data;
> > > +static const struct fsl_ddr_devtype_data imx8m_data = {
> > > +     .flags = DDR_CAP_AXI_ID,
> > > +};
> > > +
> > > +static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
> > > +     { .compatible = "fsl,imx8-ddr-pmu", .data = (void *)&imx8_data},
> > > +     { .compatible = "fsl,imx8m-ddr-pmu", .data = (void *)&imx8m_data},
> > > +     { /* sentinel */ }
> > > +};
> >
> > You could encode the flags directly in of_device_id::data, and avoid the
> > need for this structure entirely.
> 
> I plan use fsl_ddr_devtype to save some friendly AXI ID name in future, such as
> GPU  0x111122222
> VPU  0x333344444
> 
> so user can use bus master name instead of to look ref manual to get hex number.
> 
> perf stat -e ddr0/axid_read, axid=GPU
> 
> But perf application can't pass string by config.
> 
> Any suggestion here ?

Remove it for now, and we can consider it if/when you add that
functionality.

However, I will say that in general I am not a fan of coding SoC-level
details into individual drivers, and I would prefer to avoid hard coding
the AXI IDs here regardless.

> > > +static u32 ddr_perf_alloc_counter(struct ddr_pmu *pmu, int event)
> > > +{
> > > +     int i;
> > > +
> > > +     /* Always map cycle event to counter 0 */
> > > +     if (event == EVENT_CYCLES_ID)
> > > +             return EVENT_CYCLES_COUNTER;
> >
> > What if the cycle counter is already in use?
> 
> cycles counter is dedicated to cycles events.
> Can't use for other event.

What I meant was if you have two cycles events, they'll both try to
configure the cycle counter (e.g. when it overflows), which may not
behave as you expect.

I think that you should only allow one event to use the cycle counter at
a time.

> > > +static irqreturn_t ddr_perf_irq_handler(int irq, void *p)
> > > +{
> > > +     int i;
> > > +     u8 reg;
> > > +     int val;
> > > +     int counter;
> > > +     struct ddr_pmu *pmu = (struct ddr_pmu *) p;
> > > +     struct perf_event *event;
> > > +
> > > +     /* Only cycles counter overflowed can issue irq. all counters will
> > > +      * be stopped when cycles counter overflow. but other counter don't stop
> > > +      * when overflow happen. Update all of the local counter values,
> > > +      * then reset the cycles counter, so the others can continue
> > > +      * counting.
> > > +      */
> >
> > That is a rather unfortunate design decision.
> >
> > Can any of the counters count multiple events per cycle?
> 
> No,  other events always much less than cycle counters.

Ok. Please describe that in the comment.

Thanks,
Mark.
