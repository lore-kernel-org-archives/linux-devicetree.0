From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] panel/panasonic-vvx10f034n00: Add DT bindings
Date: Mon, 2 Nov 2015 09:59:11 -0600
Message-ID: <CAL_Jsq+AieY2UrjwvPeZTjxQOG7Y-8M+-ohmKBVeDO5hN7MnQQ@mail.gmail.com>
References: <1446251908-2603-1-git-send-email-bjorn@kryo.se> <1446251908-2603-2-git-send-email-bjorn@kryo.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446251908-2603-2-git-send-email-bjorn-UYDU3/A3LUY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 7:38 PM,  <bjorn-UYDU3/A3LUY@public.gmane.org> wrote:
> From: Werner Johansson <werner.johansson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>
> This patch adds bindings for the Panasonic VVX10F034N00
> WUXGA panel.
>
> Signed-off-by: Werner Johansson <werner.johansson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../bindings/panel/panasonic,vvx10f034n00.txt        | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/panasonic,vvx10f034n00.txt
>
> diff --git a/Documentation/devicetree/bindings/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/panel/panasonic,vvx10f034n00.txt
> new file mode 100644
> index 0000000..37dedf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panasonic,vvx10f034n00.txt
> @@ -0,0 +1,20 @@
> +Panasonic 10" WUXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "panasonic,vvx10f034n00"
> +- reg: DSI virtual channel of the peripheral
> +- power-supply: phandle of the regulator that provides the supply voltage
> +
> +Optional properties:
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +       mdss_dsi@fd922800 {
> +               panel@0 {
> +                       compatible = "panasonic,vvx10f034n00";
> +                       reg = <0>;
> +                       power-supply = <&vreg_vsp>;
> +                       backlight = <&lp8566_wled>;
> +               };
> +       };
> --
> 2.3.2 (Apple Git-55)
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
