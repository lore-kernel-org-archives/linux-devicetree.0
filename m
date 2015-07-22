From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v9 0/7] FPGA Manager Framework and Simple FPGA Bus
Date: Wed, 22 Jul 2015 15:11:31 -0600
Message-ID: <20150722211131.GA23683@obsidianresearch.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <20150717172558.GB15808@obsidianresearch.com>
 <alpine.DEB.2.02.1507171301430.6516@linuxheads99>
 <alpine.DEB.2.02.1507221529280.19203@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1507221529280.19203@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: gregkh@linuxfoundation.org, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 22, 2015 at 03:32:32PM -0500, atull wrote:

> I looked some more; I don't see a simple way of deferring probing until 
> after the filesystem is loaded (so that the image file would be 
> available), late_initcall is still not late enough.

That seems weird, are you saying you can't use request firmware at all
from a compiled in driver? I don't know much about that flow, sorry.

Having that work would mean the system can have a reasonable in-tree
use case without requiring the out of tree dt overlay stuff.

Jason
