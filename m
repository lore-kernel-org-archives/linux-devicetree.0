From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] drm: convert drivers to use drm_of_find_panel_or_bridge
Date: Sat, 4 Feb 2017 18:26:09 -0200
Message-ID: <CAOMZO5Cb5Ye4uWtnV=rtaYAJGAS3C0bZAkVAab37PkSdyK=2fw@mail.gmail.com>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Sat, Feb 4, 2017 at 1:36 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c b/drivers/gpu/drm/mxsfb/mxsfb_out.c
> index fa8d17399407..f7d729aa09bd 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_out.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -82,20 +83,15 @@ static const struct drm_connector_funcs mxsfb_panel_connector_funcs = {
>         .atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
>  };
>
> -static int mxsfb_attach_endpoint(struct drm_device *drm,
> -                                const struct of_endpoint *ep)
> +int mxsfb_create_output(struct drm_device *drm)
>  {
>         struct mxsfb_drm_private *mxsfb = drm->dev_private;
> -       struct device_node *np;
>         struct drm_panel *panel;
> -       int ret = -EPROBE_DEFER;
> -
> -       np = of_graph_get_remote_port_parent(ep->local_node);
> -       panel = of_drm_find_panel(np);
> -       of_node_put(np);
> +       int ret;
>
> -       if (!panel)
> -               return -EPROBE_DEFER;
> +       ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel, NULL);
> +       if (ret)
> +               return ret;

I fixed some build issues of this series and I am trying to use it
with the mxsfb drm driver.

I would like to add bridge support for this driver, so that I can use
the TDA19988 HDMI bridge on a imx6sx-udoo-neo-full board.

My dts looks like this:

--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -185,6 +185,41 @@
        };
 };

+&i2c3 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_i2c3>;
+       clock-frequency = <100000>;
+       status = "okay";
+
+       hdmi-transmitter@70 {
+               compatible = "nxp,tda998x";
+               reg = <0x70>;
+               pinctrl-0 = <&pinctrl_hdmi>;
+               pinctrl-names = "default";
+               interrupt-parent = <&gpio3>;
+               interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+               clocks = <&clks IMX6SX_CLK_CKO2>;
+
+               port {
+                       tda998x_input: endpoint {
+                               remote-endpoint = <&lcdif1_output>;
+                       };
+               };
+       };
+};
+
+&lcdif1 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_lcd>;
+       status = "okay";
+
+       port {
+               lcdif1_output: endpoint {
+                       remote-endpoint = <&tda998x_input>;
+               };
+       };
+};

and I changed it to:

ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel, &bridge);

,but drm_of_find_panel_or_bridge() always returns -EPROBE_DEFER.

Shouldn't it be able to find the bridge chip in this case? Any ideas
of what it is missing?

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
