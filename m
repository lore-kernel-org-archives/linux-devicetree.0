From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 15/25] drm/sun4i: sun6i_mipi_dsi: Set
 proper vblk timing calculation
Date: Mon, 29 Oct 2018 10:30:05 +0100
Message-ID: <20181029093005.6kg7pc5z63gi6lzb@flea>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-16-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b5odkxjnn5rkvxze"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKFG3PPAKGQEX7KVPRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181026144344.27778-16-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--b5odkxjnn5rkvxze
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Oct 26, 2018 at 08:13:34PM +0530, Jagan Teki wrote:
> Unlike hblk, the vblk timings should follow an equation to compute
> the desired value for lane 4 devices and rest of devices it would be 0.
> 
> BSP code from BPI-M64-bsp is computing vblk as for 4-lane devices
> (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> tmp = (ht*dsi_pixel_bits[format]/8)*vt-(4+dsi_hblk+2);
> dsi_vblk = (lane-tmp%lane);
> 
> So, update the vblk timing calculation accordingly.
> 
> Tested on 2-lane, 4-lane MIPI-DSI LCD panels.
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v3:
> - new patch
> Changes for v2:
> - none
> 
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 20e330186b7f..42bd7506abaf 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -511,8 +511,19 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
>  	 * Allwinner BSP is using a rather convoluted calculation
>  	 * there only for 4 lanes. However, using 0 (the !4 lanes
>  	 * case) even with a 4 lanes screen seems to work...

Since you're adding the support for 2 lanes DSI displays, that should
be removed.

> +	 *
> +	 * The vertical blank is set using a blanking packet (4 bytes +
> +	 * payload + 2 bytes). Its minimal size is therefore 6 bytes
>  	 */
> -	vblk = 0;
> +#define VBLK_PACKET_OVERHEAD	6
> +	if (device->lanes == 4) {
> +		int tmp;
> +
> +		tmp = (mode->htotal * Bpp) * mode->vtotal - (hblk + VBLK_PACKET_OVERHEAD);
> +		vblk =(device->lanes - tmp % device->lanes);

This generates a checkpatch warning. You should run all your patches
through checkpatch before sending them.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--b5odkxjnn5rkvxze--
