From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v9 2/7] staging: usage documentation for simple fpga bus
Date: Thu, 23 Jul 2015 08:43:39 +0200
Message-ID: <20150723064338.GB23318@amd>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437148277-5405-3-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvande
List-Id: devicetree@vger.kernel.org

On Fri 2015-07-17 10:51:12, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> Add a document spelling out usage of the simple fpga bus.

> +The DT overlay includes bindings (documented in bindings/simple-fpga-bus.txt)
> +that specify:
> + * Which fpga manager to use

fpga->FPGA, globally.

> + * Which image file to load
> + * Flags indicating whether this this image is for full reconfiguration or
> +   partial.
> + * a list of resets that should be released.  These enable the FPGA bridges.
> + * child nodes specifying the devices that will be added with appropriate
> +   compatible strings, etc.

Either all entries in the list should start with big letter or none
should. Also . at end of line should be consistent.

> +   Sequence
> +   --------
> + 1. Load the DT overlay.  One convenient way to do that is to use Pantelis'
> +    handy configfs interface (more below).

Reader has no chance to know what Pantelis' configfs interface is, and
there's nothing below.

> + 2. The simple FPGA bus gets probed and will do the following:
> +    a. call the fpga manager core to program the FPGA
> +    b. release the FPGA bridges
> +    c. call of_platform_populate resulting in device drivers getting probed.
> +

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
