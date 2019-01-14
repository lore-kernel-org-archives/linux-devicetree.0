From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Date: Mon, 14 Jan 2019 09:47:41 +0000
Message-ID: <CY4PR02MB2709C346C4BEF853C48C32DCA7800@CY4PR02MB2709.namprd02.prod.outlook.com>
References: <1527620084-94864-1-git-send-email-vishal.sagar@xilinx.com>
 <1527620084-94864-2-git-send-email-vishal.sagar@xilinx.com>
 <20190108130457.syjuq7u7vep3km3h@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108130457.syjuq7u7vep3km3h@paasikivi.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Vishal Sagar <vishal.sagar@xilinx.com>
Cc: Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Dinesh Kumar <dineshk@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for reviewing this.=20

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus@linux.intel.com]
> Sent: Tuesday, January 08, 2019 6:35 PM
> To: Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> Michal Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; mchehab@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Dinesh Kumar
> <dineshk@xilinx.com>; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 1/2] media: dt-bindings: media: xilinx: Add Xilinx MI=
PI CSI-2
> Rx Subsystem
>=20
> EXTERNAL EMAIL
>=20
> Hi Vishal,
>=20
> The patchset hard escaped me somehow earlier and your reply to Rob made m=
e
> notice it again. Thanks. :-)
>=20
> On Wed, May 30, 2018 at 12:24:43AM +0530, Vishal Sagar wrote:
> > Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> >
> > The Xilinx MIPI CSI-2 Rx Subsystem consists of a DPHY, CSI-2 Rx, an
> > optional I2C controller and an optional Video Format Bridge (VFB). The
> > active lanes can be configured at run time if enabled in the IP. The
> > DPHY register interface may also be enabled.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > ---
> >  .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 117
> +++++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rx=
ss.txt
> b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > new file mode 100644
> > index 0000000..31ed721
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > @@ -0,0 +1,117 @@
> > +
>=20
> Extra newline.
>=20

Will remove it in next version.=20

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
> > +packet data. This data is taken in by the Video Format Bridge (VFB),
> > +if selected, and converted into AXI4 Stream video data at selected
> > +pixels per clock as per AXI4-Stream Video IP and System Design UG934.
> > +
> > +For more details, please refer to PG232 MIPI CSI-2 Receiver Subsystem.
> >
> +https://www.xilinx.com/support/documentation/ip_documentation/mipi_csi
> 2_rx_subsystem/v3_0/pg232-mipi-csi2-rx.pdf
> > +
> > +Required properties:
> > +
> > +- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-2.0" or
> > +  "xlnx,mipi-csi2-rx-subsystem-3.0"
> > +
> > +- reg: Physical base address and length of the registers set for the d=
evice.
> > +
> > +- interrupt-parent: specifies the phandle to the parent interrupt cont=
roller
> > +
> > +- interrupts: Property with a value describing the interrupt number.
> > +
> > +- xlnx,max-lanes: Maximum active lanes in the design.
> > +
> > +- xlnx,vc: Virtual Channel, specifies virtual channel number to be fil=
tered.
> > +  If this is 4 then all virtual channels are allowed.
>=20
> This seems like something a driver should configure, based on the
> configuration of the connected device.
>=20

The filtering of the Virtual channels is property of the hardware IP and is=
 fixed in design.=20
This is not software controlled.

> > +
> > +- xlnx,csi-pxl-format: This denotes the CSI Data type selected in hw d=
esign.
> > +  Packets other than this data type (except for RAW8 and User defined =
data
> > +  types) will be filtered out. Possible values are RAW6, RAW7, RAW8, R=
AW10,
> > +  RAW12, RAW14, RGB444, RGB555, RGB565, RGB666, RGB888 and
> YUV4228bit.
>=20
> This should be configured at runtime instead through V4L2 sub-device
> interface; it's not a property of the hardware.
>

This too is a property of the hardware IP and is fixed to one data type dur=
ing design to reduce gate count.
So for e.g. if RGB888 is selected during design, then the hardware will onl=
y pass across RGB888 packet data to output.
(RAW8 packets are also allowed to pass through for all data types selected)
This is used in the driver to determine the media bus format of the connect=
ed pads.

> > +
> > +- xlnx,axis-tdata-width: AXI Stream width, This denotes the AXI Stream=
 width.
> > +  It depends on Data type chosen, Video Format Bridge enabled/disabled=
 and
