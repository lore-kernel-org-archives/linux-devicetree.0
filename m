From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v5 4/6] staging: fpga manager: add driver for socfpga
 fpga manager
Date: Thu, 18 Dec 2014 14:59:32 -0600
Message-ID: <alpine.DEB.2.02.1412181456530.30233@linuxheads99>
References: <1418835289-15752-1-git-send-email-atull@opensource.altera.com> <1418835289-15752-5-git-send-email-atull@opensource.altera.com> <6eecb422024845acaffe10e4c81faac9@BN1AFFO11FD047.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <6eecb422024845acaffe10e4c81faac9@BN1AFFO11FD047.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguye
List-Id: devicetree@vger.kernel.org

On Thu, 18 Dec 2014, Michal Simek wrote:

Hi Michal,

> > +
> > +	/* Write out remaining non 32-bit chunks. */
> > +	switch (count) {
> > +	case 3:
> > +		socfpga_fpga_data_writel(priv, buffer_32[i++] & 0x00ffffff);
> > +		break;
> > +	case 2:
> > +		socfpga_fpga_data_writel(priv, buffer_32[i++] & 0x0000ffff);
> > +		break;
> > +	case 1:
> > +		socfpga_fpga_data_writel(priv, buffer_32[i++] & 0x000000ff);
> > +		break;
> > +	default:
> > +		/* This will never happen. */
> 
> why not just return any error code here even if this can't happen.
> 

OK. Will be in v6.

> 
> add it to one line.
> 
> The rest is looks good to me. I think this is good to go in.
> 
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> 
> Thanks,
> Michal
> 

Thanks for the feedback.  So patches 1-4 look good now?

For v6 I will leave out patches 5/6 and 6/6.

Alan
