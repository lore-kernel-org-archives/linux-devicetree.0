From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/8] dt-bindings: display: xlnx: Add ZynqMP DP
 subsystem bindings
Date: Fri, 19 Jan 2018 18:31:11 -0600
Message-ID: <20180120003111.bxra3hrt2mnajb76@rob-hp-laptop>
References: <1516067831-11382-1-git-send-email-hyun.kwon@xilinx.com>
 <1516067831-11382-3-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516067831-11382-3-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 05:57:06PM -0800, Hyun Kwon wrote:
> This add a dt binding for ZynqMP DP subsystem.
> 
> Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> v2
> - Group multiple ports under 'ports'
> - Replace linux specific terms with generic hardware descriptions
> ---
> ---
>  .../bindings/display/xlnx/xlnx,zynqmp-dpsub.txt    | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
> new file mode 100644
> index 0000000..dbcbde5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
> @@ -0,0 +1,98 @@
> +Xilinx ZynqMP DisplayPort subsystem
> +-----------------------------------
> +
> +Required properties:
> +
> +- compatible: Must be "xlnx,zynqmp-dpsub-1.7".
> +
> +- reg: Physical base address and length of the registers set for the device.
> +- reg-names: Must be "dp", "blend", "av_buf", and "aud" to map logical register
> +  partitions.
> +
> +- interrupts: Interrupt number.
> +- interrupts-parent: phandle for interrupt controller.
> +
> +- clocks: phandles for axi, audio, non-live video, and live video clocks.
> +  axi clock is required. Audio clock is optional. If not present, audio will
> +  be disabled. One of non-live or live video clock should be present.
> +- clock-names: The identification strings are required. "aclk" for axi clock.
> +  "dp_aud_clk" for audio clock. "dp_vtc_pixel_clk_in" for non-live video clock.
> +  "dp_live_video_in_clk" for live video clock (clock from programmable logic).
> +
> +- phys: phandles for phy specifier.

phandles? How many?

> +- phy-names: The identifier strings. "dp-phy" followed by index.
> +
> +- power-domains: phandle for the corresponding power domain
> +
> +- ports: There are 2 logical blocks in the IP: display controller and
> +  DisplayPort encoder. Each block can be used / connected independently with

I'm confused. The block described in this doc is just DisplayPort 
encoder or both display controller and DisplayPort? Or something else?

> +  external device, hence ports for each block are required using DT bindings
> +  defined in Documentation/devicetree/bindings/graph.txt. Refer to
> +  ./xlnx,display.txt for how topology for entire pipeline is described.
> +
> +- vid-layer, gfx-layer: Required to represent available layers
> +
> +Required layer properties
> +
> +- dmas: phandles for DMA channels as defined in
> +  Documentation/devicetree/bindings/dma/dma.txt.
> +- dma-names: The identifier strings are required. "graphics0" for graphics
> +  layer. "video" followed by index for video layer
> +
> +Optional child node
> +
> +- The driver populates any child device node in this node. This can be used,
> +  for example, to populate the sound device from the DisplayPort subsystem
> +  driver.
> +
> +Example:
> +       zynqmp_dpsub: zynqmp_dpsub@fd4a0000 {

video-codec@... if this the DP encoder.

> +               compatible = "xlnx,zynqmp-dpsub-1.7";
> +               reg = <0x0 0xfd4a0000 0x0 0x1000>,
> +                     <0x0 0xfd4aa000 0x0 0x1000>,
> +                     <0x0 0xfd4ab000 0x0 0x1000>,
> +                     <0x0 0xfd4ac000 0x0 0x1000>;
> +               reg-names = "dp", "blend", "av_buf", "aud";
> +               interrupts = <0 119 4>;
> +               interrupt-parent = <&gic>;
> +
> +               clock-names = "dp_apb_clk", "dp_aud_clk", "dp_live_video_in_clk";
> +               clocks = <&dp_aclk>, <&clkc 17>, <&si570_1>;
> +
> +               phys = <&lane1>, <&lane0>;
> +               phy-names = "dp-phy0", "dp-phy1";
> +
> +               power-domains = <&pd_dp>;
> +
> +               vid-layer {
> +                       dma-names = "vid0", "vid1", "vid2";

Documentation says these should be "videoX".

> +                       dmas = <&xlnx_dpdma 0>,
> +                              <&xlnx_dpdma 1>,
> +                              <&xlnx_dpdma 2>;
> +               };
> +
> +               gfx-layer {
> +                       dma-names = "gfx0";

And "graphics0"

> +                       dmas = <&xlnx_dpdma 3>;
> +               };

You don't need these child nodes. Just do:

dma-names = "vid0", "vid1", "vid2", "gfx0";

Or gfx0 first.

> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       display_port: port@0 {
> +                               reg = <0>;
> +                               display_port: endpoint {
> +                                       remote-endpoint = <&dp_port>;
> +                               };
> +                       };
> +                       port@1 {
> +                               reg = <1>;
> +                               dp_port: endpoint {
> +                                       remote-endpoint = <&display_port>;
> +                               };
> +                       };
> +               }
> +       };
> +};
> +
> --
> 2.7.4
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
