From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Wed, 29 Oct 2014 11:31:03 +0100
Message-ID: <20141029103103.GD10262@pengutronix.de>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com>
 <1414108267-22058-3-git-send-email-atull@opensource.altera.com>
 <20141024070042.GL10262@pengutronix.de>
 <alpine.DEB.2.02.1410281601570.11910@atx-linux-37>
 <20141029075701.GA10262@pengutronix.de>
 <20141029101632.GU18557@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141029101632.GU18557@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: atull <atull@opensource.altera.com>, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 10:16:32AM +0000, Mark Brown wrote:
> On Wed, Oct 29, 2014 at 08:57:01AM +0100, Steffen Trumtrar wrote:
> 
> > So, that shouldn't be a problem though, as I already cooked up a driver for
> > the L3 with all the ranges specified. The only thing I need to figure out
> > before I will post it, is how to nicely handle the WO remap register.
> > I think regmap might be able to handle this itself, but am not sure yet.
> 
> It's supposed to be able to, not sure if anyone really tests that or not
> though so it's possible bugs crept in.  Most write only registers can
> physically be read so actually come out as volatile rather than write
> only even if functionally there is no reason to read.

Ah, I think you might be actually right there. IIRC it IS possible to read
from that register, but you only get 0s.
So, I shot myself in the knee with specifying that register as write-only
in my driver.

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
