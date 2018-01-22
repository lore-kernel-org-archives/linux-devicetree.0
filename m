MIME-Version: 1.0
In-Reply-To: <CY4PR02MB24889A5465A0F346CB515D84D6EE0@CY4PR02MB2488.namprd02.prod.outlook.com>
References: <1516067831-11382-1-git-send-email-hyun.kwon@xilinx.com>
	<1516067831-11382-3-git-send-email-hyun.kwon@xilinx.com>
	<20180120003111.bxra3hrt2mnajb76@rob-hp-laptop>
	<CY4PR02MB24889A5465A0F346CB515D84D6EE0@CY4PR02MB2488.namprd02.prod.outlook.com>
Date: Mon, 22 Jan 2018 08:36:17 -0600
Message-ID: <CAL_JsqKAhA8jHL+Cu=74-0UvDDt6JEcC8n3qbvYLAtheziQ-Zw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Hyun Kwon <hyunk@xilinx.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@xilinx.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 19, 2018 at 8:22 PM, Hyun Kwon <hyunk@xilinx.com> wrote:
> Hi Rob,
>
> Thanks for the review.
>
>> -----Original Message-----
>> From: dri-devel [mailto:dri-devel-bounces@lists.freedesktop.org] On Behalf
>> Of Rob Herring
>> Sent: Friday, January 19, 2018 4:31 PM
>> To: Hyun Kwon <hyunk@xilinx.com>
>> Cc: devicetree@vger.kernel.org; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Michal Simek
>> <michal.simek@xilinx.com>; dri-devel@lists.freedesktop.org; Daniel Vetter
>> <daniel.vetter@ffwll.ch>
>> Subject: Re: [PATCH v3 3/8] dt-bindings: display: xlnx: Add ZynqMP DP
>> subsystem bindings
>>
>> On Mon, Jan 15, 2018 at 05:57:06PM -0800, Hyun Kwon wrote:
>> > This add a dt binding for ZynqMP DP subsystem.
>> >
>> > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
>> > ---
>> > v2
>> > - Group multiple ports under 'ports'
>> > - Replace linux specific terms with generic hardware descriptions
>> > ---
>> > ---
>> >  .../bindings/display/xlnx/xlnx,zynqmp-dpsub.txt    | 98
>> ++++++++++++++++++++++
>> >  1 file changed, 98 insertions(+)
>> >  create mode 100644
>> Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-
>> dpsub.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-
>> dpsub.txt
>> > new file mode 100644
>> > index 0000000..dbcbde5
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-
>> dpsub.txt
>> > @@ -0,0 +1,98 @@
>> > +Xilinx ZynqMP DisplayPort subsystem
>> > +-----------------------------------
>> > +
>> > +Required properties:
>> > +
>> > +- compatible: Must be "xlnx,zynqmp-dpsub-1.7".
>> > +
>> > +- reg: Physical base address and length of the registers set for the device.
>> > +- reg-names: Must be "dp", "blend", "av_buf", and "aud" to map logical
>> register
>> > +  partitions.
>> > +
>> > +- interrupts: Interrupt number.
>> > +- interrupts-parent: phandle for interrupt controller.
>> > +
>> > +- clocks: phandles for axi, audio, non-live video, and live video clocks.
>> > +  axi clock is required. Audio clock is optional. If not present, audio will
>> > +  be disabled. One of non-live or live video clock should be present.
>> > +- clock-names: The identification strings are required. "aclk" for axi clock.
>> > +  "dp_aud_clk" for audio clock. "dp_vtc_pixel_clk_in" for non-live video
>> clock.
>> > +  "dp_live_video_in_clk" for live video clock (clock from programmable
>> logic).
>> > +
>> > +- phys: phandles for phy specifier.
>>
>> phandles? How many?
>>
>
> Configurable between 1 or 2 lanes. Will add more details.
>
>> > +- phy-names: The identifier strings. "dp-phy" followed by index.
>> > +
>> > +- power-domains: phandle for the corresponding power domain
>> > +
>> > +- ports: There are 2 logical blocks in the IP: display controller and
>> > +  DisplayPort encoder. Each block can be used / connected independently
>> with
>>
>> I'm confused. The block described in this doc is just DisplayPort
>> encoder or both display controller and DisplayPort? Or something else?
>>
>
> The DP subsystem includes both block, protocol indipendent controller in front
> and the DisplayPort transmitter in the back. I'll try to elaborate / clarify
> better.

But you already have a subsystem node with "xlnx,display". You shouldn't need 2.


>> > +  external device, hence ports for each block are required using DT
>> bindings
>> > +  defined in Documentation/devicetree/bindings/graph.txt. Refer to
>> > +  ./xlnx,display.txt for how topology for entire pipeline is described.
>> > +
>> > +- vid-layer, gfx-layer: Required to represent available layers
>> > +
>> > +Required layer properties
>> > +
>> > +- dmas: phandles for DMA channels as defined in
>> > +  Documentation/devicetree/bindings/dma/dma.txt.
>> > +- dma-names: The identifier strings are required. "graphics0" for graphics
>> > +  layer. "video" followed by index for video layer
>> > +
>> > +Optional child node
>> > +
>> > +- The driver populates any child device node in this node. This can be
>> used,
>> > +  for example, to populate the sound device from the DisplayPort
>> subsystem
>> > +  driver.
>> > +
>> > +Example:
>> > +       zynqmp_dpsub: zynqmp_dpsub@fd4a0000 {
>>
>> video-codec@... if this the DP encoder.
>>
>> > +               compatible = "xlnx,zynqmp-dpsub-1.7";
>> > +               reg = <0x0 0xfd4a0000 0x0 0x1000>,
>> > +                     <0x0 0xfd4aa000 0x0 0x1000>,
>> > +                     <0x0 0xfd4ab000 0x0 0x1000>,
>> > +                     <0x0 0xfd4ac000 0x0 0x1000>;
>> > +               reg-names = "dp", "blend", "av_buf", "aud";
>> > +               interrupts = <0 119 4>;
>> > +               interrupt-parent = <&gic>;
>> > +
>> > +               clock-names = "dp_apb_clk", "dp_aud_clk",
>> "dp_live_video_in_clk";
>> > +               clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
>> > +
>> > +               phys = <&lane1>, <&lane0>;
>> > +               phy-names = "dp-phy0", "dp-phy1";
>> > +
>> > +               power-domains = <&pd_dp>;
>> > +
>> > +               vid-layer {
>> > +                       dma-names = "vid0", "vid1", "vid2";
>>
>> Documentation says these should be "videoX".
>>
>
> Will fix.
>
>> > +                       dmas = <&xlnx_dpdma 0>,
>> > +                              <&xlnx_dpdma 1>,
>> > +                              <&xlnx_dpdma 2>;
>> > +               };
>> > +
>> > +               gfx-layer {
>> > +                       dma-names = "gfx0";
>>
>> And "graphics0"
>>
>
> Will fix.
>
>> > +                       dmas = <&xlnx_dpdma 3>;
>> > +               };
>>
>> You don't need these child nodes. Just do:
>>
>> dma-names = "vid0", "vid1", "vid2", "gfx0";
>>
>> Or gfx0 first.
>>
>
> Sure. As mentioned earlier, each layer will have to be referenced independently
> by other nodes in upcoming patches. But I can follow your suggestion for now,
> and make change when it's needed.

No, you can't change it later. The binding is an ABI and you must maintain backwards compatibility (old dtb works with new kernel).

So you should make your binding complete as you can now even if the driver doesn't use parts of the binding yet.

Rob
