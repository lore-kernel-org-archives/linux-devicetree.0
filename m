From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] ARC: reset: introduce HSDKv1 reset driver
Date: Wed, 19 Jul 2017 17:47:12 +0200
Message-ID: <1500479232.2364.64.camel@pengutronix.de>
References: <20170718172520.25546-1-Eugeniy.Paltsev@synopsys.com>
         <1500476858.2364.45.camel@pengutronix.de>
         <1500478342.9320.28.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500478342.9320.28.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Eugeniy,

On Wed, 2017-07-19 at 15:32 +0000, Eugeniy Paltsev wrote:
> Hi Philipp,
> 
> On Wed, 2017-07-19 at 17:07 +0200, Philipp Zabel wrote:
> > On Tue, 2017-07-18 at 20:25 +0300, Eugeniy Paltsev wrote:
> > > The HSDK v1 periphery IPs can be reset by accessing some registers
> > > from the CGU block.
> > > 
> > > The list of available reset lines is documented in the DT bindings.
> > > 
> > > [snip]
> > > --- a/drivers/reset/Kconfig
> > > +++ b/drivers/reset/Kconfig
> > > @@ -34,6 +34,12 @@ config RESET_BERLIN
> > >  	help
> > >  	  This enables the reset controller driver for Marvell
> > > Berlin SoCs.
> > >  
> > > +config RESET_HSDK_V1
> > > +	bool "HSDK v1 Reset Driver"
> > > +	default n
> > 
> > I suppose there will be a SOC_HSDK_V1 or similar in the future so
> > that
> > we can hide this option and enable it by default like the other reset
> > drivers?
> Actually we don't have (and don't planning to add) such SOC/board-
> specific kconfig option, so I am wondering if it is OK to just left
> this option not hidden?

Not a problem, I just prefer to enable reset controllers by default when
building kernels for SoCs that may need them. Sometimes they are even
necessary to boot the system. In those cases, allowing to disable the
reset controller driver at all is not very helpful.

regards
Philipp
