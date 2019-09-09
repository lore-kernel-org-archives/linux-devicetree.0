From: Joe Perches <joe@perches.com>
Subject: Re: [Patch 09/13] media: am437x-vpfe: fix function trace debug log
Date: Mon, 09 Sep 2019 09:54:56 -0700
Message-ID: <ec66e477095bcddb86ffcc7ca10d3e0bbe72f943.camel@perches.com>
References: <20190909162743.30114-1-bparrot@ti.com>
         <20190909162743.30114-10-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909162743.30114-10-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-09-09 at 11:27 -0500, Benoit Parrot wrote:
> checkpatch.pl nows reports several:
> WARNING: Prefer using '"%s...", __func__' to using '<function name>',
> this function's name, in a string
> 
> So fix these for the whole driver.

Most of these seem to be function tracing comments
that should probably be removed instead.

The generic kernel facility ftrace works well.

> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
[]
> @@ -466,7 +466,7 @@ static void vpfe_ccdc_config_ycbcr(struct vpfe_ccdc *ccdc)
>  	struct ccdc_params_ycbcr *params = &ccdc->ccdc_cfg.ycbcr;
>  	u32 syn_mode;
>  
> -	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_ycbcr:\n");
> +	vpfe_dbg(3, vpfe, "%s:\n", __func__);

Remove this instead

>  	/*
>  	 * first restore the CCDC registers to default values
>  	 * This is important since we assume default values to be set in
> @@ -598,7 +598,7 @@ static void vpfe_ccdc_config_raw(struct vpfe_ccdc *ccdc)
>  	unsigned int syn_mode;
>  	unsigned int val;
>  
> -	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_raw:\n");
> +	vpfe_dbg(3, vpfe, "%s:\n", __func__);

here too, etc...
