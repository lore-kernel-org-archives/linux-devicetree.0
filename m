From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Wed, 23 Sep 2015 15:23:54 +0200
Message-ID: <20150923132354.GB31253@amd>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-4-git-send-email-atull@opensource.altera.com>
 <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: atull@opensource.altera.com, gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul>
List-Id: devicetree@vger.kernel.org

Hi!

> > +++ b/drivers/fpga/fpga-mgr.c
> > @@ -0,0 +1,382 @@
> [..]
> > +int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags, const char *buf,
> > +		      size_t count)
> > +{
> > +	struct device *dev = &mgr->dev;
> > +	int ret;
> > +
> > +	if (!mgr)
> > +		return -ENODEV;
> 
> This seems overly defensive.
> 
> [..]
> > +int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
> > +			   const char *image_name)
> > +{
> > +	struct device *dev = &mgr->dev;
> > +	const struct firmware *fw;
> > +	int ret;
> > +
> > +	if (!mgr)
> > +		return -ENODEV;
> 
> Again; I'm of the opinion this is needlessly defensive.

Not only that, it can never happen. mgr is already dereferenced above.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
