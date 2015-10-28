From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 5/6] ARM: socfpga: add bindings document for fpga
 bridge drivers
Date: Wed, 28 Oct 2015 10:53:17 -0500
Message-ID: <alpine.DEB.2.02.1510281046500.30289@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-6-git-send-email-atull@opensource.altera.com> <20151028092907.GH1166@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151028092907.GH1166@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: gregkh@linuxfoundation.org, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, monstr@monstr.eu, michal.simek@xilinx.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Steffen Trumtrar wrote:

> Hi!
> 
> On Tue, Oct 27, 2015 at 05:09:14PM -0500, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > Add bindings documentation for Altera SOCFPGA bridges:
> >  * fpga2sdram
> >  * fpga2hps
> >  * hps2fpga
> >  * lwhps2fpga
> > 
> > Signed-off-by: Alan Tull <dinguyen@opensource.altera.com>
> > Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> > Signed-off-by: Matthew Gerlach <mgerlach@altera.com>
> > ---
> > v2:  separate into 2 documents for the 2 drivers
> > v12: bump version to line up with simple-fpga-bus version
> >      remove Linux specific notes such as references to sysfs
> >      move non-DT specific documentation elsewhere
> >      remove bindings that would have been used to pass configuration
> >      clean up formatting
> > ---
> >  .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   18 ++++++++++
> >  .../bindings/fpga/altera-hps2fpga-bridge.txt       |   36 ++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
> >  create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
> > new file mode 100644
> > index 0000000..11eb5b7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
> > @@ -0,0 +1,18 @@
> > +Altera FPGA To SDRAM Bridge Driver
> > +
> > +Required properties:
> > +- compatible		: Should contain "altr,socfpga-fpga2sdram-bridge"
> > +
> > +Optional properties:
> > +- label			: User-readable name for this bridge.
> > +			  Default is br<device#>
> > +- init-val		: 0 if driver should disable bridge at startup
> > +			  1 if driver should enable bridge at startup
> > +			  Default is to leave bridge in current state.
> 
> I know, that there are bindings, that configure via devicetree, but AFAIK
> this is not okay.

Yes there is configuration in the DT. I attended a presentation at ELC in 
Dublin 3 weeks ago - Frank Rowand on "Solving Device Tree Issues."  He said in 
addition to non-probable hardware information, it was a "dirty secret" that DT
includes configuration information and some policy.

Alan