> > +  pixels per clock. If VFB is disabled then its value is either 0x20 (=
32 bit)
> > +  or 0x40(64 bit) width.
> > +
> > +- xlnx,video-format, xlnx,video-width: Video format and width, as defi=
ned in
> > +  video.txt.
>=20
> Ditto.
>=20
Again these are fixed values and can't be changed at run time.=20
These are used to determine the media bus format.

> > +
> > +- port: Video port, using the DT bindings defined in ../video-interfac=
es.txt.
> > +  The CSI 2 Rx Subsystem has a two ports, one input port for connectin=
g to
> > +  camera sensor and other is output port.
> > +
> > +- data-lanes: The number of data lanes through which CSI2 Rx Subsystem=
 is
> > +  connected to the camera sensor as per video-interfaces.txt
>=20
> This is somewhat different from the documentation in video-interfaces.txt=
.
> Could you align the two? I don't think there's a need to document standar=
d
> properties in device binding files elaborately; rather just the hardware
> specific bits.
>=20

Agree. In this current IP there is no way to re-order the lanes which are s=
et at design time.
So physical and logical lanes are at same index. This could only be used to=
 determine how many lanes are allowed to be programmed.
For e.g. if design has set the number of lanes as 4 and xlnx,en-active-lane=
s is present, then the number of lanes=20
can be set from 1 to 4.

> > +
> > +Optional properties:
> > +
> > +- xlnx,en-active-lanes: Enable Active lanes configuration in Protocol
> > +  Configuration Register.
> > +
> > +- xlnx,dphy-present: This is equivalent to whether DPHY register inter=
face is
> > +  enabled or not.
> > +
> > +- xlnx,iic-present: This shows whether subsystem's IIC is present or n=
ot. This
> > +  affects the base address of the DPHY.
> > +
> > +- xlnx,vfb: Video Format Bridge, Denotes if Video Format Bridge is sel=
ected
> > +  so that output is as per AXI stream documented in UG934.
> > +
> > +- xlnx,ppc: Pixels per clock, Number of pixels to be transferred per p=
ixel
> > +  clock. This is valid only if xlnx,vfb property is present.
> > +
> > +Example:
> > +
> > +       csiss_1: csiss@a0020000 {
> > +               compatible =3D "xlnx,mipi-csi2-rx-subsystem-3.0";
> > +               reg =3D <0x0 0xa0020000 0x0 0x20000>;
> > +               interrupt-parent =3D <&gic>;
> > +               interrupts =3D <0 95 4>;
> > +
> > +               xlnx,max-lanes =3D <0x4>;
> > +               xlnx,en-active-lanes;
> > +               xlnx,dphy-present;
> > +               xlnx,iic-present;
> > +               xlnx,vc =3D <0x4>;
> > +               xlnx,csi-pxl-format =3D "RAW8";
> > +               xlnx,vfb;
> > +               xlnx,ppc =3D <0x4>;
> > +               xlnx,axis-tdata-width =3D <0x20>;
> > +
> > +               ports {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +
> > +                       port@0 {
> > +                               reg =3D <0>;
> > +
> > +                               xlnx,video-format =3D <XVIP_VF_YUV_422>=
;
> > +                               xlnx,video-width =3D <8>;
> > +                               csiss_out: endpoint {
> > +                                       remote-endpoint =3D <&vcap_csis=
s_in>;
> > +                               };
> > +                       };
> > +                       port@1 {
> > +                               reg =3D <1>;
> > +
> > +                               xlnx,video-format =3D <XVIP_VF_YUV_422>=
;
> > +                               xlnx,video-width =3D <8>;
> > +
> > +                               csiss_in: endpoint {
> > +                                       data-lanes =3D <1 2 3 4>;
> > +                                       /* MIPI CSI2 Camera handle */
> > +                                       remote-endpoint =3D <&vs2016_ou=
t>;
> > +                               };
> > +
> > +                       };
> > +
> > +               };
> > +       };
> > --
> > 2.7.4
> >
> > This email and any attachments are intended for the sole use of the nam=
ed
> recipient(s) and contain(s) confidential information that may be propriet=
ary,
> privileged or copyrighted under applicable law. If you are not the intend=
ed
> recipient, do not read, copy, or forward this email message or any attach=
ments.
> Delete this email message and any attachments immediately.
>=20
> Could you drop this from v2?
>=20

Ok.=20

Regards
Vishal Sagar

> --
> Regards,
>=20
> Sakari Ailus
> sakari.ailus@linux.intel.com
