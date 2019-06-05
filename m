From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 1/5] dt-bindings: drm/bridge/synopsys: dw-hdmi: Add
 "unwedge" for ddc bus
Date: Wed, 5 Jun 2019 16:21:01 -0400
Message-ID: <20190605202101.GG17077@art_vandelay>
References: <20190502225336.206885-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502225336.206885-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, mka@chromium.org, Sean Paul <seanpaul@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On Thu, May 02, 2019 at 03:53:32PM -0700, Douglas Anderson wrote:
> In certain situations it was seen that we could wedge up the DDC bus
> on the HDMI adapter on rk3288.  The only way to unwedge was to mux one
> of the pins over to GPIO output-driven-low temporarily and then
> quickly mux back.  Full details can be found in the patch
> ("drm/bridge/synopsys: dw-hdmi: Add "unwedge" for ddc bus").
> 
> Since unwedge requires remuxing the pins, we first need to add to the
> bindings so that we can specify what state the pins should be in for
> unwedging.

Pushed to drm-misc-next along with patch 2. I'll let Heiko land the dts patches.

Thanks!

Sean

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  .../bindings/display/rockchip/dw_hdmi-rockchip.txt         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> index 39143424a474..8346bac81f1c 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> +++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> @@ -38,6 +38,13 @@ Optional properties
>  - phys: from general PHY binding: the phandle for the PHY device.
>  - phy-names: Should be "hdmi" if phys references an external phy.
>  
> +Optional pinctrl entry:
> +- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> +  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> +  i2c timeout.  It's intended that this unwedge pinctrl entry will
> +  cause the SDA line to be driven low to work around a hardware
> +  errata.
> +
>  Example:
>  
>  hdmi: hdmi@ff980000 {
> -- 
> 2.21.0.1020.gf2820cf01a-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
