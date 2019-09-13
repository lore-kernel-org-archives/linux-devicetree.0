From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [Patch 01/13] media: am437x-vpfe: Fix suspend path to always
 handle pinctrl config
Date: Fri, 13 Sep 2019 14:59:28 +0200
Message-ID: <9250638e-52a4-c7bc-e969-763d45528780@xs4all.nl>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-2-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909162743.30114-2-bparrot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> From: Dave Gerlach <d-gerlach@ti.com>
> 
> Currently if vpfe is not active then it returns immediately in the
> suspend and resume handlers. Change this so that it always performs the
> pinctrl config so that we can still get proper sleep state configuration
> on the pins even if we do not need to worry about fully saving and
> restoring context.
> 
> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 44 ++++++++++-----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 2b42ba1f5949..ab959d61f9c9 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -2653,22 +2653,22 @@ static int vpfe_suspend(struct device *dev)
>  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
>  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
>  
> -	/* if streaming has not started we don't care */
> -	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
> -		return 0;
> +	/* only do full suspend if streaming has started */
> +	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
>  

It's a bit ugly to start a block with an empty line. Can you remove it?

> -	pm_runtime_get_sync(dev);
> -	vpfe_config_enable(ccdc, 1);
> +		pm_runtime_get_sync(dev);
> +		vpfe_config_enable(ccdc, 1);
>  
> -	/* Save VPFE context */
> -	vpfe_save_context(ccdc);
> +		/* Save VPFE context */
> +		vpfe_save_context(ccdc);
>  
> -	/* Disable CCDC */
> -	vpfe_pcr_enable(ccdc, 0);
> -	vpfe_config_enable(ccdc, 0);
> +		/* Disable CCDC */
> +		vpfe_pcr_enable(ccdc, 0);
> +		vpfe_config_enable(ccdc, 0);
>  
> -	/* Disable both master and slave clock */
> -	pm_runtime_put_sync(dev);
> +		/* Disable both master and slave clock */
> +		pm_runtime_put_sync(dev);
> +	}
>  
>  	/* Select sleep pin state */
>  	pinctrl_pm_select_sleep_state(dev);
> @@ -2710,19 +2710,19 @@ static int vpfe_resume(struct device *dev)
>  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
>  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
>  
> -	/* if streaming has not started we don't care */
> -	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
> -		return 0;
> +	/* only do full resume if streaming has started */
> +	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
>  

Ditto.

> -	/* Enable both master and slave clock */
> -	pm_runtime_get_sync(dev);
> -	vpfe_config_enable(ccdc, 1);
> +		/* Enable both master and slave clock */
> +		pm_runtime_get_sync(dev);
> +		vpfe_config_enable(ccdc, 1);
>  
> -	/* Restore VPFE context */
> -	vpfe_restore_context(ccdc);
> +		/* Restore VPFE context */
> +		vpfe_restore_context(ccdc);
>  
> -	vpfe_config_enable(ccdc, 0);
> -	pm_runtime_put_sync(dev);
> +		vpfe_config_enable(ccdc, 0);
> +		pm_runtime_put_sync(dev);
> +	}
>  
>  	/* Select default pin state */
>  	pinctrl_pm_select_default_state(dev);
> 

Regards,

	Hans
