From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3 4/9] drm/komeda: Add DT parsing
Date: Mon, 24 Dec 2018 12:03:04 +0000
Message-ID: <20181224120304.GF22341@e110455-lin.cambridge.arm.com>
References: <20181221095757.15510-1-james.qian.wang@arm.com>
 <20181221095757.15510-5-james.qian.wang@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181221095757.15510-5-james.qian.wang@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Cc: "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>, Brian Starkey <Brian.Starkey@arm.com>, "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>, "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>, "Jin Gao (Arm Technology China)" <Jin.Gao@arm.com>, "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>, nd <nd@arm.com>, "malidp@foss.arm.com" <malidp@foss.arm.com>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "sean@poorly.run" <sean@poorly.run>, corbet
List-Id: devicetree@vger.kernel.org

On Fri, Dec 21, 2018 at 09:59:44AM +0000, james qian wang (Arm Technology China) wrote:
> Parse DT and initialize corresponding dev/pipeline attributes.
> 
> Changes in v3:
> - Fixed style problem found by checkpatch.pl --strict.
> 
> Changes in v2:
> - Unified abbreviation of "pipeline" to "pipe".
> 
> Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../gpu/drm/arm/display/komeda/komeda_dev.c   | 76 +++++++++++++++++++
>  .../gpu/drm/arm/display/komeda/komeda_dev.h   |  3 +
>  .../drm/arm/display/komeda/komeda_pipeline.c  |  4 +
>  .../drm/arm/display/komeda/komeda_pipeline.h  |  7 ++
>  4 files changed, 90 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index 887a17005367..d0cc4f758077 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -12,6 +12,76 @@
>  #include <linux/version.h>
>  #include "komeda_dev.h"
>  
> +static int komeda_parse_pipe_dt(struct komeda_dev *mdev, struct device_node *np)
> +{
> +	struct komeda_pipeline *pipe;
> +	struct clk *clk;
> +	u32 pipe_id;
> +	int ret = 0;
> +
> +	ret = of_property_read_u32(np, "reg", &pipe_id);
> +	if (ret != 0 || pipe_id >= mdev->n_pipelines)
> +		return -EINVAL;
> +
> +	pipe = mdev->pipelines[pipe_id];
> +
> +	clk = of_clk_get_by_name(np, "aclk");
> +	if (IS_ERR(clk)) {
> +		DRM_ERROR("get aclk for pipeline %d failed!\n", pipe_id);
> +		return PTR_ERR(clk);
> +	}
> +	pipe->aclk = clk;
> +
> +	clk = of_clk_get_by_name(np, "pxclk");
> +	if (IS_ERR(clk)) {
> +		DRM_ERROR("get pxclk for pipeline %d failed!\n", pipe_id);
> +		return PTR_ERR(clk);
> +	}
> +	pipe->pxlclk = clk;
> +
> +	/* enum ports */
> +	pipe->of_output_dev =
> +		of_graph_get_remote_node(np, KOMEDA_OF_PORT_OUTPUT, 0);
> +	pipe->of_output_port =
> +		of_graph_get_port_by_id(np, KOMEDA_OF_PORT_OUTPUT);
> +
> +	pipe->of_node = np;
> +
> +	return 0;
> +}
> +
> +static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct device_node *child, *np = dev->of_node;
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = devm_clk_get(dev, "mclk");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	mdev->mclk = clk;
> +	mdev->irq  = platform_get_irq(pdev, 0);
> +	if (mdev->irq < 0) {
> +		DRM_ERROR("could not get IRQ number.\n");
> +		return mdev->irq;
> +	}
> +
> +	for_each_available_child_of_node(np, child) {
> +		if (of_node_cmp(child->name, "pipeline") == 0) {
> +			ret = komeda_parse_pipe_dt(mdev, child);
> +			if (ret) {
> +				DRM_ERROR("parse pipeline dt error!\n");
> +				of_node_put(child);
> +				break;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  struct komeda_dev *komeda_dev_create(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -74,6 +144,12 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
>  		goto err_cleanup;
>  	}
>  
> +	err = komeda_parse_dt(dev, mdev);
> +	if (err) {
> +		DRM_ERROR("parse device tree failed.\n");
> +		goto err_cleanup;
> +	}
> +
>  	return mdev;
>  
>  err_cleanup:
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> index 680e3e2cf100..4a27a44e2ec6 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> @@ -72,6 +72,9 @@ struct komeda_dev {
>  	/** @mck: HW main engine clk */
>  	struct clk *mclk;
>  
> +	/** @irq: irq number */
> +	u32 irq;
> +
>  	int n_pipelines;
>  	struct komeda_pipeline *pipelines[KOMEDA_MAX_PIPELINES];
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> index 9293598b0533..e731b2a85c3a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> @@ -55,6 +55,10 @@ void komeda_pipeline_destroy(struct komeda_dev *mdev,
>  	clk_put(pipe->pxlclk);
>  	clk_put(pipe->aclk);
>  
> +	of_node_put(pipe->of_output_dev);
> +	of_node_put(pipe->of_output_port);
> +	of_node_put(pipe->of_node);
> +
>  	devm_kfree(mdev->dev, pipe);
>  }
>  
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> index 2174796d47c5..d1e0c1140273 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h
> @@ -290,6 +290,13 @@ struct komeda_pipeline {
>  	struct komeda_improc *improc;
>  	struct komeda_timing_ctrlr *ctrlr;
>  	struct komeda_pipeline_funcs *funcs; /* private pipeline functions */
> +
> +	/** @of_node: pipeline dt node */
> +	struct device_node *of_node;
> +	/** @of_output_port: pipeline output port */
> +	struct device_node *of_output_port;
> +	/** @of_output_dev: output connector device node */
> +	struct device_node *of_output_dev;
>  };
>  
>  /**
> -- 
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
