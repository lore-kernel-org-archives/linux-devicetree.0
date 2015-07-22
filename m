From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 0/7] FPGA Manager Framework and Simple FPGA Bus
Date: Wed, 22 Jul 2015 15:32:32 -0500
Message-ID: <alpine.DEB.2.02.1507221529280.19203@linuxheads99>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <20150717172558.GB15808@obsidianresearch.com>
 <alpine.DEB.2.02.1507171301430.6516@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <alpine.DEB.2.02.1507171301430.6516@linuxheads99>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, pavel@denx.de, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Fri, 17 Jul 2015, atull wrote:

> On Fri, 17 Jul 2015, Jason Gunthorpe wrote:
> 
> > On Fri, Jul 17, 2015 at 10:51:10AM -0500, atull@opensource.altera.com wrote:
> > > From: Alan Tull <atull@opensource.altera.com>
> > > 
> > > This patchset adds two chunks plus documentation:
> > >  * fpga manager core: exports ABI functions that write an image to a FPGA
> > >  * DT Overlay support: simple-fpga-bus to handle FPGA from a DT overlay
> > 
> > I didn't read super closely, but overall it makes sense to me..
> > 
> > Providing an in-kernel API will let someone else figure out how to
> > expose that to user space. The DT based scheme seems pretty nice.
> > 
> 
> Thanks!
> 
> > Can you use this without DT overlay? Ie if I provide the FGPA
> > description as part of my boot time DT will it just work?
> 
> The simple fpga bus would need to defer probing until after the fpga 
> manager driver and bridge drivers are probed (that's easy).  Since it is 
> using firmware, it will also have to defer until the filesystem is 
> available so it can get the fpga image to load.  I'll work on it.
> 
> Alan

I looked some more; I don't see a simple way of deferring probing until 
after the filesystem is loaded (so that the image file would be 
available), late_initcall is still not late enough.

Alan


> 
> > 
> > Jason
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 
