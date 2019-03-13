From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga driver
Date: Wed, 13 Mar 2019 15:07:04 -0500
Message-ID: <CAL_JsqJnG_zMxy-ESTey5tzeEnU3LA8GjZ7aLB3i+05rqkqDsg@mail.gmail.com>
References: <20190121173835.21173-1-nava.manne@xilinx.com> <20190121173835.21173-7-nava.manne@xilinx.com>
 <20190121154928.GA32129@bogus> <BYAPR02MB4710D1404CF2816599623363C2980@BYAPR02MB4710.namprd02.prod.outlook.com>
 <CAL_JsqKy0DB+nt+q307d2HHuuf1OCdCe-Ro-5covdTibBwQw8A@mail.gmail.com>
 <BYAPR02MB4710216D63D98A56ABD99E67C2710@BYAPR02MB4710.namprd02.prod.outlook.com>
 <CAL_JsqLn8LrO_qHkXK0hgwjvsedMCAEL0MTYXBLrke2cgri3+g@mail.gmail.com> <BYAPR02MB471068180BA4592779B0C2CEC2720@BYAPR02MB4710.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR02MB471068180BA4592779B0C2CEC2720@BYAPR02MB4710.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <navam@xilinx.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Moritz Fischer <moritz.fischer@ettus.com>, Alan Tull <atull@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jolly Shah <JOLLYS@xilinx.com>, Rajan Vaja <RAJANV@xilinx.com>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 5, 2019 at 3:42 AM Nava kishore Manne <navam@xilinx.com> wrote:
>
> Hi Rob,
>
> Thanks for the quick response.
> Please find my response inline.
>
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Monday, March 4, 2019 10:57 PM
> > To: Nava kishore Manne <navam@xilinx.com>
> > Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Rajan Vaja
> > <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
> > <JOLLYS@xilinx.com>; chinnikishore369@gmail.com
> > Subject: Re: [PATCH v3 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga
> > driver

Please fix your mail program to...

> > On Mon, Mar 4, 2019 at 5:35 AM Nava kishore Manne <navam@xilinx.com>
> > wrote:

...use this style reply header.

[...]

> > > Device Tree Example for Full Reconfiguration
> > > ============================================
> > >
> > > Live Device Tree contains:
> > >
> > >         zynqmp_pcap: pcap {
> > >                 compatible = "xlnx,zynqmp-pcap-fpga";
> > >         };
> > >
> > >         fpga_region0: fpga-region0 {
> >
> > This should be a child of pcap.
> >
> AFAIK we can't put the fpga-region as a child of pcap as both are independent and they refered to each other using phandlers
> I have made this changes by looking into the below reference doc.
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/fpga/fpga-region.txt

Indeed. But having them a as child of the firmware node doesn't make
sense either. Putting them at the top level would make more sense. I
don't recall why we didn't make them a child. Maybe regions can span
multiple bridges in the case with bridges.

> > >                 compatible = "fpga-region";
> > >                 fpga-mgr = <&zynqmp_pcap>;
> > >                 #address-cells = <0x1>;
> > >                 #size-cells = <0x1>;
> > >                 ranges;
> > >         };
> > >
> > > DT Overlay contains:
> >
> > Don't show overlays in examples. Just show a final tree (i.e. base with overlay
> > applied).
>
> To get a better picture for the users i have added this example node with overlays
> I feel it's good to have this info because it will not impact the functionality of PCAP node.

Then feel free to document this somewhere else. As we move to schema
documents, your examples will have to compile and validate against the
schema. I don't want to add applying overlays to the mix.

Rob
