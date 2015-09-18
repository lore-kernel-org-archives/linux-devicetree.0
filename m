From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 1/4] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
Date: Fri, 18 Sep 2015 15:33:30 -0500
Message-ID: <CAL_JsqLZQXMoKxGZ6c56e6d1UuLiJKzVB=sH15ihTvwpOgSU8Q@mail.gmail.com>
References: <1442592722-29004-1-git-send-email-p.zabel@pengutronix.de> <1442592722-29004-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442592722-29004-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 18, 2015 at 11:11 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Add device tree binding documentation for the display subsystem in
> Mediatek MT8173 SoCs.
>
> Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../bindings/drm/mediatek/mediatek,disp.txt        | 131 +++++++++++++++++++++
>  .../bindings/drm/mediatek/mediatek,dsi.txt         |  29 +++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt
>  create mode 100644 Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
>
> diff --git a/Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt
> new file mode 100644
> index 0000000..a3811bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt
> @@ -0,0 +1,131 @@
> +Mediatek display subsystem
> +==========================
> +
> +The Mediatek display subsystem consists of various DISP function blocks in the
> +MMSYS register space. The connections between them can be configured by output
> +and input selectors in the MMSYS_CONFIG register space and register updates can
> +be synchronized to video frame boundaries with help of a DISP_MUTEX function
> +block.
> +
> +The display-subsystem node binds together all individual device nodes that
> +comprise the DISP subsystem.
> +
> +Required properties:
> +
> +- compatible: "mediatek,<chip>-disp"

> +- components: Should contain a list of phandles pointing to the DISP function
> +  block device nodes.
> +- component-names: Should contain the name of the function block pointed to
> +  by the components phandle of the same index.

NAK. Group these nodes under a parent node, use of-graph or just don't
put this into DT. Don't invent a new way.


> +- mmsys-config: Should contain a phandle pointing to the MMSYS node.
> +- disp-mutex: Should contain a phandle pointing to the DISP_MUTEX node.
> +
> +Example:
> +
> +display-subsystem {
> +       compatible = "mediatek,mt8173-disp";
> +       components = <&ovl0>, <&rdma0>, <&color0>, <&aal>,
> +                    <&ufoe>, <&dsi0>, <&od>;
> +       component-names = "ovl0", "rdma0", "color0", "aal",
> +                         "ufoe", "dsi0", "od";
> +       mmsys-config = <&mmsys>;
> +       disp-mutex = <&mutex>;
> +};
> +
> +DISP function blocks
> +====================
> +
> +A display stream starts at a source function block that reads pixel data from
> +memory and ends with a sink function block that drives pixels on a display
> +interface, or writes pixels back to memory. All DISP function blocks have
> +their own register space, interrupt, and clock gate. The blocks that can
> +access memory additionally have to list the IOMMU and local arbiter they are
> +connected to.
> +
> +For a description of the display interface sink function blocks, see
> +Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
> +
> +Required properties (all function blocks):
> +- compatible: "mediatek,<chip>-disp-<function>", one of
> +       "mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
> +       "mediatek,<chip>-disp-rdma"  - read DMA / line buffer
> +       "mediatek,<chip>-disp-color" - color processor
> +       "mediatek,<chip>-disp-aal"   - adaptive ambient light controller
> +       "mediatek,<chip>-disp-gamma" - gamma correction
> +       "mediatek,<chip>-disp-ufoe"  - data compression engine
> +       "mediatek,<chip>-disp-mutex" - display mutex
> +       "mediatek,<chip>-disp-od"    - overdrive
> +- reg: Physical base address and length of the function block register space
> +- interrupts: The interrupt signal from the function block.
> +- clocks: device clocks
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- compatible: "mediatek,<chip>-ddp"
> +- power-domains: a phandle to DDP power domain node.
> +
> +Required properties (DMA function blocks):
> +- compatible: Should be one of
> +       "mediatek,<chip>-disp-ovl"
> +       "mediatek,<chip>-disp-rdma"
> +- larb: Should a phandles pointing to the local arbiter device as defined in
> +  Documentation/devicetree/bindings/soc/mediatek/mediatek,smi-larb.txt
> +- iommus: required a iommu node
> +
> +Examples:
> +
> +ovl0: ovl@1400c000 {
> +       compatible = "mediatek,mt8173-disp-ovl";
> +       reg = <0 0x1400c000 0 0x1000>;
> +       interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +       iommus = <&iommu M4U_LARB0_ID M4U_PORT_DISP_OVL0>;
> +};
> +
> +rdma0: rdma@1400e000 {
> +       compatible = "mediatek,mt8173-disp-rdma";
> +       reg = <0 0x1400e000 0 0x1000>;
> +       interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +       iommus = <&iommu M4U_LARB0_ID M4U_PORT_DISP_RDMA0>;
> +};
> +
> +color0: color@14013000 {
> +       compatible = "mediatek,mt8173-disp-color";
> +       reg = <0 0x14013000 0 0x1000>;
> +       interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +};
> +
> +aal: aal@14015000 {
> +       compatible = "mediatek,mt8173-disp-aal";
> +       reg = <0 0x14015000 0 0x1000>;
> +       interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DISP_AAL>;
> +};
> +
> +gamma: gamma@14016000 {
> +       compatible = "mediatek,mt8173-disp-gamma";
> +       reg = <0 0x14016000 0 0x1000>;
> +       interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DISP_GAMMA>;
> +};
> +
> +ufoe: ufoe@1401a000 {
> +       compatible = "mediatek,mt8173-disp-ufoe";
> +       reg = <0 0x1401a000 0 0x1000>;
> +       interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DISP_UFOE>;
> +};
> +
> +mutex: mutex@14020000 {
> +       compatible = "mediatek,mt8173-disp-mutex";
> +       reg = <0 0x14020000 0 0x1000>;
> +       interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
> +       power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +       clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +};
> +
> +od: od@14023000 {
> +       compatible = "mediatek,mt8173-disp-od";
> +       reg = <0 0x14023000 0 0x1000>;
> +       clocks = <&mmsys CLK_MM_DISP_OD>;
> +};
> diff --git a/Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
> new file mode 100644
> index 0000000..e892ef1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
> @@ -0,0 +1,29 @@
> +Mediatek DSI Device
> +===================
> +
> +The Mediatek DSI function block is a sink of the display subsystem and can
> +drive up to 4-lane MIPI DSI output. Two DSIs can be synchronized for dual-
> +channel output.
> +
> +Required properties:
> +- compatible: "mediatek,<chip>-dsi"
> +- reg: Physical base address and length of the controller's registers
> +- clocks: device clocks
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must contain "engine" and "digital".

This leaves wondering which one is used for DSI bit clock.

> +
> +Example:
> +
> +dsi0: dsi@1401b000 {
> +       compatible = "mediatek,mt8173-dsi";
> +       reg = <0 0x1401b000 0 0x1000>,  /* DSI0 */
> +             <0 0x10215000 0 0x1000>;  /* MIPI_TX0 */
> +       clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>;
> +       clock-names = "engine", "digital";
> +
> +       port {

Missing from the binding description.

> +               dsi0_out: endpoint {
> +                       remote-endpoint = <&panel_in>;
> +               };
> +       };
> +};
> --
> 2.5.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
