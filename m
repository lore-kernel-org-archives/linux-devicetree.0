MIME-Version: 1.0
In-Reply-To: <1443627006-15319-2-git-send-email-p.zabel@pengutronix.de>
References: <1443627006-15319-1-git-send-email-p.zabel@pengutronix.de>
	<1443627006-15319-2-git-send-email-p.zabel@pengutronix.de>
Date: Wed, 30 Sep 2015 12:15:34 -0500
Message-ID: <CAL_Jsq+4S=vEjtw+=MffH8dgqsyu+bAoOthBO2zbcBCpmq0CMw@mail.gmail.com>
Subject: Re: [RFC v3 1/7] dt-bindings: drm/mediatek: Add Mediatek display
 subsystem dts binding
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Dave Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Cawa Cheng <cawa.cheng@mediatek.com>, CK Hu <ck.hu@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>, Paul Bolle <pebolle@tiscali.nl>, Daniel Stone <daniel@fooishbar.org>, Daniel Kurtz <djkurtz@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-mediatek@lists.infradead.org, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 30, 2015 at 10:30 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> From: CK Hu <ck.hu@mediatek.com>
>
> Add device tree binding documentation for the display subsystem in
> Mediatek MT8173 SoCs. The display function block nodes are grouped
> under a display-subsystem node.
>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2:
>  - Grouped DISP function block nodes under the display-subsystem node
>  - Added of-graph ports to binding documentation
>  - Added MIPI TX binding
>  - Added DPI binding
> ---
>  .../bindings/drm/mediatek/mediatek,disp.txt        | 133 +++++++++++++++++++++
>  .../bindings/drm/mediatek/mediatek,dpi.txt         |  41 +++++++
>  .../bindings/drm/mediatek/mediatek,dsi.txt         |  53 ++++++++
>  3 files changed, 227 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt
>  create mode 100644 Documentation/devicetree/bindings/drm/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
>
> diff --git a/Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt
> new file mode 100644
> index 0000000..c065f27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/mediatek/mediatek,disp.txt
> @@ -0,0 +1,133 @@
> +Mediatek display subsystem
> +==========================
> +
> +The Mediatek display subsystem consists of various DISP function blocks in the
> +MMSYS register space. The connections between them can be configured by output
> +and input selectors in the MMSYS_CONFIG register space and register updates can
> +be synchronized to video frame boundaries with help of a DISP_MUTEX function
> +block.
> +
> +The display-subsystem node groups together all individual device nodes that
> +comprise the DISP subsystem.
> +
> +Required properties:
> +
> +- compatible: "mediatek,<chip>-disp"
> +- power-domains: a phandle to MMSYS power domain node.
> +- mmsys-config: Should contain a phandle pointing to the MMSYS node.
> +- disp-mutex: Should contain a phandle pointing to the DISP_MUTEX node.
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
> +       "mediatek,<chip>-disp-wdma"  - write DMA
> +       "mediatek,<chip>-disp-color" - color processor
> +       "mediatek,<chip>-disp-aal"   - adaptive ambient light controller
> +       "mediatek,<chip>-disp-gamma" - gamma correction
> +       "mediatek,<chip>-disp-ufoe"  - data compression engine
> +       "mediatek,<chip>-dsi"        - DSI controller, see mediatek,dsi.txt
> +       "mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
> +       "mediatek,<chip>-disp-mutex" - display mutex
> +       "mediatek,<chip>-disp-od"    - overdrive
> +- reg: Physical base address and length of the function block register space
> +- interrupts: The interrupt signal from the function block.
> +- clocks: device clocks
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- compatible: "mediatek,<chip>-ddp"
> +
> +Required properties (DMA function blocks):
> +- compatible: Should be one of
> +       "mediatek,<chip>-disp-ovl"
> +       "mediatek,<chip>-disp-rdma"
> +- larb: Should contain a phandle pointing to the local arbiter device as defined
> +  in Documentation/devicetree/bindings/soc/mediatek/mediatek,smi-larb.txt
> +- iommus: required a iommu node
> +
> +Examples:
> +
> +display-subsystem@1400c000 {
> +       compatible = "mediatek,mt8173-disp", "simple-bus";
> +       power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +       mmsys-config = <&mmsys>;
> +       disp-mutex = <&mutex>;
> +
> +       ovl0@1400c000 {
> +               compatible = "mediatek,mt8173-disp-ovl";
> +               reg = <0 0x1400c000 0 0x1000>;
> +               interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +               iommus = <&iommu M4U_LARB0_ID M4U_PORT_DISP_OVL0>;
> +       };
> +
> +       rdma0@1400e000 {
> +               compatible = "mediatek,mt8173-disp-rdma";
> +               reg = <0 0x1400e000 0 0x1000>;
> +               interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +               iommus = <&iommu M4U_LARB0_ID M4U_PORT_DISP_RDMA0>;
> +       };
> +
> +       color0@14013000 {
> +               compatible = "mediatek,mt8173-disp-color";
> +               reg = <0 0x14013000 0 0x1000>;
> +               interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +       };
> +
> +       aal@14015000 {
> +               compatible = "mediatek,mt8173-disp-aal";
> +               reg = <0 0x14015000 0 0x1000>;
> +               interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&mmsys CLK_MM_DISP_AAL>;
> +       };
> +
> +       gamma@14016000 {
> +               compatible = "mediatek,mt8173-disp-gamma";
> +               reg = <0 0x14016000 0 0x1000>;
> +               interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&mmsys CLK_MM_DISP_GAMMA>;
> +       };
> +
> +       ufoe@1401a000 {
> +               compatible = "mediatek,mt8173-disp-ufoe";
> +               reg = <0 0x1401a000 0 0x1000>;
> +               interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&mmsys CLK_MM_DISP_UFOE>;
> +       };
> +
> +       dsi0@1401b000 {
> +               /* See mediatek,dsi.txt for details */
> +       };
> +
> +       dpi0@1401d000 {
> +               /* See mediatek,dpi.txt for details */
> +       };
> +
> +       od@14023000 {
> +               compatible = "mediatek,mt8173-disp-od";
> +               reg = <0 0x14023000 0 0x1000>;
> +               clocks = <&mmsys CLK_MM_DISP_OD>;
> +       };
> +};
> +
> +mutex: mutex@14020000 {
> +       compatible = "mediatek,mt8173-disp-mutex";
> +       reg = <0 0x14020000 0 0x1000>;
> +       interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +       power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> +};
> diff --git a/Documentation/devicetree/bindings/drm/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/drm/mediatek/mediatek,dpi.txt
> new file mode 100644
> index 0000000..2093aa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/mediatek/mediatek,dpi.txt
> @@ -0,0 +1,41 @@
> +Mediatek DPI Device
> +===================
> +
> +The Mediatek DPI function block is a sink of the display subsystem and
> +provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> +output bus.
> +
> +Required properties:
> +- compatible: "mediatek,<chip>-dpi"
> +- reg: Physical base address and length of the controller's registers
> +- interrupts: The interrupt signal from the function block.
> +- clocks: device clocks
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must contain "pixel", "engine", "pll", "sel", "div2", "div4",
> +              and "div8".
> +- port: Output port node with endpoint definitions as described in
> +  Documentation/devicetree/bindings/graph.txt. This port should be connected
> +  to the input port of an attached HDMI or LVDS encoder chip.
> +
> +Example:
> +
> +dpi0: dpi@1401d000 {
> +       compatible = "mediatek,mt8173-dpi";
> +       reg = <0 0x1401d000 0 0x1000>;
> +       interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys CLK_MM_DPI_PIXEL>,
> +                <&mmsys CLK_MM_DPI_ENGINE>,
> +                <&apmixedsys CLK_APMIXED_TVDPLL>,
> +                <&topckgen CLK_TOP_DPI0_SEL>,
> +                <&topckgen CLK_TOP_TVDPLL_D2>,
> +                <&topckgen CLK_TOP_TVDPLL_D4>,
> +                <&topckgen CLK_TOP_TVDPLL_D8>;
> +       clock-names = "pixel", "engine", "pll",
> +                     "sel", "div2", "div4", "div8";
> +
> +       port {
> +               dpi0_out: endpoint {
> +                       remote-endpoint = <&hdmi0_in>;
> +               };
> +       };
> +};
> diff --git a/Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
> new file mode 100644
> index 0000000..afa7afb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/mediatek/mediatek,dsi.txt
> @@ -0,0 +1,53 @@
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
> +- interrupts: The interrupt signal from the function block.
> +- clocks: device clocks
> +  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> +- clock-names: must contain "engine" and "digital".
> +- phys: phandle link to the MIPI D-PHY controller.
> +- phy-names: must contain "dphy"
> +- port: Output port node with endpoint definitions as described in
> +  Documentation/devicetree/bindings/graph.txt. This port should be connected
> +  to the input port of an attached DSI panel or DSI-to-eDP encoder chip.
> +
> +MIPI TX Configuration Module
> +============================
> +
> +The MIPI TX configuration module controls the MIPI D-PHY.
> +
> +Required properties:
> +- compatible: "mediatek,<chip>-mipi-tx"
> +- reg: Physical base address and length of the controller's registers
> +- #phy-cells: must be <0>.
> +
> +Example:
> +
> +mipi_tx0: mipi-dphy@10215000 {
> +       compatible = "mediatek,mt8173-mipi-tx";
> +       reg = <0 0x10215000 0 0x1000>;
> +       #phy-cells = <0>;
> +};
> +
> +dsi0: dsi@1401b000 {
> +       compatible = "mediatek,mt8173-dsi";
> +       reg = <0 0x1401b000 0 0x1000>;
> +       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_LOW>;
> +       clocks = <&mmsys MM_DSI0_ENGINE>, <&mmsys MM_DSI0_DIGITAL>;
> +       clock-names = "engine", "digital";
> +       phys = <&mipi_tx0>;
> +       phy-names = "dphy";
> +
> +       port {
> +               dsi0_out: endpoint {
> +                       remote-endpoint = <&panel_in>;
> +               };
> +       };
> +};
> --
> 2.5.3
>
