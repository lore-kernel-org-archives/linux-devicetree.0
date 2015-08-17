From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v10 8/8] staging: add simple-fpga-bus
Date: Mon, 17 Aug 2015 13:56:55 +0200
Message-ID: <20150817115655.GB434@amd>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
 <1439487452-23977-10-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439487452-23977-10-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.
List-Id: devicetree@vger.kernel.org

On Thu 2015-08-13 12:37:32, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> Add simple fpga bus.  This is a bus that configures an fpga and its
> bridges before populating the devices below it.  This is intended
> for use with device tree overlays.
> 
> Note that FPGA bridges are seen as reset controllers so no special
> framework for FPGA bridges will need to be added.
> 
> This supports fpga use where hardware blocks on a fpga will need
> drivers (as opposed to fpga used as an acceleration without drivers.)
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>

7,8: Acked-by: Pavel Machek <pavel@denx.de>

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
