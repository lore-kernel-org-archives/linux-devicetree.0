From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 22/22] phy: Add support for Qualcomm's USB HS phy
Date: Sun, 17 Jul 2016 21:28:16 -0500
Message-ID: <20160718022816.GA16357@rob-hp-laptop>
References: <20160707222114.1673-1-stephen.boyd@linaro.org>
 <20160707222114.1673-23-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160707222114.1673-23-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 07, 2016 at 03:21:13PM -0700, Stephen Boyd wrote:
> The high-speed phy on qcom SoCs is controlled via the ULPI
> viewport.
> 
> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/qcom,usb-hs-phy.txt    |  83 ++++++
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-qcom-usb-hs.c                      | 295 +++++++++++++++++++++
>  4 files changed, 387 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
>  create mode 100644 drivers/phy/phy-qcom-usb-hs.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
> new file mode 100644
> index 000000000000..a7bda9186d5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
> @@ -0,0 +1,83 @@
> +Qualcomm's USB HS PHY
> +
> +PROPERTIES
> +
> +- compatible:
> +    Usage: required
> +    Value type: <string>
> +    Definition: Should contain "qcom,usb-hs-phy"

Add a chip specific compatible.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
