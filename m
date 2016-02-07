From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v16 1/6] fpga: add bindings document for fpga region
Date: Sat, 6 Feb 2016 19:16:16 -0600
Message-ID: <alpine.DEB.2.10.1602060811160.2302@atull-730U3E-740U3E>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com> <1454707803-27947-2-git-send-email-atull@opensource.altera.com> <20160205224446.GG9579@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20160205224446.GG9579@jcartwri.amer.corp.natinst.com>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Moritz Fischer <moritz.fischer@ettus.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Fri, 5 Feb 2016, Josh Cartwright wrote:

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
> reflection of the SoC FPGA manager design.

It's not so strange if you keep in mind the intent: I want to support
both partial and full reconfiguration.  Also I want this to work not
just for Xilinx but also for Altera :) That makes it a top-level
concept.

>  That is, I would expect the
> bridges not to be associated with the FPGA Region, but with the FPGA
> manager.

Maybe for the one use case of full reconfiguation on Zynq.  More
generally, FPGA Bridges may be hardened hardware devices or they may
be soft hardware in the FPGA that allow some regions of the FGPA to be
isolated from the cpu busses while other FPGA regions are active. The
latter case is to support partial reconfiguration for devices that can
support partial reconfiguration.  The partial reconfiguration region
that is being programmed will need to be isolated from the bus during
programming while the rest of the FPGA remains active.  That requires
that the bridges for each partial reconfiguration region be specified
per region.  Supporting both full and partial reconfiguration is a
priority for me.  I'll have to review this document and see how I can
make this more clear.

> 
> Although, I will concede that you you've made it possible to not use
> FPGA Bridges (like on Zynq where they aren't necessary), so maybe it
> doesn't matter, just smells strangely.

Hmmm my patches are extra fragrent today...  

> 
> > +Freeze Blocks
> > + * Freeze Blocks function as FPGA Bridges within the FPGA fabric.  In the case
> > +   of PR, the buses from the processor are split within the FPGA.  Each PR
> > +   region gets its own split of the buses, protected by an independently
> > +   controlled Freeze Block.  Several busses may be connected to a single
> > +   PR region; a Freeze Block controls the traffic of all these busses
> > +   together.
> > +
> > +
> [..]
> > +Device Tree Examples
> > +====================
> > +
> > +The intention of this section is to give some simple examples, focusing on
> > +the placement of the elements detailed above, especially:
> > + * FPGA Manager
> > + * FPGA Bridges
> > + * FPGA Region
> > + * ranges
> > + * target-path or target
> > +
> > +For the purposes of this section, I'm dividing the Device Tree into two parts,
> > +each with its own requirements.  The two parts are:
> > + * The live DT prior to the overlay being added
> > + * The DT overlay
> > +
> > +The live Device Tree must contain an FPGA Region, an FPGA Manager, and any FPGA
> > +Bridges.  The FPGA Region's "fpga-mgr" property specifies the manager by phandle
> > +to handle programming the FPGA.  If the FPGA Region is the child of another FPGA
> > +Region, the parent's FPGA Manager is used.  If FPGA Bridges need to be involved,
> > +they are specified in the FPGA Region by the "fpga-bridges" property.  During
> > +FPGA programming, the FPGA Region will disable the bridges that are in its
> > +"fpga-bridges" list and will re-enable them after FPGA programming has
> > +succeeded.
> > +
> > +The Device Tree Overlay will contain:
> > + * "target-path" or "target"
> > +   The insertion point where the the contents of the overlay will go into the
> > +   live tree.  target-path is a full path, while target is a phandle.
> > + * "ranges"
> > + * "firmware-name"
> > +   Specifies the name of the FPGA image file on the firmware search
> > +   path.  The search path is described in the firmware class documentation.
> > + * "partial-reconfig"
> > +   This binding is a boolean and should be present if partial reconfiguration
> > +   is to be done.
> 
> Another architectural smell: there are categorically two different types
> of properties here.  The first kind is those properties which describe
> _what_ IP exists within the FPGA image (all of the nodes under the regions, etc).
> The second kind of properties are those which describe _how_ the image
> should be written (partial-reconfig, firmware-name).
> 
> It seems weird, but maybe it doesn't matter much.

Reprogramming an FPGA will always involve 3 types of information:
static information of the hardened hardware (FPGA Manager and hardware
bridges), configuration information (FPGA image and whether to do
partial or full reconfiguration), and post-configuration information
(devices that will exist after programming).  That's going to be true
whether we use the device tree or not.  My goal is to have a
convenient way to reprogram the FPGA and populate the children.  So if
the smell can be tolerated, it can perhaps be very sweet to have the
convenience of having all this information together in a manageable
fashion.  Let's see what the DT folks say.

Anyway thanks for reviewing my stinky patches!  

Alan

> 
> Thanks,
>   Josh
> 
