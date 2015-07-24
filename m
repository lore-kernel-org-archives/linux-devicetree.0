From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v9 6/7] staging: add simple-fpga-bus
Date: Thu, 23 Jul 2015 22:42:05 -0500
Message-ID: <alpine.DEB.2.02.1507232229580.5634@linuxheads99>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-7-git-send-email-atull@opensource.altera.com>
 <CAAtXAHd_Dz2bWhZu4Bf5c-meQZTCFiUPX0i-gWZnLVc644wARw@mail.gmail.com>
 <20150723221510.GA16971@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150723221510.GA16971@obsidianresearch.com>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, Nicolas Pitre <nico@linaro.org>, iws@ovro.caltech.edu, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, Grant Likely <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, broonie@kernel.org, Philip Balister <philip@balister.org>, Petr Cvek <petr.cvek@tul.cz>, akpm@linux-foundation.org, Michal Simek <monstr@monstr.eu>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, balbi@ti.com, davem@davemloft.net, robh+dt@kernel.org, Rob
List-Id: devicetree@vger.kernel.org

On Thu, 23 Jul 2015, Jason Gunthorpe wrote:

> On Thu, Jul 23, 2015 at 02:55:52PM -0700, Moritz Fischer wrote:
> > Hi Alan,
> > 
> > I saw that your socfpga driver doesn't support the partial reconfig
> > use case (not a big deal).
> > What I currently do for Zynq is if I'm doing a non-partial reconfig is
> > that I disable input
> > level shifters and assert *all* resets while reprogramming in my FPGA
> > manager .write_init() and .write_complete().
> 
> I do this as well, but it is a bit more complex.. FPGA specific code
> has to run around and ensure all DMA is shut off, then we need to make
> sure no CPU issued AXI transactions can happen, then we can tear down
> the FPGA side.
> 
> If the FPGA is torn down while an AXI op is inprogress things go
> sideways, we have to work to prevent that :)
> 
> This happens almost for free, I use DT and the device model to
> disconnect the drivers. The drivers are careful to synchronously fence
> off in-progress DMA. Then drop the DT nodes associated with the
> FPGA, finally the actual FPGA cells can be reset.

Yes, the kernel gives us this almost for free.  That's what I like
about using DT overlays to control FPGA programming.

> 
> > In a partial reconfiguration situation, would I have separate
> > simple-fpga buses for each of the parts that I swap out, each with
> > it's own reset and bitfile attached?
> 
> I'd think of partial reconfiguration as another nested FPGA. The
> resets and so forth could be attached to soft controllers in the
> unswappable part of the FPGA.
> 
> DT nodes have to surround it in some way...
> 
> Jason
> 

Yes, in this way each PR chunk will need its own reset so it
won't wiggle busses and affect the rest of the system during PR.

I noticed that currently simple-fpga-bus.c holds an exclusive
ref of the fpga manager.  This would keep a 2nd pr from being
able to access the same fpga manager, so I'll have to change
it so that simple-fpga-bus.c will  put the ref before exiting
probe.

Alan
