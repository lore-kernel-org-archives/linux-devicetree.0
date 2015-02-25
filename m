From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] usb: dwc3: dwc3-st: Update the DT example.
Date: Wed, 25 Feb 2015 08:34:14 -0600
Message-ID: <CAL_JsqKD1xorXX_2v=Lv4mNg7roAd6+jBKrFRQefV3eVhrQKTg@mail.gmail.com>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org> <1424871377-1795-6-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424871377-1795-6-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 25, 2015 at 7:36 AM, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> There is a subtle type phys-names should be phy-names. Using the
> current example means you don't have working usb. Also update
> the example to use the generic phy type constants which are now
> used for miphy28.
>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/usb/dwc3-st.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-st.txt b/Documentation/devicetree/bindings/usb/dwc3-st.txt
> index f9d7025..6634064 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-st.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3-st.txt
> @@ -62,7 +62,7 @@ st_dwc3: dwc3@8f94000 {
>                 reg             = <0x09900000 0x100000>;
>                 interrupts      = <GIC_SPI 155 IRQ_TYPE_NONE>;
>                 dr_mode         = "host";
> -               phys-names      = "usb2-phy", "usb3-phy";
> -               phys            = <&usb2_picophy2>, <&phy_port2 MIPHY_TYPE_USB>;
> +               phy-names       = "usb2-phy", "usb3-phy";
> +               phys            = <&usb2_picophy2>, <&phy_port2 PHY_TYPE_USB3>;
>         };
>  };
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
