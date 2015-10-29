From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v12 5/6] ARM: socfpga: add bindings document for fpga
 bridge drivers
Date: Thu, 29 Oct 2015 10:04:58 -0500
Message-ID: <alpine.DEB.2.02.1510290957130.17743@linuxheads99>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com> <1445983755-24007-6-git-send-email-atull@opensource.altera.com> <CAL_JsqL27TZzcei9VtrsmXoj=Y2do_HMRpaMukKrmgAuemh2rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL27TZzcei9VtrsmXoj=Y2do_HMRpaMukKrmgAuemh2rg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, delicious.quinoa@gmail.com, Dinh Nguyen <dinguyen@opensource.altera.com>, Matthew Gerlach <mgerlach@altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Rob Herring wrote:

> On Tue, Oct 27, 2015 at 5:09 PM,  <atull@opensource.altera.com> wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> >
> > Add bindings documentation for Altera SOCFPGA bridges:
> >  * fpga2sdram
> >  * fpga2hps
> >  * hps2fpga
> >  * lwhps2fpga
> >
> > Signed-off-by: Alan Tull <dinguyen@opensource.altera.com>
> 
> Oops...

Wow. Ugh.

> 
> > Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> > Signed-off-by: Matthew Gerlach <mgerlach@altera.com>
> 
> These should be roughly in order of who did modifications. I'd expect
> you to be last.

I wrote the driver, Matthew, Dinh, and I all made mods.

> 
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
> > +- compatible           : Should contain "altr,socfpga-fpga2sdram-bridge"
> > +
> > +Optional properties:
> > +- label                        : User-readable name for this bridge.
> > +                         Default is br<device#>
> 
> Why does the user need label? We generally use label to match physical
> labels like "Rear USB port" or "disk LED" or something.
> 

I'll remove it.

> > +- init-val             : 0 if driver should disable bridge at startup
> > +                         1 if driver should enable bridge at startup
> 
> Perhaps "bridge-enable" would be a more descriptive name.
> 

I could change it to bridge-enable.  Alternatively I could have two
booleans that are bridge-enable and bridge-disable as:

  bridge-enable  : boolean property should be defined if driver should
                   enable bridge at startup
  bridge-disable : boolean property should be defined if driver should
                   disable bridge at startup
  Default if neither bridge-enable or bridge-disable are specified is
    driver will leave bridge in its current state.

> And to comment on other replies, I have no problem with this type of
> property in the DT. But yes, configuration type properties will get
> more scrutiny.
> 
> > +                         Default is to leave bridge in current state.
> > +
> > +Example:
> > +       fpga2sdram_br: fpgabridge@3 {
> > +               compatible = "altr,socfpga-fpga2sdram-bridge";
> > +               label = "fpga2sdram";
> > +               init-val = <0>;
> > +       };
> > diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > new file mode 100644
> > index 0000000..eb52f3b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
> > @@ -0,0 +1,36 @@
> > +Altera FPGA/HPS Bridge Driver
> > +
> > +Required properties:
> > +- compatible   : Should contain one of:
> > +                 "altr,socfpga-hps2fpga-bridge",
> > +                 "altr,socfpga-lwhps2fpga-bridge", or
> > +                 "altr,socfpga-fpga2hps-bridge"
> > +- clocks       : Clocks used by this module.
> > +
> > +Optional properties:
> > +- label                : User-readable name for this bridge.
> > +                 Default is br<device#>
> > +- init-val     : 0 if driver should disable bridge at startup.
> > +                 1 if driver should enable bridge at startup.
> > +                 Default is to leave bridge in its current state.
> > +
> > +Example:
> > +       hps_fpgabridge0: fpgabridge@0 {
> > +               compatible = "altr,socfpga-hps2fpga-bridge";
> > +               label = "hps2fpga";
> > +               clocks = <&l4_main_clk>;
> > +               init-val = <1>;
> > +       };
> > +
> > +       hps_fpgabridge1: fpgabridge@1 {
> > +               compatible = "altr,socfpga-lwhps2fpga-bridge";
> > +               label = "lwhps2fpga";
> > +               clocks = <&l4_main_clk>;
> > +               init-val = <0>;
> > +       };
> > +
> > +       hps_fpgabridge2: fpgabridge@2 {
> > +               compatible = "altr,socfpga-fpga2hps-bridge";
> > +               label = "fpga2hps";
> > +               clocks = <&l4_main_clk>;
> > +       };
> > --
> > 1.7.9.5
> >
> 
