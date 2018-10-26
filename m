From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 5/6] dt-bindings: drm/panel: simple: Innolux TV123WAM
 is actually P120ZDG-BF1
Date: Fri, 26 Oct 2018 10:43:56 -0400
Message-ID: <20181026144356.GS154160@art_vandelay>
References: <20181025222134.174583-1-dianders@chromium.org>
 <20181025222134.174583-5-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025222134.174583-5-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Sandeep Panda <spanda@codeaurora.org>, linux-arm-msm@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jsanka@codeaurora.org, ryandcase@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 03:21:33PM -0700, Douglas Anderson wrote:
> As far as I can tell the bindings that were added in commit
> 9c04400f7ea6 ("dt-bindings: drm/panel: Document Innolux TV123WAM panel
> bindings") weren't actually for Innolux TV123WAM but were actually for
> Innolux P120ZDG-BF1.
> 
> As far as I can tell the Innolux TV123WAM isn't a real panel and but
> it's a mosh between the TI TV123WAM and the Innolux P120ZDG-BF1.
> Let's unmosh.
> 
> Here's my evidence:
> 
> * Searching for TV123WAM on the Internet turns up a TI panel.  While
>   it's possible that an Innolux panel has the same model number as the
>   TI Panel, it seems a little doubtful.  Looking up the datasheet from
>   the TI Panel shows that it's 1920 x 1280 and 259.2 mm x 172.8 mm.
> 
> * As far as I know, the patch adding the Innolux Panel was supposed to
>   be for the board that's sitting in front of me as I type this
>   (support for that board is not yet upstream).  On the back of that
>   panel I see Innolux P120ZDZ-EZ1 rev B1.
> 
> * Someone pointed me at a datasheet that's supposed to be for the
>   panel in front of me (sorry, I can't share the datasheet).  That
>   datasheet has the string "p120zdg-bf1"
> 
> * If I search for "P120ZDG-BF1" on the Internet I get hits for panels
>   that are 2160x1440.  They don't have datasheets, but the fact that
>   the resolution matches is a good sign.
> 
> While we doing the rename, also mention that no-hpd can be used with
> this panel.  See the previous patch in this series ("drm/panel:
> simple: Add "no-hpd" delay for Innolux TV123WAM").
> 
> Fixes: 9c04400f7ea6 ("dt-bindings: drm/panel: Document Innolux TV123WAM panel bindings")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

I didn't see your v2 when I replied to the v1 patch, so for the record,

Reviewed-by: Sean Paul <sean@poorly.run>

Also note to whoever applies this to -misc, v1 also had

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>


Sean

> Cc: Sandeep Panda <spanda@codeaurora.org>
> ---
> 
> Changes in v2: None
> 
>  .../{innolux,tv123wam.txt => innolux,p120zdg-bf1.txt}     | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/display/panel/{innolux,tv123wam.txt => innolux,p120zdg-bf1.txt} (70%)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,tv123wam.txt b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> similarity index 70%
> rename from Documentation/devicetree/bindings/display/panel/innolux,tv123wam.txt
> rename to Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> index a9b35265fa13..513f03466aba 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,tv123wam.txt
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> @@ -1,20 +1,22 @@
> -Innolux TV123WAM 12.3 inch eDP 2K display panel
> +Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
>  
>  This binding is compatible with the simple-panel binding, which is specified
>  in simple-panel.txt in this directory.
>  
>  Required properties:
> -- compatible: should be "innolux,tv123wam"
> +- compatible: should be "innolux,p120zdg-bf1"
>  - power-supply: regulator to provide the supply voltage
>  
>  Optional properties:
>  - enable-gpios: GPIO pin to enable or disable the panel
>  - backlight: phandle of the backlight device attached to the panel
> +- no-hpd: If HPD isn't hooked up; add this property.
>  
>  Example:
>  	panel_edp: panel-edp {
> -		compatible = "innolux,tv123wam";
> +		compatible = "innolux,p120zdg-bf1";
>  		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
>  		power-supply = <&pm8916_l2>;
>  		backlight = <&backlight>;
> +		no-hpd;
>  	};
> -- 
> 2.19.1.568.g152ad8e336-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
