From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH v2 2/2] drivers: mfd: vexpress: add Serial Power
 Controller (SPC) support
Date: Wed, 5 Jun 2013 19:22:25 +0100
Message-ID: <20130605182225.GB2650@e102568-lin.cambridge.arm.com>
References: <1370432767-6620-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1370432767-6620-3-git-send-email-lorenzo.pieralisi@arm.com>
 <1370455713.3496.22.camel@linaro1.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370455713.3496.22.camel@linaro1.home>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <Pawel.Moll@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2013 at 07:08:33PM +0100, Jon Medhurst (Tixy) wrote:
> On Wed, 2013-06-05 at 12:46 +0100, Lorenzo Pieralisi wrote:
> [...]
> > +static const struct of_device_id vexpress_spc_ids[] __initconst = {
> > +	{ .compatible = "arm,vexpress-spc,v2p-ca15_a7" },
> > +	{ .compatible = "arm,vexpress-spc" },
> > +	{},
> > +};
> > +
> > +static int __init vexpress_spc_init(void)
> > +{
> > +	int ret;
> > +	struct device_node *node = of_find_matching_node(NULL,
> > +							 vexpress_spc_ids);
> 
> To allow for devices without an SPC we should check for !node here and
> bail out, otherwise we get an ugly message from the WARN_ON further
> down. I see this on RTSM, and multiplatform kernels would suffer this as
> well.
> 
> Even if the ugly warning wasn't there, it still seems cleaner to me to
> have a proper check for an absent spc node.

Absolutely, I will apply both fixes, thanks a lot for the review.

Lorenzo
