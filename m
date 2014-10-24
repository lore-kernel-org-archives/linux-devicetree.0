From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Fri, 24 Oct 2014 22:00:13 +0100
Message-ID: <20141024220013.37c38f7a@alan.etchedpixels.co.uk>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com>
	<1414007405-32186-3-git-send-email-atull@opensource.altera.com>
	<20141024105200.GA20775@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141024105200.GA20775@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: atull@opensource.altera.com, gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org


> > +int fpga_mgr_write(struct fpga_manager *mgr, const char *buf, size_t count)
> > +{
> > +	int ret;
> > +
> > +	if (test_and_set_bit_lock(FPGA_MGR_BUSY, &mgr->flags))
> > +		return -EBUSY;
> > +
> > +	dev_info(mgr->dev, "writing buffer to %s\n", mgr->name);
> > +
> > +	ret = __fpga_mgr_write(mgr, buf, count);
> > +	clear_bit_unlock(FPGA_MGR_BUSY, &mgr->flags);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(fpga_mgr_write);
> 
> Is the EBUSY -- userspace please try again, but you don't know when to
> try again -- right interface? I mean, normally kernel would wait, so
> that userland does not have to poll?

And if userland has to also support polling you must support poll/select
on the file handle so it knows when to retry the I/O.

The error should be EAGAIN for a retriable write with O_NDELAY set.

Alan
