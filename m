From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: display: amlogic, meson-dw-hdmi: Add
 optional HDMI 5V regulator
Date: Mon, 23 Oct 2017 17:46:25 -0500
Message-ID: <20171023224625.oiswnpgmxzhg7aep@rob-hp-laptop>
References: <1508227664-11171-1-git-send-email-narmstrong@baylibre.com>
 <1508227664-11171-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508227664-11171-3-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 10:07:42AM +0200, Neil Armstrong wrote:
> On reference boards and derivatives, the HDMI Logic is powered by an external
> 5V regulator.
> This regulator was set by the Vendor U-Boot, add optional support for it.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> index 7f040ed..bf4a180 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
> @@ -48,6 +48,10 @@ Required properties:
>    Documentation/devicetree/bindings/reset/reset.txt,
>    the reset-names should be "hdmitx_apb", "hdmitx", "hdmitx_phy"
>  
> +Optional properties:
> +- hdmi-supply: Optional phandle to an external 5V regulator to power the HDMI
> +  logic, as described in the file ../regulator/regulator.txt

5V into a modern SoC sounds strange. Is this really for the chip or for 
5V to the connector? The latter should be in the connector node.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
