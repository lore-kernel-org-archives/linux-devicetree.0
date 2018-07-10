From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 16/17] drm/sun4i: tcon-top: Remove mux
 configuration at probe time
Date: Wed, 11 Jul 2018 00:09:26 +0800
Message-ID: <CAGb2v64rjUnwnXbWxTSYJyhMyCV5QmV9YSr+Jryx3nEeMP8GJg@mail.gmail.com>
References: <20180706175113.26698-1-jernej.skrabec@siol.net> <20180706175113.26698-17-jernej.skrabec@siol.net>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBTNUSPNAKGQEMIHBRWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706175113.26698-17-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 7, 2018 at 1:51 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Now that R40 TCON migrated to runtime mux configuration, old code can be
> removed.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 81 +++-----------------------
>  1 file changed, 7 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index c09b15b64192..78795d6cb174 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -87,34 +87,6 @@ int sun8i_tcon_top_de_config(struct device *dev, int mixer, int tcon)
>  }
>  EXPORT_SYMBOL(sun8i_tcon_top_de_config);
>
> -static int sun8i_tcon_top_get_connected_ep_id(struct device_node *node,
> -                                             int port_id)
> -{
> -       struct device_node *ep, *remote, *port;
> -       struct of_endpoint endpoint;
> -
> -       port = of_graph_get_port_by_id(node, port_id);
> -       if (!port)
> -               return -ENOENT;
> -
> -       for_each_available_child_of_node(port, ep) {
> -               remote = of_graph_get_remote_port_parent(ep);
> -               if (!remote)
> -                       continue;
> -
> -               if (of_device_is_available(remote)) {
> -                       of_graph_parse_endpoint(ep, &endpoint);
> -
> -                       of_node_put(remote);
> -
> -                       return endpoint.id;
> -               }
> -
> -               of_node_put(remote);
> -       }
> -
> -       return -ENOENT;
> -}
>
>  static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
>                                                    const char *parent,
> @@ -149,11 +121,9 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>         struct platform_device *pdev = to_platform_device(dev);
>         struct clk_hw_onecell_data *clk_data;
>         struct sun8i_tcon_top *tcon_top;
> -       bool mixer0_unused = false;
>         struct resource *res;
>         void __iomem *regs;
> -       int ret, i, id;
> -       u32 val;
> +       int ret, i;
>
>         tcon_top = devm_kzalloc(dev, sizeof(*tcon_top), GFP_KERNEL);
>         if (!tcon_top)
> @@ -198,49 +168,12 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>                 goto err_assert_reset;
>         }
>
> -       val = 0;
> -
> -       /* check if HDMI mux output is connected */
> -       if (sun8i_tcon_top_get_connected_ep_id(dev->of_node, 5) >= 0) {
> -               /* find HDMI input endpoint id, if it is connected at all*/
> -               id = sun8i_tcon_top_get_connected_ep_id(dev->of_node, 4);
> -               if (id >= 0)
> -                       val = FIELD_PREP(TCON_TOP_HDMI_SRC_MSK, id + 1);
> -               else
> -                       DRM_DEBUG_DRIVER("TCON TOP HDMI input is not connected\n");
> -       } else {
> -               DRM_DEBUG_DRIVER("TCON TOP HDMI output is not connected\n");
> -       }
> -
> -       writel(val, regs + TCON_TOP_GATE_SRC_REG);
> -
> -       val = 0;
> -
> -       /* process mixer0 mux output */
> -       id = sun8i_tcon_top_get_connected_ep_id(dev->of_node, 1);
> -       if (id >= 0) {
> -               val = FIELD_PREP(TCON_TOP_PORT_DE0_MSK, id);
> -       } else {
> -               DRM_DEBUG_DRIVER("TCON TOP mixer0 output is not connected\n");
> -               mixer0_unused = true;
> -       }
> -
> -       /* process mixer1 mux output */
> -       id = sun8i_tcon_top_get_connected_ep_id(dev->of_node, 3);
> -       if (id >= 0) {
> -               val |= FIELD_PREP(TCON_TOP_PORT_DE1_MSK, id);
> -
> -               /*
> -                * mixer0 mux has priority over mixer1 mux. We have to
> -                * make sure mixer0 doesn't overtake TCON from mixer1.
> -                */
> -               if (mixer0_unused && id == 0)
> -                       val |= FIELD_PREP(TCON_TOP_PORT_DE0_MSK, 1);
> -       } else {
> -               DRM_DEBUG_DRIVER("TCON TOP mixer1 output is not connected\n");
> -       }
> -
> -       writel(val, regs + TCON_TOP_PORT_SEL_REG);
> +       /*
> +        * Default register values might have some reserved bits set, which
> +        * prevents TCON TOP from working properly. Set them to 0 here.
> +        */
> +       writel(0, regs + TCON_TOP_GATE_SRC_REG);
> +       writel(0, regs + TCON_TOP_PORT_SEL_REG);

Would it make sense to just force a reset using the reset control?

ChenYu
