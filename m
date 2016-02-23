From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 01/11] drm/hisilicon: Add device tree binding for
 hi6220 display subsystem
Date: Tue, 23 Feb 2016 18:37:27 +0000
Message-ID: <20160223183726.GA10246@leverpostej>
References: <1456196431-19923-1-git-send-email-xinliang.liu@linaro.org>
 <1456196431-19923-2-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456196431-19923-2-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Xinliang Liu <xinliang.liu@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, robh@kernel.org, daniel@fooishbar.org, architt@codeaurora.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, emil.l.velikov@gmail.com, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, andy.green@linaro.org, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, zourongrong@huawei.com, lijianhua@huawei.com, sumit.semwal@linaro.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 11:00:21AM +0800, Xinliang Liu wrote:
> Add ADE display controller binding doc.
> Add DesignWare DSI Host Controller v1.20a binding doc.
> 
> v5:
> - Remove endpoint unit address of dsi output port.
> - Add "hisilicon,noc-syscon" property for ADE NOC QoS syscon.
> - Add "resets" property for ADE reset.
> v4:
> - Describe more specific of clocks and ports.
> - Fix indentation.
> v3:
> - Make ade as the drm master node.
> - Use assigned-clocks to set clock rate.
> - Use ports to connect display relavant nodes.
> v2:
> - Move dt binding docs to bindings/display/hisilicon directory.
> 
> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> ---
>  .../bindings/display/hisilicon/dw-dsi.txt          | 72 ++++++++++++++++++++++
>  .../bindings/display/hisilicon/hisi-ade.txt        | 64 +++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/hisilicon/hisi-ade.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt b/Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt
> new file mode 100644
> index 000000000000..0d234b5e19af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt
> @@ -0,0 +1,72 @@
> +Device-Tree bindings for DesignWare DSI Host Controller v1.20a driver
> +
> +A DSI Host Controller resides in the middle of display controller and external
> +HDMI converter or panel.
> +
> +Required properties:
> +- compatible: value should be "hisilicon,hi6220-dsi".
> +- reg: physical base address and length of dsi controller's registers.
> +- clocks: the clocks needed.
> +- clock-names: the name of the clocks.

You _must_ specify the precise set of clock names you expect here.

Per the example, you seem to expect "pclk_dsi".

Is that the name given in the DSI controller manual? Or is it just
"pclk"? It's already specific to the DSI controller...

> diff --git a/Documentation/devicetree/bindings/display/hisilicon/hisi-ade.txt b/Documentation/devicetree/bindings/display/hisilicon/hisi-ade.txt
> new file mode 100644
> index 000000000000..c1844b3ff878
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/hisilicon/hisi-ade.txt
> @@ -0,0 +1,64 @@
> +Device-Tree bindings for hisilicon ADE display controller driver
> +
> +ADE (Advanced Display Engine) is the display controller which grab image
> +data from memory, do composition, do post image processing, generate RGB
> +timing stream and transfer to DSI.
> +
> +Required properties:
> +- compatible: value should be "hisilicon,hi6220-ade".
> +- reg: physical base address and length of the ADE controller's registers.
> +  Value should be "<0x0 0xf4100000 0x0 0x7800>".

Get rid of the "Value should be ... " part. It is nonsensical to
describe this in the binding. Just describe what this is with relation
to _this_ IP block.

> +- reg-names: name of physical base. Value should be "ade_base".

That obviously doesn't apply to *-names propertiesm which must all be
specified in the binding (they're local to the device rather than
remote).

> +- hisilicon,noc-syscon: ADE NOC QoS syscon. Value should be "<&medianoc_ade>"
> +- resets: The ADE reset controller node. Value should be "<&media_ctrl
> +  MEDIA_ADE>".

Likewise.

> +- interrupt: the ldi vblank interrupt number used.
> +- clocks: the clocks needed. Three clocks are used in ADE driver:
> +  ADE core clock, value should be "<&media_ctrl HI6220_ADE_CORE>";
> +  ADE pixel clok, value should be "<&media_ctrl HI6220_ADE_PIX_SRC>";
> +  media NOC QoS clock, value should be "<&media_ctrl HI6220_CODEC_JPEG>".
> +- clock-names: the name of the clocks. Values should be "clk_ade_core",
> +  "clk_codec_jpeg" and "clk_ade_pix".

Likewise, don't specify the value.

Jsut define clocks in terms of clock-names, e.g.

- clocks: a list of phandle + clock-specifier pairs, one for each entry
  in clock-names.
- clock-names: should contain:
  * "clk_ade_core" for the ADE ciore clock
  * ...
  * ...

> +- assigned-clocks: clocks to be assigned rate.
> +- assigned-clock-rates: clock rates which are assigned to assigned-clocks.
> +  The rate of <&media_ctrl HI6220_ADE_CORE> could be "360000000" or
> +  "180000000";
> +  The rate of <&media_ctrl HI6220_CODEC_JPEG> could be less than "1440000000".

Is this strictly necessary? Why can the druiver not configure this?

Does this have to match some pre-existing boot-time configuration?

Thanks,
Mark.
