From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] drm/msm/hdmi: Clean up HDMI gpio DT bindings
Date: Mon, 12 Sep 2016 08:19:14 -0500
Message-ID: <20160912131914.GA15499@rob-hp-laptop>
References: <1467957354-7620-1-git-send-email-architt@codeaurora.org>
 <1472737015-29382-1-git-send-email-architt@codeaurora.org>
 <1472737015-29382-3-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472737015-29382-3-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 07:06:52PM +0530, Archit Taneja wrote:
> Make the following changes in the HDMI gpio bindings:
> 
> - Use "-gpios" as the suffix for all the gpio names
> - Move all the gpios to optional, since there are platforms that use none
>   of them.
> - The HPD gpio is a standard one, remove the "qcom,hdmi-tx-" prefix from
>   it.
> - Add a missing lpm gpio used on some platforms.
> 
> Make the necessary changes in the driver to incorporate these changes.
> 
> There hasn't been any upstream DT that uses the HDMI bindings, so it's
> okay to change and move around these properties.
> 
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> v2:
> - Keep "qcom,hdmi-tx-" suffix for all gpios except for hpd.
> - Use "-gpios" suffix instead of "-gpio".
> - Move all the gpios to optional properties.
> 
>  .../devicetree/bindings/display/msm/hdmi.txt        | 11 ++++++-----
>  drivers/gpu/drm/msm/hdmi/hdmi.c                     | 21 +++++++++++++++++++--
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
> index ce84459..f1a83ab 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.txt
> @@ -13,17 +13,18 @@ Required properties:
>  - interrupts: The interrupt signal from the hdmi block.
>  - clocks: device clocks
>    See ../clocks/clock-bindings.txt for details.
> -- qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
> -- qcom,hdmi-tx-ddc-data-gpio: ddc data pin
> -- qcom,hdmi-tx-hpd-gpio: hpd pin
>  - core-vdda-supply: phandle to supply regulator
>  - hdmi-mux-supply: phandle to mux regulator
>  - phys: the phandle for the HDMI PHY device
>  - phy-names: the name of the corresponding PHY device
>  
>  Optional properties:
> -- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
> -- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
> +- qcom,hdmi-tx-ddc-clk-gpios: ddc clk pin
> +- qcom,hdmi-tx-ddc-data-gpios: ddc data pin

Sorry, for raising another point, but couldn't you use the i2c-gpio 
binding for these instead?

> +- hpd-gpios: hpd pin
> +- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
> +- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
> +- qcom,hdmi-tx-mux-lpm-gpios: hdmi mux lpm pin
>  - power-domains: reference to the power domain(s), if available.
>  - pinctrl-names: the pin control state names; should contain "default"
>  - pinctrl-0: the default pinctrl state (active)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
