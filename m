From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 12/24] drm/sun4i: Don't check for panel
 or bridge on TV TCONs
Date: Thu, 28 Jun 2018 10:17:38 +0800
Message-ID: <CAGb2v67KBqu7_2Q-yZP+zmB9A4Hu1Hh=9Yq2rrnBU5uxyzTpGg@mail.gmail.com>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180625120304.7543-13-jernej.skrabec@siol.net>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWUK2HMQKGQE27J5I2I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180625120304.7543-13-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> TV TCONs are always connected to TV or HDMI encoder, so it doesn't make
> sense to check if panel or bridge is connected to them.
>
> Check if TCON has channel 0 and only then check for connected panel or
> bridges.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 761687ebacba..a41c7bb0d557 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1178,13 +1178,19 @@ static const struct component_ops sun4i_tcon_ops = {
>  static int sun4i_tcon_probe(struct platform_device *pdev)
>  {
>         struct device_node *node = pdev->dev.of_node;
> +       const struct sun4i_tcon_quirks *quirks;
>         struct drm_bridge *bridge;
>         struct drm_panel *panel;
>         int ret;
>
> -       ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> -       if (ret == -EPROBE_DEFER)
> -               return ret;
> +       quirks = of_device_get_match_data(&pdev->dev);
> +
> +       /* panels and bridges are present only on TCONs with channel 0 */
> +       if (quirks->has_channel_0) {

This is implied by the device tree binding. TCONs that don't have panels
or bridges will have endpoint 0 unconnected, and drm_of_find_panel_or_bridge
will return -ENODEV.

It doesn't hurt to skip the check though.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

> +               ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> +               if (ret == -EPROBE_DEFER)
> +                       return ret;
> +       }
>
>         return component_add(&pdev->dev, &sun4i_tcon_ops);
>  }
> --
> 2.18.0
>
