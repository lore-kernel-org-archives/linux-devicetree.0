From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V11 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Wed, 1 May 2019 16:48:52 +0100
Message-ID: <20190501154852.GB28109@fuggles.cambridge.arm.com>
References: <1556724043-3961-1-git-send-email-Frank.Li@nxp.com>
 <1556724043-3961-2-git-send-email-Frank.Li@nxp.com>
 <20190501152437.GA28109@fuggles.cambridge.arm.com>
 <CAHrpEqQYhg_aRt7qukkTzT3pEzLqg-B0YJL1Z7T06iZV1JAxmQ@mail.gmail.com>
 <CAHrpEqQON_M3LC6KtZCaRt4ShhREyY-ZA=-_cRpHxAaz46bvQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqQON_M3LC6KtZCaRt4ShhREyY-ZA=-_cRpHxAaz46bvQA@mail.gmail.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 01, 2019 at 10:41:13AM -0500, Zhi Li wrote:
> On Wed, May 1, 2019 at 10:35 AM Zhi Li <lznuaa@gmail.com> wrote:
> >
> > On Wed, May 1, 2019 at 10:24 AM Will Deacon <will.deacon@arm.com> wrote:
> > >
> > > On Wed, May 01, 2019 at 03:21:00PM +0000, Frank Li wrote:
> > > > +static int ddr_perf_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct ddr_pmu *pmu;
> > > > +     struct device_node *np;
> > > > +     void __iomem *base;
> > > > +     char *name;
> > > > +     int num;
> > > > +     int ret;
> > > > +     int irq;
> > > > +
> > > > +     base = devm_platform_ioremap_resource(pdev, 0);
> > > > +     if (IS_ERR(base))
> > > > +             return PTR_ERR(base);
> > > > +
> > > > +     np = pdev->dev.of_node;
> > > > +
> > > > +     pmu = devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
> > > > +     if (!pmu)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     num = ddr_perf_init(pmu, base, &pdev->dev);
> > > > +
> > > > +     platform_set_drvdata(pdev, pmu);
> > > > +
> > > > +     name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "imx_ddr%d", num);
> > >
> > > Still not happy with this.
> >
> > is imx_ddr_pmu%d  okay?
> 
> imx_ddr%d_pmu look like more reasonable.

Sorry, it's a bit subtle, but please use "imx8" instead of "imx" since
they may change the thing completely in a future revision of the SoC. That's
why I suggested "imx8_ddr" in my reply on the previous version of the patch
(although it appears I somehow managed to drop the CC line in my reply, so
it only went to your gmail address).

Will
