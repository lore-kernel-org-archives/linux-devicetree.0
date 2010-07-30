From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [patch v2] nouveau: unwind on load errors
Date: Fri, 30 Jul 2010 22:20:00 +0200
Message-ID: <20100730202000.GA4194@joi.lan>
References: <20100729180231.GV26313@bicker> <20100729193948.GA4821@joi.lan>
	<20100730150432.GC26313@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20100730150432.GC26313@bicker>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dan Carpenter <error27@gmail.com>
Cc: nouveau@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@secretlab.ca>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 30, 2010 at 05:04:32PM +0200, Dan Carpenter wrote:
> nuveau_load() just returned directly if there was an error instead of                                                       
  ^^^^^^ typo

> releasing resources.                                                                                                         
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> V2: updated to the nouveau git tree.

Thanks.
Reviewed-by: Marcin Slusarz <marcin.slusarz@gmail.com>

> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
> index ee3729e..cf16bfb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -739,8 +739,10 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  	int ret;
>  
>  	dev_priv = kzalloc(sizeof(*dev_priv), GFP_KERNEL);
> -	if (!dev_priv)
> -		return -ENOMEM;
> +	if (!dev_priv) {
> +		ret = -ENOMEM;
> +		goto err_out;
> +	}
>  	dev->dev_private = dev_priv;
>  	dev_priv->dev = dev;
>  
> @@ -750,8 +752,10 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  		 dev->pci_vendor, dev->pci_device, dev->pdev->class);
>  
>  	dev_priv->wq = create_workqueue("nouveau");
> -	if (!dev_priv->wq)
> -		return -EINVAL;
> +	if (!dev_priv->wq) {
> +		ret = -EINVAL;
> +		goto err_priv;
> +	}
>  
>  	/* resource 0 is mmio regs */
>  	/* resource 1 is linear FB */
> @@ -764,7 +768,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  	if (!dev_priv->mmio) {
>  		NV_ERROR(dev, "Unable to initialize the mmio mapping. "
>  			 "Please report your setup to " DRIVER_EMAIL "\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_wq;
>  	}
>  	NV_DEBUG(dev, "regs mapped ok at 0x%llx\n",
>  					(unsigned long long)mmio_start_offs);
> @@ -812,7 +817,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  		break;
>  	default:
>  		NV_INFO(dev, "Unsupported chipset 0x%08x\n", reg0);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_mmio;
>  	}
>  
>  	NV_INFO(dev, "Detected an NV%2x generation card (0x%08x)\n",
> @@ -820,7 +826,7 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  
>  	ret = nouveau_remove_conflicting_drivers(dev);
>  	if (ret)
> -		return ret;
> +		goto err_mmio;
>  
>  	/* Map PRAMIN BAR, or on older cards, the aperture withing BAR0 */
>  	if (dev_priv->card_type >= NV_40) {
> @@ -834,7 +840,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  				dev_priv->ramin_size);
>  		if (!dev_priv->ramin) {
>  			NV_ERROR(dev, "Failed to PRAMIN BAR");
> -			return -ENOMEM;
> +			ret = -ENOMEM;
> +			goto err_mmio;
>  		}
>  	} else {
>  		dev_priv->ramin_size = 1 * 1024 * 1024;
> @@ -842,7 +849,8 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  					  dev_priv->ramin_size);
>  		if (!dev_priv->ramin) {
>  			NV_ERROR(dev, "Failed to map BAR0 PRAMIN.\n");
> -			return -ENOMEM;
> +			ret = -ENOMEM;
> +			goto err_mmio;
>  		}
>  	}
>  
> @@ -857,9 +865,21 @@ int nouveau_load(struct drm_device *dev, unsigned long flags)
>  	/* For kernel modesetting, init card now and bring up fbcon */
>  	ret = nouveau_card_init(dev);
>  	if (ret)
> -		return ret;
> +		goto err_ramin;
>  
>  	return 0;
> +
> +err_ramin:
> +	iounmap(dev_priv->ramin);
> +err_mmio:
> +	iounmap(dev_priv->mmio);
> +err_wq:
> +	destroy_workqueue(dev_priv->wq);
> +err_priv:
> +	kfree(dev_priv);
> +	dev->dev_private = NULL;
> +err_out:
> +	return ret;
>  }
>  
>  void nouveau_lastclose(struct drm_device *dev)
