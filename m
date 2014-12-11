From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v4 6/6] staging: fpga manager: add driver for altera
 socfpga manager
Date: Thu, 11 Dec 2014 17:14:24 -0600
Message-ID: <alpine.DEB.2.02.1412111710470.11739@linuxheads99>
References: <1418156090-23578-1-git-send-email-atull@opensource.altera.com> <1418156090-23578-7-git-send-email-atull@opensource.altera.com> <20141210150548.GB23358@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141210150548.GB23358@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvand
List-Id: devicetree@vger.kernel.org

On Wed, 10 Dec 2014, Steffen Trumtrar wrote:

> > +static inline void altera_fpga_reg_set_bitsl(struct altera_fpga_priv *priv,
> > +					     u32 offset, u32 bits)
> > +{
> > +	u32 val;
> > +
> > +	val = altera_fpga_reg_readl(priv, offset);
> > +	val |= bits;
> > +	altera_fpga_reg_writel(priv, offset, val);
> > +}
> > +
> > +static inline void altera_fpga_reg_clr_bitsl(struct altera_fpga_priv *priv,
> > +					     u32 offset, u32 bits)
> > +{
> > +	u32 val;
> > +
> > +	val = altera_fpga_reg_readl(priv, offset);
> > +	val &= ~bits;
> > +	altera_fpga_reg_writel(priv, offset, val);
> > +}
> > +
> 
> Why do you need these? Can't you just use regmap_mmio?

I would like to do that as an improvement as time allows, not now.

> > +	ret = request_irq(priv->irq, altera_fpga_isr, 0, "altera-fpga-mgr",
> > +			  priv);
> > +	if (ret < 0)
> > +		goto err_dispose_irq;
> 
> devm_request_irq

Will do, thanks.

Alan
