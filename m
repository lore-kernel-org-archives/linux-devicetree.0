From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] pinctrl/lantiq: update devicetree bindings
 Documentation
Date: Fri, 20 Nov 2015 08:26:40 -0600
Message-ID: <20151120142640.GA3348@rob-hp-laptop>
References: <1447995151-3857-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447995151-3857-1-git-send-email-mschiller-h82pf8jx2gI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Schiller <mschiller-h82pf8jx2gI@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 05:52:28AM +0100, Martin Schiller wrote:
> This patch adds the new dedicated "lantiq,pinctrl-<chip>" compatible strings
> to the devicetree bindings Documentation, where <chip> is one of "ase",
> "danube", "xrx100", "xrx200" or "xrx300" and marks the "lantiq,pinctrl-xway"
> and "lantiq,pinctrl-xr9" compatible strings as DEPRECATED.

This could use a better subject. Every change to bindings are "updating 
binding description."

> 
> Signed-off-by: Martin Schiller <mschiller-h82pf8jx2gI@public.gmane.org>
> ---
>  .../bindings/pinctrl/lantiq,pinctrl-xway.txt       | 108 +++++++++++++++++++--
>  1 file changed, 100 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
> index e89b467..16daa12 100644
> --- a/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
> @@ -1,7 +1,14 @@
>  Lantiq XWAY pinmux controller
>  
>  Required properties:
> -- compatible: "lantiq,pinctrl-xway" or "lantiq,pinctrl-xr9"
> +- compatible: "lantiq,pinctrl-xway", (DEPRECATED: Use XWAY DANUBE Family)
> +	      "lantiq,pinctrl-xr9", (DEPRECATED: Use XWAY xRX100/xRX200 Family)
> +	      "lantiq,pinctrl-<chip>", where <chip> is:

<chip> first is preferred: lantiq,<chip>-pinctrl

> +		"ase" (XWAY AMAZON Family)
> +		"danube" (XWAY DANUBE Family)
> +		"xrx100" (XWAY xRX100 Family)
> +		"xrx200" (XWAY xRX200 Family)
> +		"xrx300" (XWAY xRX300 Family)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
