From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga driver
Date: Fri, 22 Feb 2019 14:30:38 -0600
Message-ID: <CAL_JsqKy0DB+nt+q307d2HHuuf1OCdCe-Ro-5covdTibBwQw8A@mail.gmail.com>
References: <20190121173835.21173-1-nava.manne@xilinx.com> <20190121173835.21173-7-nava.manne@xilinx.com>
 <20190121154928.GA32129@bogus> <BYAPR02MB4710D1404CF2816599623363C2980@BYAPR02MB4710.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR02MB4710D1404CF2816599623363C2980@BYAPR02MB4710.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <navam@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jolly Shah <JOLLYS@xilinx.com>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2019 at 2:46 PM Nava kishore Manne <navam@xilinx.com> wrote:
>
> Hi Rob,
>
>
>
> Thanks for providing the comments...

Please fix your mailer to send plain text emails to mail lists.


> > -----Original Message-----
>
> > From: Rob Herring [mailto:robh@kernel.org]
>
> > Sent: Monday, January 21, 2019 9:19 PM
>
> > To: Nava kishore Manne <navam@xilinx.com>
>
> > Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Rajan Vaja
>
> > <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org; linux-
>
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
>
> > <JOLLYS@xilinx.com>; chinnikishore369@gmail.com
>
> > Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga
>
> > driver
>
> >
>
> > On Mon, Jan 21, 2019 at 11:08:35PM +0530, Nava kishore Manne wrote:
>
> > > Add documentation to describe Xilinx ZynqMP fpga driver bindings.
>
> > >
>
> > > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
>
> > > ---
>
> > > Changes for v3:
>
> > >                         -Removed PCAP as a child node to the FW and Created
>
> > >                         an independent node since PCAP driver is a consumer
>
> > >                         not a provider.
>
> > >
>
> > >  .../bindings/fpga/xlnx,zynqmp-pcap-fpga.txt         | 13 +++++++++++++
>
> > >  1 file changed, 13 insertions(+)
>
> > >  create mode 100644
>
> > > Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
>
> > >
>
> > > diff --git
>
> > > a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
>
> > > b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
>
> > > new file mode 100644
>
> > > index 000000000000..1f6f58872311
>
> > > --- /dev/null
>
> > > +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
>
> > > @@ -0,0 +1,13 @@
>
> > > +Device Tree zynqmp-fpga bindings for the Zynq Ultrascale+ MPSoC
>
> > > +controlled using ZynqMP SoC firmware interface For Bitstream
>
> > > +configuration on ZynqMp Soc uses processor configuration
>
> > > +port(PCAP) to configure the programmable logic(PL) through PS by
>
> > > +using FW interface.
>
> > > +
>
> > > +Required properties:
>
> > > +- compatible: should contain "xlnx,zynqmp-pcap-fpga"
>
> > > +
>
> > > +Example:
>
> > > +      zynqmp_pcap: pcap {
>
> > > +                     compatible = "xlnx,zynqmp-pcap-fpga";
>
> > > +      };
>
> >
>
> > There's no need for a DT node. Just make the firware driver create a platform
>
> > device for pcap.
>
> >
>
>
>
> This driver being used by the FPGA manager framework(fpga-region) to apply overlay's so this node is needed AFAIK.

The binding says nothing about child nodes and what they are. Please
define that.

Rob
