From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: Integrate interconnect API in MDSS
Date: Wed, 19 Dec 2018 16:37:27 +0200
Message-ID: <bbe80ea8-52ef-3942-9691-eaad19eb996a@linaro.org>
References: <20181122090653.3523-1-skolluku@codeaurora.org>
 <20181122090653.3523-3-skolluku@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122090653.3523-3-skolluku@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sravanthi Kollukuduru <skolluku@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
List-Id: devicetree@vger.kernel.org

Hi Sravanthi,

Thanks for the patch!

On 11/22/18 11:06, Sravanthi Kollukuduru wrote:
> The interconnect framework is designed to provide a
> standard kernel interface to control the settings of
> the interconnects on a SoC.
> 
> The interconnect API uses a consumer/provider-based model,
> where the providers are the interconnect buses and the
> consumers could be various drivers.
> 
> MDSS is one of the interconnect consumers which uses the
> interconnect APIs to get the path between endpoints and
> set its bandwidth/latency/QoS requirements for the given
> interconnected path.
> 
> Changes in v2:
> 	- Remove error log and unnecessary check (Jordan Crouse)
> 
> Changes in v3:
> 	- Code clean involving variable name change, removal
> 	  of extra paranthesis and variables (Matthias Kaehlcke)
> 
> Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 49 ++++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 38576f8b90b6..1387a6b1b39e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -4,10 +4,12 @@
>   */
>  
>  #include "dpu_kms.h"
> +#include <linux/interconnect.h>
>  
>  #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
>  
> -#define HW_INTR_STATUS			0x0010
> +#define HW_INTR_STATUS	0x0010

Unrelated change?

> +#define MAX_BW		6800000

In what units? Maybe add a comment.

>  
>  struct dpu_mdss {
>  	struct msm_mdss base;
> @@ -16,8 +18,30 @@ struct dpu_mdss {
>  	u32 hwversion;
>  	struct dss_module_power mp;
>  	struct dpu_irq_controller irq_controller;
> +	struct icc_path *path[2];
> +	u32 num_paths;
>  };
>  
> +static int dpu_mdss_parse_data_bus_icc_path(
> +		struct drm_device *dev, struct dpu_mdss *dpu_mdss)

Nit: Lines should not end with a '('. Please move the first argument up:

static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
					    struct dpu_mdss *dpu_mdss)

> +{
> +	struct icc_path *path0 = of_icc_get(dev->dev, "port0");
> +	struct icc_path *path1 = of_icc_get(dev->dev, "port1");

In DT it's preferred that the name contains both the source and
destination, so maybe of_icc_get(dev->dev, "mdp0-mem") etc.

> +
> +	if (IS_ERR(path0))
> +		return PTR_ERR(path0);
> +
> +	dpu_mdss->path[0] = path0;
> +	dpu_mdss->num_paths = 1;
> +
> +	if (!IS_ERR(path1)) {
> +		dpu_mdss->path[1] = path1;
> +		dpu_mdss->num_paths++;
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t dpu_mdss_irq(int irq, void *arg)
>  {
>  	struct dpu_mdss *dpu_mdss = arg;
> @@ -127,7 +151,11 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
>  {
>  	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
>  	struct dss_module_power *mp = &dpu_mdss->mp;
> -	int ret;
> +	int ret, i;
> +	u64 avg_bw = dpu_mdss->num_paths ? MAX_BW/dpu_mdss->num_paths : 0;

Nit: Please add spaces around "/"

> +
> +	for (i = 0; i < dpu_mdss->num_paths; i++)
> +		icc_set(dpu_mdss->path[i], avg_bw, MAX_BW);

Now we have macros in the header, that can be used to specify the
bandwidth units. So please use kBps_to_icc or MBps_to_icc etc. If we
decide in the future to change the internal units, we will be able to do
it without touching the users.

Thanks,
Georgi

>  
>  	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
>  	if (ret)
> @@ -140,12 +168,15 @@ static int dpu_mdss_disable(struct msm_mdss *mdss)
>  {
>  	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
>  	struct dss_module_power *mp = &dpu_mdss->mp;
> -	int ret;
> +	int ret, i;
>  
>  	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>  	if (ret)
>  		DPU_ERROR("clock disable failed, ret:%d\n", ret);
>  
> +	for (i = 0; i < dpu_mdss->num_paths; i++)
> +		icc_set(dpu_mdss->path[i], 0, 0);
> +
>  	return ret;
>  }
>  
> @@ -155,6 +186,7 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct dpu_mdss *dpu_mdss = to_dpu_mdss(priv->mdss);
>  	struct dss_module_power *mp = &dpu_mdss->mp;
> +	int i;
>  
>  	pm_runtime_disable(dev->dev);
>  	_dpu_mdss_irq_domain_fini(dpu_mdss);
> @@ -162,6 +194,9 @@ static void dpu_mdss_destroy(struct drm_device *dev)
>  	msm_dss_put_clk(mp->clk_config, mp->num_clk);
>  	devm_kfree(&pdev->dev, mp->clk_config);
>  
> +	for (i = 0; i < dpu_mdss->num_paths; i++)
> +		icc_put(dpu_mdss->path[i]);
> +
>  	if (dpu_mdss->mmio)
>  		devm_iounmap(&pdev->dev, dpu_mdss->mmio);
>  	dpu_mdss->mmio = NULL;
> @@ -200,6 +235,10 @@ int dpu_mdss_init(struct drm_device *dev)
>  	}
>  	dpu_mdss->mmio_len = resource_size(res);
>  
> +	ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
> +	if (ret)
> +		return ret;
> +
>  	mp = &dpu_mdss->mp;
>  	ret = msm_dss_parse_clock(pdev, mp);
>  	if (ret) {
> @@ -221,14 +260,14 @@ int dpu_mdss_init(struct drm_device *dev)
>  		goto irq_error;
>  	}
>  
> +	priv->mdss = &dpu_mdss->base;
> +
>  	pm_runtime_enable(dev->dev);
>  
>  	pm_runtime_get_sync(dev->dev);
>  	dpu_mdss->hwversion = readl_relaxed(dpu_mdss->mmio);
>  	pm_runtime_put_sync(dev->dev);
>  
> -	priv->mdss = &dpu_mdss->base;
> -
>  	return ret;
>  
>  irq_error:
> 
