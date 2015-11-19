From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 00/12] Add mipi dsi support for rk3288
Date: Thu, 19 Nov 2015 14:41:41 +0000
Message-ID: <CACvgo53YOMpbz1TdVmRBPPz4dv=X+8FoEo0ZcfN5DwbDYi2ZzQ@mail.gmail.com>
References: <1447904131-29328-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1447904131-29328-1-git-send-email-zyw@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-rockchip <linux-rockchip@lists.infradead.org>, Mark Yao <mark.yao@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Kever Yang <kever.yang@rock-chips.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Jeff Chen <cym@rock-chips.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Alexandru M Stan <amstan@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>Russell King <linux>
List-Id: devicetree@vger.kernel.org

On 19 November 2015 at 03:35, Chris Zhong <zyw@rock-chips.com> wrote:
> The rk3288 MIPI DSI is a Synopsys DesignWare MIPI DSI host controller
> IP. This series adds support for a Synopsys DesignWare MIPI DSI host
> controller DRM bridge driver and a rockchip MIPI DSI specific DRM
> driver.
>
> This series also includes a DRM panel driver for BOE TV080WUM-NL0 panel.
> This panel only use the MIPI DSI video mode.
>
> The MIPI DSI feature is tested on rk3288 evb board, backport them to
> chrome os kernel v3.14, and it can display normally.
>
> This patchset is base on the patchset from Ying.liu@freescale.com.
> <http://www.spinics.net/lists/dri-devel/msg77181.html>
>
>
> Changes in v3:
> move the dw_mipi_dsi.txt to Documentation/devicetree/bindings/display/bridge
> move dw_mipi_dsi_rockchip.txt to bindings/display/rockchip/
> move boe,tv080wum-nl0.txt to bindings/display/panel/
>
> Changes in v2:
> add the mipi clk id in a single patch
> As Thierry.Reding comment, add a documentation for this panel.
>
> Chris Zhong (10):
>   clk: rockchip: add id for mipidsi sclk on rk3288
>   clk: rockchip: add mipidsi clocks on rk3288
>   drm/rockchip: return a true clock rate to adjusted_mode
>   drm/bridge: Add Synopsys DesignWare MIPI DSI host controller driver
Did you actually rewrite the patch from Liu Ying ?
Out of curiosity what was the obstacle of this work getting merged ?

>   drm: rockchip: Support Synopsys DesignWare MIPI DSI host controller
>   Documentation: dt-bindings: Add bindings for rk3288 DW MIPI DSI driver
>   ARM: dts: rockchip: add rk3288 mipi_dsi nodes
>   drm/panel: simple: Add support for BOE TV080WUM-NL0
>   drm/panel: simple: Add boe,tv080wum-nl0 simple panel device tree
>     binding
As the DT people will tell you - there is no BOE vendor in
bindings/vendor-prefixes.txt.

>   ARM: dts: rockchip: add support mipi panel tv080wum-nl0 for rk3288-evb
>
> Liu Ying (2):
>   drm/dsi: Add a helper to get bits per pixel of MIPI DSI pixel format
>   Documentation: dt-bindings: Add bindings for Synopsys DW MIPI DSI DRM
>     bridge driver
>
>From the above 12 patches only ~6 reached this mailing list is that
intentional ? Previously I've seen people CC dri-devel for their
panel/bridge DT patches.

Regards,
Emil
