From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH v2 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Date: Thu, 31 Jan 2019 08:07:13 +0000
Message-ID: <CY4PR02MB27091A04C6BA664C1C48D0D8A7910@CY4PR02MB2709.namprd02.prod.outlook.com>
References: <1548438777-11203-1-git-send-email-vishal.sagar@xilinx.com>
 <1548438777-11203-2-git-send-email-vishal.sagar@xilinx.com>
 <20190130194052.GA9543@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130194052.GA9543@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Vishal Sagar <vishal.sagar@xilinx.com>
Cc: Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviewing.

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, January 31, 2019 1:11 AM
> To: Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; sakari.ailus@linux.intel.com;
> hans.verkuil@cisco.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Dinesh Kumar <dineshk@xilinx.com>; Sandip Kothari
> <sandipk@xilinx.com>
> Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: xilinx: Add Xilinx=
 MIPI
> CSI-2 Rx Subsystem
>=20
> EXTERNAL EMAIL
>=20
> On Fri, Jan 25, 2019 at 11:22:56PM +0530, Vishal Sagar wrote:
> > Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> >
> > The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> > DPHY in Rx mode, an optional I2C controller and a Video Format Bridge.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > ---
> > v2
> > - updated the compatible string to latest version supported
> > - removed DPHY related parameters
> > - added CSI v2.0 related property (including VCX for supporting upto 16
> >   virtual channels).
> > - modified csi-pxl-format from string to unsigned int type where the va=
lue
> >   is as per the CSI specification
> > - Defined port 0 and port 1 as sink and source ports.
> > - Removed max-lanes property as suggested by Rob and Sakari
> >
> >  .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 105
> +++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rx=
ss.txt
> b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > new file mode 100644
> > index 0000000..98781cf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > @@ -0,0 +1,105 @@
> > +Xilinx MIPI CSI2 Receiver Subsystem Device Tree Bindings
> > +--------------------------------------------------------
> > +
> > +The Xilinx MIPI CSI2 Receiver Subsystem is used to capture MIPI CSI2 t=
raffic
> > +from compliant camera sensors and send the output as AXI4 Stream video
> data
> > +for image processing.
> > +
> > +The subsystem consists of a MIPI DPHY in slave mode which captures the
> > +data packets. This is passed along the MIPI CSI2 Rx IP which extracts =
the
> > +packet data. The Video Format Bridge (VFB) converts this data to AXI4
> Stream
> > +video data.
> > +
> > +For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Sub=
system.
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-4.0".
> > +- reg: Physical base address and length of the registers set for the d=
evice.
> > +- interrupt-parent: specifies the phandle to the parent interrupt cont=
roller
>=20
> Don't document this. It is implied.

Ok. I will remove this in next revision.

>=20
> > +- interrupts: Property with a value describing the interrupt number.
> > +- clocks: List of phandles to AXI Lite, Video and 200 MHz DPHY clocks.
> > +- clock-names: Must contain "lite_aclk", "video_aclk" and "dphy_clk_20=
0M"
> in
> > +  the same order as clocks listed in clocks property.
> > +- xlnx,csi-pxl-format: This denotes the CSI Data type selected in hw d=
esign.
> > +  Packets other than this data type (except for RAW8 and User defined =
data
> > +  types) will be filtered out. Possible values are as below -
> > +  0x1E - YUV4228B
> > +  0x1F - YUV42210B
> > +  0x20 - RGB444
> > +  0x21 - RGB555
> > +  0x22 - RGB565
> > +  0x23 - RGB666
> > +  0x24 - RGB888
> > +  0x28 - RAW6
> > +  0x29 - RAW7
> > +  0x2A - RAW8
> > +  0x2B - RAW10
> > +  0x2C - RAW12
> > +  0x2D - RAW14
> > +  0x2E - RAW16
> > +  0x2F - RAW20
> > +- xlnx,vfb: This is present when Video Format Bridge is enabled.
>=20
> boolean?
>=20

Yes this is a Boolean.=20

> > +
> > +Optional properties:
> > +--------------------
> > +- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
> > +- xlnx,en-vcx: When present, there are maximum 16 virtual channels, el=
se
> > +  only 4. This is present only if xlnx,en-csi-v2-0 is present.
> > +- xlnx,en-active-lanes: Enable Active lanes configuration in Protocol
> > +  Configuration Register.
> > +- xlnx,cfa-pattern: This goes in the sink port to indicate bayer patte=
rn.
> > +  Valid values are "bggr", "rggb", "gbrg" and "grbg".
>=20
> This should go in the endpoint with the other properties. I'd also move
> it down below 'Ports' to be clear it goes in a different node.
>=20

Agree. I will do this in next revision.

> > +
> > +Ports
> > +-----
> > +The device node shall contain two 'port' child nodes as defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +The port@0 is sink port and shall connect to CSI2 source like camera.
> > +It must have the data-lanes property. It may have the xlnx,cfa-pattern
> > +property to indicate bayer pattern of source.
> > +
> > +The port@1 is source port could be connected to any video processing I=
P
> > +which can work with AXI4 Stream data.
> > +
> > +Both ports must have remote-endpoints.
>=20
> No need to state that. That's implicit for the graph to work...

Ok=20

Regards
Vishal Sagar

> > +
> > +Example:
> > +
> > +     csiss_1: csiss@a0020000 {
> > +             compatible =3D "xlnx,mipi-csi2-rx-subsystem-4.0";
> > +             reg =3D <0x0 0xa0020000 0x0 0x10000>;
> > +             interrupt-parent =3D <&gic>;
> > +             interrupts =3D <0 95 4>;
> > +             xlnx,csi-pxl-format =3D <0x2a>;
> > +             xlnx,vfb;
> > +             xlnx,en-active-lanes;
> > +             xlnx,en-csi-v2-0;
> > +             xlnx,en-vcx;
> > +             clock-names =3D "lite_aclk", "dphy_clk_200M", "video_aclk=
";
> > +             clocks =3D <&misc_clk_0>, <&misc_clk_1>, <&misc_clk_2>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             /* Sink port */
> > +                             reg =3D <0>;
> > +                             xlnx,cfa-pattern =3D "bggr"
> > +                             csiss_in: endpoint {
> > +                                     data-lanes =3D <1 2 3 4>;
> > +                                     /* MIPI CSI2 Camera handle */
> > +                                     remote-endpoint =3D <&camera_out>=
;
> > +                             };
> > +                     };
> > +                     port@1 {
> > +                             /* Source port */
> > +                             reg =3D <1>;
> > +                             csiss_out: endpoint {
> > +                                     remote-endpoint =3D <&vproc_in>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > --
> > 2.7.4
> >
