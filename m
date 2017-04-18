From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] drm/vc4: Turn the V3D clock on at runtime.
Date: Tue, 18 Apr 2017 16:48:56 -0700
Message-ID: <7906db2f-cfb8-e2e6-5869-b6e829dd8c6f@gmail.com>
References: <20170418191157.18517-1-eric@anholt.net>
 <20170418233805.15767-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170418233805.15767-1-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/18/2017 04:38 PM, Eric Anholt wrote:
> For the Raspberry Pi's bindings, the power domain also implicitly
> turns on the clock and deasserts reset, but for the new Cygnus port we
> start representing the clock in the devicetree.
> 
> v2: Document the clock-names property, check for -ENOENT for no clock
>     in DT.
> 
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---

> +	if (v3d->clk)
> +		clk_disable_unprepare(v3d->clk);

The clock API allows you to pass a NULL clk and do nothing in these
cases which is what you seem to have done a few lines below, you could
simplify these checks?

> +
>  	return 0;
>  }
>  
> @@ -318,6 +322,13 @@ static int vc4_v3d_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	if (v3d->clk) {
> +		int ret = clk_prepare_enable(v3d->clk);
> +
> +		if (ret != 0)
> +			return ret;
> +	}
> +
>  	vc4_v3d_init_hw(vc4->dev);
>  	vc4_irq_postinstall(vc4->dev);
>  
> @@ -348,15 +359,40 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
>  	vc4->v3d = v3d;
>  	v3d->vc4 = vc4;
>  
> +	v3d->clk = devm_clk_get(dev, "v3d_clk");
> +	if (IS_ERR(v3d->clk)) {
> +		int ret = PTR_ERR(v3d->clk);
> +
> +		if (ret == -ENOENT) {
> +			/* bcm2835 didn't have a clock reference in the DT. */
> +			ret = 0;
> +			v3d->clk = NULL;
> +		} else {
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get V3D clock: %d\n",
> +					ret);
> +			return ret;
> +		}
> +	}
> +
>  	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
>  		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
>  			  V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
>  		return -EINVAL;
>  	}
>  
> +	if (v3d->clk) {
> +		ret = clk_prepare_enable(v3d->clk);
> +		if (ret != 0)
> +			return ret;
> +	}
> +
>  	ret = vc4_allocate_bin_bo(drm);
> -	if (ret)
> +	if (ret) {
> +		if (v3d->clk)
> +			clk_disable_unprepare(v3d->clk);
>  		return ret;
> +	}
>  
>  	/* Reset the binner overflow address/size at setup, to be sure
>  	 * we don't reuse an old one.
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
