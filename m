From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 1/6] fpga: add usage documentation for simple fpga
 bus
Date: Wed, 28 Oct 2015 09:59:15 -0500
Message-ID: <alpine.DEB.2.02.1510280957550.30289@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-2-git-send-email-atull@opensource.altera.com> <CAAtXAHce3OVfZt5MCTdJ8bTEjP0QWTE1y5C9SOMSH1+YWsWLYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHce3OVfZt5MCTdJ8bTEjP0QWTE1y5C9SOMSH1+YWsWLYg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Josh Cartwright <joshc@ni.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Moritz Fischer wrote:

Hi Moritz!

> Hi Alan,
> 
> great docs! Couple of nits inline below
> 
> On Tue, Oct 27, 2015 at 3:09 PM,  <atull@opensource.altera.com> wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> >
> > Add a document spelling out usage of the simple fpga bus.
> >
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> > v9:  Initial version of this patch in patchset
> > v10: s/fpga/FPGA/g
> >      improve formatting
> >      some rewriting
> >      move to staging/simple-fpga-bus
> > v11: No change in this patch for v11 of the patch set
> > v12: Moved out of staging
> >      Small changes due to using FPGA bridge framework and not
> >      representing the bridges as resets.
> > ---
> >  Documentation/fpga/simple-fpga-bus.txt |   58 ++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/fpga/simple-fpga-bus.txt
> >
> > diff --git a/Documentation/fpga/simple-fpga-bus.txt b/Documentation/fpga/simple-fpga-bus.txt
> > new file mode 100644
> > index 0000000..bd43478
> > --- /dev/null
> > +++ b/Documentation/fpga/simple-fpga-bus.txt
> > @@ -0,0 +1,58 @@
> > +Simple FPGA Bus
> > +
> > +Alan Tull 2015
> > +
> > +Overview
> > +========
> > +
> > +The simple FPGA bus adds device tree overlay support for FPGA's.  Loading a
> 
> FPGAs

D'oh!

> > +DT overlay will result in the FPGA getting an image loaded, its bridges will
> 
> I'd prefer 'will result in the FPGA being programmed with an image'

OK

> 
> > +be released, and the DT populated for nodes below the simple-fpga-bus.  This
> > +results in drivers getting probed for the hardware that just got added.  This
> > +is intended to support the FPGA usage where the FPGA has hardware that
> > +requires drivers.  Removing the overlay will result in the drivers getting
> > +removed and the bridges being disabled.
> > +
> > +The simple FPGA bus will need to disable and enable bridges that will only
> > +affect the child devices that are below the bus.  If partial reconfiguration
> > +is to be done, then bridges will need to be added within the FPGA design to
> > +protect the rest of the bus when one part of the FPGA design is being
> > +reconfigured.
> > +
> > +
> > +Sequence
> > +========
> > +
> > +Load the DT overlay.  One way to do that from user space is to use Pantelis'
> > +DT-Overlay configfs interface.
> > +
> > +This causes the simple FPGA bus go be probed and will do the following:
> 
> I think you mean *to* be probed

Yes

> > + 1. Disable the FPGA bridges.
> > + 2. Call the FPGA manager core to program the FPGA.
> > + 3. Release the FPGA bridges.
> > + 4. Call of_platform_populate resulting in device drivers getting probed.
> > +
> > +
> > +Requirements
> > +============
> > +
> > + 1. An FPGA image that has a hardware block or blocks that use drivers that are
> > +    supported in the kernel.
> > + 2. A device tree overlay (example is in the simple-fpga-bus bindings document).
> > + 3. A FPGA manager driver supporting writing the FPGA.
> > + 4. FPGA bridge drivers.
> > +
> > +The DT overlay includes bindings (documented in bindings/simple-fpga-bus.txt)
> > +that specify:
> > + * Which FPGA manager to use.
> > + * Which image file to load.
> > + * Flags indicating whether this this image is for full reconfiguration or
> > +   partial.
> > + * A list of FPGA bridges.
> > + * Child nodes specifying the devices that will be added with appropriate
> > +   compatible strings, etc.
> > +
> > +Since this code uses the firmware interface to get the image and DT overlay,
> > +they currently have to be files on the file system.  It doesn't have to be that
> > +way forever as DT bindings could be added to point to other sources for the
> > +image.
> 
> Having this will be really useful, but I agree this can be a follow up patch.
> > --
> > 1.7.9.5
> >
> 
> I'll take a closer look but feel free to add a:
> 
> Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>
> 
> Cheers,
> 
> Moritz
> 

Thanks for the review, I'll fix the nits.

Alan
