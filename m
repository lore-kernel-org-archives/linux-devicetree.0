From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 14/25] drm/sun4i: sun6i_mipi_dsi:
 Increase hfp packet overhead
Date: Mon, 29 Oct 2018 10:27:54 +0100
Message-ID: <20181029092754.2tl7i5k5qpbn4557@flea>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-15-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pvlkcstvb3cw6o6f"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNNF3PPAKGQEABILCAY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181026144344.27778-15-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--pvlkcstvb3cw6o6f
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Oct 26, 2018 at 08:13:33PM +0530, Jagan Teki wrote:
> Increase the hfp packet overhead with another 10 bytes, the extra
> 10 bytes(which is hblk packet overhead) is adding for hfp packet
> overhead since hfp depends on hblk.
> 
> This is truely as per BSP code from BPI-M64-bsp.
> The real computation from BSP is
> (in drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> dsi_hbp = (hbp-hspw)*dsi_pixel_bits[format]/8 - (4+2);
> dsi_hact = x * dsi_pixel_bits[format]/8;
> dsi_hblk = (ht-hspw)*dsi_pixel_bits[format]/8-(4+4+2);
> dsi_hfp = dsi_hblk - (4+dsi_hact+2) - (4+dsi_hbp+2);
> 
> Example,
> u32 fmt = dsi_pixel_bits[format]/8;
> => ((ht-hspw)*fmt - 10) - (6 + x * fmt) - (6 + (hbp-hspw)*fmt - 6)
> => (ht - hspw - x - (hbp - hspw)) * fmt - 16
> => (ht - x - hbp) * fmt - 16
> => (ht - x - (timmings->hor_total_time - timmings->hor_front_porch - x)
> * fmt - 16
> => (timmings->hor_total_time - x - timmings->hor_total_time +
> timmings->hor_front_porch + x) * fmt - 16
> => timmings->hor_front_porch * fmt - 16
> 
> So, increase the DSI hfp packet overhead by hblk packet overhead.
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
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> index 6584b51736a9..20e330186b7f 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -461,7 +461,7 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
>  {
>  	struct mipi_dsi_device *device = dsi->device;
>  	unsigned int Bpp = mipi_dsi_pixel_format_to_bpp(device->format) / 8;
> -	u16 hbp, hfp, hsa, hblk_max, hblk, vblk;
> +	u16 hbp, hfp_pkt_overhead, hfp, hsa, hblk_max, hblk, vblk;
>  	size_t bytes;
>  	u8 *buffer;
>  
> @@ -484,14 +484,6 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
>  	hbp = max((unsigned int)HBP_PACKET_OVERHEAD,
>  		  (mode->htotal - mode->hsync_end) * Bpp - HBP_PACKET_OVERHEAD);
>  
> -	/*
> -	 * The frontporch is set using a blanking packet (4 bytes +
> -	 * payload + 2 bytes). Its minimal size is therefore 6 bytes
> -	 */
> -#define HFP_PACKET_OVERHEAD	6
> -	hfp = max((unsigned int)HFP_PACKET_OVERHEAD,
> -		  (mode->hsync_start - mode->hdisplay) * Bpp - HFP_PACKET_OVERHEAD);
> -
>  	/*
>  	 * hblk seems to be the line + porches length.
>  	 * The blank is set using a blanking packet (4 bytes + 4 bytes +
> @@ -502,6 +494,18 @@ static void sun6i_dsi_setup_timings(struct sun6i_dsi *dsi,
>  	hblk_max -= HBLK_PACKET_OVERHEAD;
>  	hblk = max((unsigned int)HBLK_PACKET_OVERHEAD, hblk_max);
>  
> +	/*
> +	 * The frontporch is set using a blanking packet (4 bytes +
> +	 * payload + 2 bytes). Its minimal size is therefore 6 bytes
> +	 *
> +	 * According to BSP code, extra 10 bytes(which is hblk packet overhead)
> +	 * is adding for hfp packet overhead since hfp depends on hblk.

"According to the BSP code, another 10 bytes (the HBLK packet
overhead) need to be added to the front porch overhead."

How has this been verified? Since we have registers to set all the
parameters, this seems kind of weird.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--pvlkcstvb3cw6o6f--
