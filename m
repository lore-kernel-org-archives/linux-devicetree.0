From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH v3 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Date: Fri, 8 Mar 2019 19:04:53 +0000
Message-ID: <CY4PR02MB27098AB5D144C74AE6553699A74D0@CY4PR02MB2709.namprd02.prod.outlook.com>
References: <1549025766-135037-1-git-send-email-vishal.sagar@xilinx.com>
 <1549025766-135037-2-git-send-email-vishal.sagar@xilinx.com>
 <fe975327-2746-28d4-1340-5ad1e71858f1@lucaceresoli.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fe975327-2746-28d4-1340-5ad1e71858f1@lucaceresoli.net>
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
To: Luca Ceresoli <luca@lucaceresoli.net>, Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Luca,

Thanks for reviewing this. Sorry I missed out on replying to this earlier.
I had already sent v4 but have requested to be ignored. Your comments will be addressed in the v5 patch series.

> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Luca Ceresoli
> Sent: Monday, February 11, 2019 4:12 PM
> To: Vishal Sagar <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
> laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; sakari.ailus@linux.intel.com;
> hans.verkuil@cisco.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Dinesh Kumar <dineshk@xilinx.com>; Sandip Kothari
> <sandipk@xilinx.com>
> Subject: Re: [PATCH v3 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
> CSI-2 Rx Subsystem
> 
> EXTERNAL EMAIL
> 
> Hi Vishal,
> 
> sorry for joining late in reviewing your patches. I have a few small
> comments.
> 
> On 01/02/19 13:56, Vishal Sagar wrote:
> > Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> >
> > The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> > DPHY in Rx mode, an optional I2C controller and a Video Format Bridge.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > ---
> > v3
> > - removed interrupt parent as suggested by Rob
> > - removed dphy clock
> > - moved vfb to optional properties
> > - Added required and optional port properties section
> > - Added endpoint property section
> >
> > v2
> > - updated the compatible string to latest version supported
> > - removed DPHY related parameters
> > - added CSI v2.0 related property (including VCX for supporting upto 16
> >   virtual channels).
> > - modified csi-pxl-format from string to unsigned int type where the value
> >   is as per the CSI specification
> > - Defined port 0 and port 1 as sink and source ports.
> > - Removed max-lanes property as suggested by Rob and Sakari
> >
> >  .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 123
> +++++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > new file mode 100644
> > index 0000000..399f7fa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > @@ -0,0 +1,123 @@
> > +Xilinx MIPI CSI2 Receiver Subsystem Device Tree Bindings
> > +--------------------------------------------------------
> > +
> > +The Xilinx MIPI CSI2 Receiver Subsystem is used to capture MIPI CSI2 traffic
> > +from compliant camera sensors and send the output as AXI4 Stream video
> data
> > +for image processing.
> > +
> > +The subsystem consists of a MIPI DPHY in slave mode which captures the
> > +data packets. This is passed along the MIPI CSI2 Rx IP which extracts the
> > +packet data. The Video Format Bridge (VFB) converts this data to AXI4
> Stream
> > +video data.
> 
> I'd clarify the vfb is optional:
> "The Video Format Bridge" -> "The optional Video Format Bridge",
> otherwise it has to be inferred from the property description below.
> 

Agreed. I will update and resend.

> > +For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Subsystem.
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-4.0".
> > +- reg: Physical base address and length of the registers set for the device.
> > +- interrupts: Property with a value describing the interrupt number.
> > +- clocks: List of phandles to AXI Lite, Video and 200 MHz DPHY clocks.
> > +- clock-names: Must contain "lite_aclk" and "video_aclk" in the same order
> > +  as clocks listed in clocks property.
> 
> Two clock names and 3 clocks?
>

Yes I need to correct this. I will update and resend.

> > +- xlnx,csi-pxl-format: This denotes the CSI Data type selected in hw design.
> > +  Packets other than this data type (except for RAW8 and User defined data
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
> > +
> > +
> > +Optional properties:
> > +--------------------
> > +- xlnx,vfb: This is present when Video Format Bridge is enabled.
> > +  Without this property the driver won't be loaded as IP won't be able to
> generate
> > +  media bus format compliant stream output.
> > +- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
> > +- xlnx,en-vcx: When present, there are maximum 16 virtual channels, else
> > +  only 4. This is present only if xlnx,en-csi-v2-0 is present.
> > +- xlnx,en-active-lanes: Enable Active lanes configuration in Protocol
> > +  Configuration Register.
> 
> This doesn't seem very clear to me. According to my understanding of the
> IP and driver, I'd rather rephrase as:
> 
> - xlnx,en-active-lanes: present if the number of active lanes can be
>   reconfigured at runtime in the Protocol Configuration Register.
>   If present, the V4L2_CID_XILINX_MIPICSISS_ACT_LANES is added.
>   Otherwise all lanes are always active.
> 

Your description is better. I will update with this in next version.

> > +Ports
> > +-----
> > +The device node shall contain two 'port' child nodes as defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +The port@0 is sink port and shall connect to CSI2 source like camera.
> 
> "is a sink port"

Agree to this.

> 
> > +It must have the data-lanes property. It may have the xlnx,cfa-pattern
> > +property to indicate bayer pattern of source.
> > +
> > +The port@1 is source port could be connected to any video processing IP
> 
> "is a source port and can be"
> 

Agree to this.

> > +which can work with AXI4 Stream data.
> > +
> > +Required port properties:
> > +--------------------
> > +- reg: 0 - for sink port.
> > +       1 - for source port.
> > +
> > +Optional port properties:
> > +--------------------
> > +- xlnx,cfa-pattern: This goes in the sink port to indicate bayer pattern.
> > +  Valid values are "bggr", "rggb", "gbrg" and "grbg".
> 
> Please excuse my ignorance, but does the csi2 rx module really [need to]
> know the cfa pattern? I used to think  the sensor and debayer module
> need to agree on it and CSI2 just moves bytes around. Also, other CSI2
> RX drivers I've looked at don't have this property.
> 

Your query is correct. 
I had assumed that the bayer pattern would always be required in RAW data type case.
I will remove the cfa-pattern / bayer pattern information from the CSI2 driver in the next version.
Thanks for catching this.

> > +Optional endpoint property:
> > +---------------------------
> > +- data-lanes: specifies MIPI CSI-2 data lanes as covered in video-
> interfaces.txt.
> > +  This should be in the sink port endpoint which connects to MIPI CSI2 source
> > +  like sensor. The possible values are:
> > +  1       - For 1 lane enabled in IP.
> > +  1 2     - For 2 lanes enabled in IP.
> > +  1 2 3   - For 3 lanes enabled in IP.
> > +  1 2 3 4 - For 4 lanes enabled in IP.
> > +
> > +Example:
> > +
> > +     csiss_1: csiss@a0020000 {
> > +             compatible = "xlnx,mipi-csi2-rx-subsystem-4.0";
> > +             reg = <0x0 0xa0020000 0x0 0x10000>;
> > +             interrupt-parent = <&gic>;
> > +             interrupts = <0 95 4>;
> > +             xlnx,csi-pxl-format = <0x2a>;
> > +             xlnx,vfb;
> > +             xlnx,en-active-lanes;
> > +             xlnx,en-csi-v2-0;
> > +             xlnx,en-vcx;
> > +             clock-names = "lite_aclk", "video_aclk";
> > +             clocks = <&misc_clk_0>, <&misc_clk_1>, <&misc_clk_2>;
> 
> As above: two clock names and 3 clocks?

I will remove this in the next version.

Regards
Vishal Sagar

> 
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             /* Sink port */
> > +                             reg = <0>;
> > +                             xlnx,cfa-pattern = "bggr"
> > +                             csiss_in: endpoint {
> > +                                     data-lanes = <1 2 3 4>;
> > +                                     /* MIPI CSI2 Camera handle */
> > +                                     remote-endpoint = <&camera_out>;
> > +                             };
> > +                     };
> > +                     port@1 {
> > +                             /* Source port */
> > +                             reg = <1>;
> > +                             csiss_out: endpoint {
> > +                                     remote-endpoint = <&vproc_in>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> 
> --
> Luca
