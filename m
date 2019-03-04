From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga
 driver
Date: Mon, 4 Mar 2019 11:35:28 +0000
Message-ID: <BYAPR02MB4710216D63D98A56ABD99E67C2710@BYAPR02MB4710.namprd02.prod.outlook.com>
References: <20190121173835.21173-1-nava.manne@xilinx.com>
 <20190121173835.21173-7-nava.manne@xilinx.com> <20190121154928.GA32129@bogus>
 <BYAPR02MB4710D1404CF2816599623363C2980@BYAPR02MB4710.namprd02.prod.outlook.com>
 <CAL_JsqKy0DB+nt+q307d2HHuuf1OCdCe-Ro-5covdTibBwQw8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKy0DB+nt+q307d2HHuuf1OCdCe-Ro-5covdTibBwQw8A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jolly Shah <JOLLYS@xilinx.com>, Rajan Vaja <RAJANV@xilinx.com>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

 Thanks for providing the review comments..
Please find my response inline.

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Saturday, February 23, 2019 2:01 AM
> To: Nava kishore Manne <navam@xilinx.com>
> Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Rajan Vaja
> <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
> <JOLLYS@xilinx.com>; chinnikishore369@gmail.com
> Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga
> driver
> 
> On Wed, Jan 23, 2019 at 2:46 PM Nava kishore Manne <navam@xilinx.com>
> wrote:
> >
> > Hi Rob,
> >
> >
> >
> > Thanks for providing the comments...
> 
> Please fix your mailer to send plain text emails to mail lists.
> 
Thanks for pointing it..

> 
> > > -----Original Message-----
> >
> > > From: Rob Herring [mailto:robh@kernel.org]
> >
> > > Sent: Monday, January 21, 2019 9:19 PM
> >
> > > To: Nava kishore Manne <navam@xilinx.com>
> >
> > > Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Rajan
> > > Vaja
> >
> > > <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org; linux-
> >
> > > kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
> >
> > > <JOLLYS@xilinx.com>; chinnikishore369@gmail.com
> >
> > > Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for
> > > ZynqMP fpga
> >
> > > driver
> >
> > >
> >
> > > On Mon, Jan 21, 2019 at 11:08:35PM +0530, Nava kishore Manne wrote:
> >
> > > > Add documentation to describe Xilinx ZynqMP fpga driver bindings.
> >
> > > >
> >
> > > > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> >
> > > > ---
> >
> > > > Changes for v3:
> >
> > > >                         -Removed PCAP as a child node to the FW
> > > > and Created
> >
> > > >                         an independent node since PCAP driver is a
> > > > consumer
> >
> > > >                         not a provider.
> >
> > > >
> >
> > > >  .../bindings/fpga/xlnx,zynqmp-pcap-fpga.txt         | 13 +++++++++++++
> >
> > > >  1 file changed, 13 insertions(+)
> >
> > > >  create mode 100644
> >
> > > > Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> >
> > > >
> >
> > > > diff --git
> >
> > > > a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> >
> > > > b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> >
> > > > new file mode 100644
> >
> > > > index 000000000000..1f6f58872311
> >
> > > > --- /dev/null
> >
> > > > +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga
> > > > +++ .txt
> >
> > > > @@ -0,0 +1,13 @@
> >
> > > > +Device Tree zynqmp-fpga bindings for the Zynq Ultrascale+ MPSoC
> >
> > > > +controlled using ZynqMP SoC firmware interface For Bitstream
> >
> > > > +configuration on ZynqMp Soc uses processor configuration
> >
> > > > +port(PCAP) to configure the programmable logic(PL) through PS by
> >
> > > > +using FW interface.
> >
> > > > +
> >
> > > > +Required properties:
> >
> > > > +- compatible: should contain "xlnx,zynqmp-pcap-fpga"
> >
> > > > +
> >
> > > > +Example:
> >
> > > > +      zynqmp_pcap: pcap {
> >
> > > > +                     compatible = "xlnx,zynqmp-pcap-fpga";
> >
> > > > +      };
> >
> > >
> >
> > > There's no need for a DT node. Just make the firware driver create a
> > > platform
> >
> > > device for pcap.
> >
> > >
> >
> >
> >
> > This driver being used by the FPGA manager framework(fpga-region) to apply
> overlay's so this node is needed AFAIK.
> 
> The binding says nothing about child nodes and what they are. Please define
> that.
>
Do you mean I need to add the example usage of the pcap node like as below in the binding doc?

Device Tree Example for Full Reconfiguration
============================================

Live Device Tree contains:

        zynqmp_pcap: pcap {
                compatible = "xlnx,zynqmp-pcap-fpga";
        };

        fpga_region0: fpga-region0 {
                compatible = "fpga-region";
                fpga-mgr = <&zynqmp_pcap>;
                #address-cells = <0x1>;
                #size-cells = <0x1>;
                ranges;
        };

DT Overlay contains:
/dts-v1/ /plugin/;
/ {
fragment@0 {
        target = <&fpga_region0>;
        #address-cells = <1>;
        #size-cells = <1>;
        __overlay__ {
                #address-cells = <1>;
                #size-cells = <1>;

                firmware-name = "zynqmp-gpio.bin";

                gpio1: gpio@40000000 {
                        compatible = "xlnx,xps-gpio-1.00.a";
                        reg = <0x40000000 0x10000>;
                        gpio-controller;
                        #gpio-cells = <0x2>;
                        xlnx,gpio-width= <0x6>;
                };
        };
};
 
Please correct me if my understanding is wrong.

Regards,
Navakishore.
