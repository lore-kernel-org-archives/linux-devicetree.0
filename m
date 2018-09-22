From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 13/27] drm/sun4i: Add support for H6 DE3
 mixer 0
Date: Sat, 22 Sep 2018 21:23:55 +0800
Message-ID: <CAGb2v66kp4B5VZfmTc8L6qt=OPHjbYBtXRbC=L6jGTzvEKvb=w@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-14-jernej.skrabec@siol.net>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6METHOQKGQEZBOYWCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180902072643.4917-14-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
>
> Mixer 0 has 1 VI and 3 UI planes, scaler on all planes and can output
> 4K image @60Hz. It also support 10 bit colors.

AFAICT 10 bit color support is not implemented? Please mention this.

>
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index a9218abf0935..54eca2dd4b33 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -540,6 +540,15 @@ static int sun8i_mixer_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {

Please sort the per-compatible structures according to "version sort" rules.

> +       .ccsc           = 0,
> +       .is_de3         = true,
> +       .mod_rate       = 600000000,
> +       .scaler_mask    = 0xf,
> +       .ui_num         = 3,
> +       .vi_num         = 1,
> +};
> +
>  static const struct sun8i_mixer_cfg sun8i_a83t_mixer0_cfg = {
>         .ccsc           = 0,
>         .scaler_mask    = 0xf,
> @@ -587,6 +596,10 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
>  };
>
>  static const struct of_device_id sun8i_mixer_of_table[] = {
> +       {
> +               .compatible = "allwinner,sun50i-h6-de3-mixer-0",
> +               .data = &sun50i_h6_mixer0_cfg,
> +       },

Same here.

ChenYu

>         {
>                 .compatible = "allwinner,sun8i-a83t-de2-mixer-0",
>                 .data = &sun8i_a83t_mixer0_cfg,
> --
> 2.18.0
>
