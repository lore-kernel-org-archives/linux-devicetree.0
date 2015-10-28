From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 4/6] fpga: add fpga bridge framework
Date: Wed, 28 Oct 2015 10:31:32 -0500
Message-ID: <alpine.DEB.2.02.1510281021460.30289@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-5-git-send-email-atull@opensource.altera.com> <20151028095027.GK1166@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151028095027.GK1166@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Steffen Trumtrar wrote:

> > +int fpga_bridge_enable(struct fpga_bridge *bridge)
> > +{
> > +	pr_err("%s %s\n", __func__, dev_name(&bridge->dev));
> 
> Please clean this...
> 
> > +
> > +	return bridge->br_ops->enable_set(bridge, 1);
> > +}
> > +EXPORT_SYMBOL_GPL(fpga_bridge_enable);
> > +
> > +/**
> > + * fpga_bridge_disable
> > + * @bridge: fpga bridge
> > + *
> > + * Disable transactions on the bridge
> > + *
> > + * Return: 0 for success, error code otherwise.
> > + */
> > +int fpga_bridge_disable(struct fpga_bridge *bridge)
> > +{
> > +	pr_err("%s %s\n", __func__, dev_name(&bridge->dev));
> 
> and this up.
> 

OK

> > +void fpga_bridge_unregister(struct device *dev)
> > +{
> > +	struct fpga_bridge *bridge = dev_get_drvdata(dev);
> > +
> > +	dev_info(&bridge->dev, "%s : %s\n", __func__, bridge->name);
> 
> Is this necessary information?

I can remove it.

> > +static int __init fpga_bridge_dev_init(void)
> > +{
> > +	pr_info("FPGA bridge framework driver\n");
> 
> Dito.
> IMHO unnecessary log spam. Maybe change this to dbg?

Sure.

> > --- /dev/null
> > +++ b/include/linux/fpga/fpga-bridge.h
> > @@ -0,0 +1,49 @@
> > +#include <linux/cdev.h>
> 
> You don't seem to use this.

Correct.  I'll take it out.

Thanks for the review!

Alan
