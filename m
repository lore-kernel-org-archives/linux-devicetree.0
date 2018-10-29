From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 1/6] dt-bindings: drm/panel: simple: Add no-hpd
 property
Date: Mon, 29 Oct 2018 12:16:51 -0400
Message-ID: <20181029161651.GW154160@art_vandelay>
References: <20181025222134.174583-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025222134.174583-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Sandeep Panda <spanda@codeaurora.org>, linux-arm-msm@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jsanka@codeaurora.org, ryandcase@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 03:21:29PM -0700, Douglas Anderson wrote:
> Some eDP panels that are designed to be always connected to a board
> use their HPD signal to signal that they've finished powering on and
> they're ready to be talked to.
> 
> However, for various reasons it's possible that the HPD signal from
> the panel isn't actually hooked up.  In the case where the HPD isn't
> hooked up you can look at the timing diagram on the panel datasheet
> and insert a delay for the maximum amount of time that the HPD might
> take to come up.
> 
> Let's add a property in the device tree for this concept.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for the series, Doug, I've applied it all to drm-misc-next-fixes for
4.20.

Sean

> Reviewed-by: Sean Paul <sean@poorly.run>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/display/panel/simple-panel.txt         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> index 45a457ad38f0..b2b872c710f2 100644
> --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> @@ -11,6 +11,9 @@ Optional properties:
>  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
>  - enable-gpios: GPIO pin to enable or disable the panel
>  - backlight: phandle of the backlight device attached to the panel
> +- no-hpd: This panel is supposed to communicate that it's ready via HPD
> +  (hot plug detect) signal, but the signal isn't hooked up so we should
> +  hardcode the max delay from the panel spec when powering up the panel.
>  
>  Example:
>  
> -- 
> 2.19.1.568.g152ad8e336-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
