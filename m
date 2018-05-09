From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/3] drm/panel: Add RGB666 variant of
 Innolux AT070TN90
Date: Wed, 9 May 2018 09:12:26 +0200
Message-ID: <20180509071226.ivh4s3wtczg2u7zw@flea>
References: <20180507220413.21990-1-contact@paulk.fr>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="erirrsr4rgg7d5ew"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXF6ZLLQKGQEJ7AIYTI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180507220413.21990-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--erirrsr4rgg7d5ew
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, May 08, 2018 at 12:04:11AM +0200, Paul Kocialkowski wrote:
> This adds timings for the RGB666 variant of the Innolux AT070TN90 panel,
> as found on the Ainol AW1 tablet.
> 
> The panel also supports RGB888 output. When RGB666 mode is used instead,
> the two extra lanes per component are grounded.
> 
> In the future, it might become necessary to introduce a dedicated
> device-tree property to specify the bus format to use instead of the
> default one for the panel. This will allow supporting different bus
> formats for the same panel modes.
> 
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index cbf1ab404ee7..32e30d5a8f08 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1063,6 +1063,29 @@ static const struct panel_desc innolux_at043tn24 = {
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
>  };
>  
> +static const struct drm_display_mode innolux_at070tn90_mode = {
> +	.clock = 40000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 112,
> +	.hsync_end = 800 + 112 + 1,
> +	.htotal = 800 + 112 + 1 + 87,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 141,
> +	.vsync_end = 480 + 141 + 1,
> +	.vtotal = 480 + 141 + 1 + 38,
> +	.vrefresh = 60,
> +};
> +
> +static const struct panel_desc innolux_at070tn90 = {
> +	.modes = &innolux_at070tn90_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> +};
> +

I'm not really convinced this is the right approach. You said it
yourself, the panel is using a 24-bits interface, and you just happen
to have a tablet that routed it using a 18-bits interface instead.

That doesn't belong in the driver, especially associated to the
compatible, but where the routing is described: in the device
tree. And given that the panel interface is a 24 bits panel, if we
were to have a default, we should have this one, and not the one
fitting your use case.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--erirrsr4rgg7d5ew--
