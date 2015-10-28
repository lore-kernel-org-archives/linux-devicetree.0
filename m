From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 10:39:35 -0500
Message-ID: <alpine.DEB.2.02.1510281038220.30289@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-4-git-send-email-atull@opensource.altera.com> <20151028094325.GJ1166@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151028094325.GJ1166@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Steffen Trumtrar wrote:

> > +static int simple_fpga_bus_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	struct simple_fpga_bus *priv;
> > +	struct fpga_manager *mgr;
> > +	int ret;
> > +
> > +	pr_err("%s line %d\n", __func__, __LINE__);
> 
> Debugging residue, I guess, please remove.

OK

Thanks,

Alan
