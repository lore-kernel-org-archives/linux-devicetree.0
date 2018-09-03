From: Nava kishore Manne <navam@xilinx.com>
Subject: RE: [RFC PATCH 1/2] ARM: dt: fpga: Added binding docs for Xilinx
 zynqmp FPGA manager
Date: Mon, 3 Sep 2018 08:59:37 +0000
Message-ID: <BYAPR02MB471047F38899D78151AC1805C20C0@BYAPR02MB4710.namprd02.prod.outlook.com>
References: <20180801100457.25614-1-nava.manne@xilinx.com>
 <20180814161917.GA26926@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814161917.GA26926@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "atull@opensource.altera.com" <atull@opensource.altera.com>, "moritz.fischer@ettus.com" <moritz.fischer@ettus.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Appana Durga Kedareswara Rao <appanad@xilinx.com>, "chinnikishore369@gmail.com" <chinnikishore369@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the providing the comments...
Please find my response inline...

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, August 14, 2018 9:49 PM
> To: Nava kishore Manne <navam@xilinx.com>
> Cc: mark.rutland@arm.com; Michal Simek <michals@xilinx.com>; Soren
> Brinkmann <sorenb@xilinx.com>; atull@opensource.altera.com;
> moritz.fischer@ettus.com; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Appana Durga
> Kedareswara Rao <appanad@xilinx.com>; chinnikishore369@gmail.com; Nava
> kishore Manne <navam@xilinx.com>
> Subject: Re: [RFC PATCH 1/2] ARM: dt: fpga: Added binding docs for Xilinx
> zynqmp FPGA manager
>=20
> On Wed, Aug 01, 2018 at 03:34:56PM +0530, Nava kishore Manne wrote:
> > New bindings document for zynqmp fpga manager.
> >
> > Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> > ---
> >  .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt   | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> > b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> > new file mode 100644
> > index 000000000000..0eac747747f5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> > @@ -0,0 +1,9 @@
> > +Xilinx Zynqmp FPGA Manager
> > +
> > +Required properties:
> > +- compatible:		should contain "xlnx,zynqmp-pcap-fpga"
> > +
> > +Example:
> > +	pcap: pcap@00 {
> > +		compatible =3D "xlnx,zynqmp-pcap-fpga";
>=20
> How is this accessed? Via firmware interface? If so, need to define it is=
 a child of
> the firmware node.

Yes, it's uses firmware interface...
Will fix it in the next version.

Regards,
Navakishore.
