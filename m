From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 14/27] drm/sun4i: Don't check for panel
 or bridge on TV TCONs
Date: Wed, 13 Jun 2018 09:46:21 +0200
Message-ID: <20180613074621.5phumovcyymbkfbn@flea>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
 <20180612200036.21483-15-jernej.skrabec@siol.net>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="on6p3lb7ylr4gu64"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTUXQPMQKGQEMHLEKSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180612200036.21483-15-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--on6p3lb7ylr4gu64
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Jun 12, 2018 at 10:00:23PM +0200, Jernej Skrabec wrote:
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
> index b1205a7bc20f..c9ffa5381185 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1189,13 +1189,19 @@ static const struct component_ops sun4i_tcon_ops = {
>  static int sun4i_tcon_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
> +	const struct sun4i_tcon_quirks *quirks;
>  	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	int ret;
>  
> -	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> -	if (ret == -EPROBE_DEFER)
> -		return ret;
> +	quirks = of_device_get_match_data(&pdev->dev);

We should probably check ofr the pointer value before dereferencing it.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--on6p3lb7ylr4gu64--
