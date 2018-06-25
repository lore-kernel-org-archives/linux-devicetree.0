From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/7] clk: sunxi-ng: add A64 compatible string
Date: Mon, 25 Jun 2018 17:58:50 +0200
Message-ID: <20180625155850.m4unvqyxc3aavrkv@flea>
References: <20180622124540.56203-1-icenowy@aosc.io>
 <20180622124540.56203-3-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s24chzv6ebukab2t"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBRVCYTMQKGQECCWYDBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180622124540.56203-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--s24chzv6ebukab2t
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jun 22, 2018 at 08:45:37PM +0800, Icenowy Zheng wrote:
> As claiming Allwinner A64 SRAM C is a prerequisite for all sub-blocks of
> the A64 DE2, not only the CCU sub-block, a bus driver is then written for
> enabling the access to the whole DE2 part by claiming the SRAM.
> 
> In this situation, the A64 compatible string will be just added with no
> other requirments, as they're processed by the parent bus driver.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> No changes since v1.
> 
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> index 468d1abaf0ee..8df7cd93453e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -292,13 +292,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
>  		.compatible = "allwinner,sun50i-h5-de2-clk",
>  		.data = &sun50i_a64_de2_clk_desc,
>  	},
> -	/*
> -	 * The Allwinner A64 SoC needs some bit to be poke in syscon to make
> -	 * DE2 really working.
> -	 * So there's currently no A64 compatible here.
> -	 * H5 shares the same reset line with A64, so here H5 is using the
> -	 * clock description of A64.
> -	 */
> +	{
> +		.compatible = "allwinner,sun50i-a64-de2-clk",
> +		.data = &sun50i_a64_de2_clk_desc,
> +	},

This should be before the h5 (and possibly others?) compatible.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--s24chzv6ebukab2t--
