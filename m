From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v16 1/6] fpga: add bindings document for fpga region
Date: Sun, 21 Feb 2016 20:54:38 -0600
Message-ID: <20160222025438.GL15973@rob-hp-laptop>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
 <1454707803-27947-2-git-send-email-atull@opensource.altera.com>
 <20160205224446.GG9579@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160205224446.GG9579@jcartwri.amer.corp.natinst.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: atull@opensource.altera.com, pantelis.antoniou@konsulko.com, Moritz Fischer <moritz.fischer@ettus.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Fri, Feb 05, 2016 at 04:44:46PM -0600, Josh Cartwright wrote:
> Hey Alan-
> 
> First off, thanks for all of your (and others') work on this.
> 
> On Fri, Feb 05, 2016 at 03:29:58PM -0600, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > New bindings document for FPGA Region to support programming
> > FPGA's under Device Tree control
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> [..]
> > ---
> >  .../devicetree/bindings/fpga/fpga-region.txt       |  348 ++++++++++++++++++++
> >  1 file changed, 348 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> > new file mode 100644
> > index 0000000..ccd7127
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> [..]
> > +FPGA Manager & FPGA Manager Framework
> > + * An FPGA Manager is a hardware block that programs an FPGA under the control
> > +   of a host processor.
> > + * The FPGA Manager Framework provides drivers and functions to program an
> > +   FPGA.
> > +
> > +FPGA Bridge Framework
> > + * Provides drivers and functions to control bridges that enable/disable
> > +   data to the FPGA.
> > + * FPGA Bridges should be disabled while the FPGA is being programmed to
> > +   prevent spurious data on the bus.
> > + * FPGA Bridges may not be needed in implementations where the FPGA Manager
> > +   handles this.
> 
> It still seems strange for me architecturally for the FPGA Bridge to be
> a first-class top-level concept in your architecture, as they are a
> reflection of the SoC FPGA manager design.  That is, I would expect the
> bridges not to be associated with the FPGA Region, but with the FPGA
> manager.
> 
> Although, I will concede that you you've made it possible to not use
> FPGA Bridges (like on Zynq where they aren't necessary), so maybe it
> doesn't matter, just smells strangely.

In general, DT models buses in the node hierarchy. To go from one bus to 
another, you need a bridge. Going from an onchip bus to an FPGA bus 
has to have some sort of bridge logic in between for isolation 
minimally. Zynq has to have something similar. Perhaps the bridge 
control is not part of the bridges themselves?

Rob
