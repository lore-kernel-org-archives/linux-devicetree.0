From: Joe Perches <joe@perches.com>
Subject: Re: [Patch 10/13] media: am437x-vpfe: Remove print_fourcc helper
Date: Mon, 09 Sep 2019 09:39:37 -0700
Message-ID: <7d870b0119afa378dc68c710670b9b550ef5bdd4.camel@perches.com>
References: <20190909162743.30114-1-bparrot@ti.com>
         <20190909162743.30114-11-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909162743.30114-11-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-09-09 at 11:27 -0500, Benoit Parrot wrote:
> print_fourcc helper function was used for debug log the
> convert a pixel format code into its readable form for display
> purposes. But since it used a single static buffer to perform
> the conversion this might lead to display format issue when more
> than one instance was invoked simultaneously.
> 
> It turns out that print_fourcc can be safely replace by using
> "%4.4s" instead and casting the pointer to the fourcc code
> into a (char *).
[]
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
[]
> @@ -221,20 +221,6 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
[]
> @@ -700,8 +686,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
>  {
>  	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
>  
> -	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
> -		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
> +	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4.4s\n",
> +		 __func__, ccdc->ccdc_cfg.if_type, (char *)&pixfmt);


To avoid any possible defect in the content of pixfmt, it's
probably better to use vsprintf extension "%4pE", &pixfmt
see: Documentation/core-api/printk-formats.rst

	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4pE\n",
		 __func__, ccdc->ccdc_cfg.if_type, &pixfmt);

>  
>  	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
>  		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
> @@ -989,8 +975,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
>  
>  	vpfe_dbg(2, vpfe, "%s:\n", __func__);
>  
> -	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
> -		print_fourcc(vpfe->v_fmt.fmt.pix.pixelformat));
> +	vpfe_dbg(1, vpfe, "pixelformat: %4.4s\n",
> +		 (char *)&vpfe->v_fmt.fmt.pix.pixelformat);

	vpfe_dbg(1, vpfe, "pixelformat: %4pE\n",
		 &vpfe->v_fmt.fmt.pix.pixelformat);

etc...
