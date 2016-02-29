From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v6 09/11] drm/hisilicon: Add support for external bridge
Date: Tue, 1 Mar 2016 00:23:05 +0530
Message-ID: <56D49391.1070500@codeaurora.org>
References: <1456476028-36880-1-git-send-email-xinliang.liu@linaro.org>
 <1456476028-36880-10-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456476028-36880-10-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, robh@kernel.org, daniel@fooishbar.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, emil.l.velikov@gmail.com, mark.rutland@arm.com
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, andy.green@linaro.org, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, zourongrong@huawei.com, lijianhua@huawei.com, sumit.semwal@linaro.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org



On 2/26/2016 2:10 PM, Xinliang Liu wrote:
> Add support for external HDMI bridge.
>
> v6: None.
> v5: None.
> v4: None.
> v3:
> - Fix a typo: s/exteranl/external.
> v2:
> - Remove abtraction layer.
>

Reviewed-by: Archit Taneja <architt@codeaurora.org>

> Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
> ---
>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 52 ++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> index f15798b61451..c2c406446513 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -79,6 +79,7 @@ struct dsi_hw_ctx {
>
>   struct dw_dsi {
>   	struct drm_encoder encoder;
> +	struct drm_bridge *bridge;
>   	struct mipi_dsi_host host;
>   	struct drm_display_mode cur_mode;
>   	struct dsi_hw_ctx *ctx;
> @@ -688,6 +689,25 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
>   	return 0;
>   }
>
> +static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
> +{
> +	struct drm_encoder *encoder = &dsi->encoder;
> +	struct drm_bridge *bridge = dsi->bridge;
> +	int ret;
> +
> +	/* associate the bridge to dsi encoder */
> +	encoder->bridge = bridge;
> +	bridge->encoder = encoder;
> +
> +	ret = drm_bridge_attach(dev, bridge);
> +	if (ret) {
> +		DRM_ERROR("failed to attach external bridge\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int dsi_bind(struct device *dev, struct device *master, void *data)
>   {
>   	struct dsi_data *ddata = dev_get_drvdata(dev);
> @@ -703,6 +723,10 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
>   	if (ret)
>   		return ret;
>
> +	ret = dsi_bridge_init(drm_dev, dsi);
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>
> @@ -719,8 +743,36 @@ static const struct component_ops dsi_ops = {
>   static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
>   {
>   	struct dsi_hw_ctx *ctx = dsi->ctx;
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *endpoint, *bridge_node;
> +	struct drm_bridge *bridge;
>   	struct resource *res;
>
> +	/*
> +	 * Get the endpoint node. In our case, dsi has one output port1
> +	 * to which the external HDMI bridge is connected.
> +	 */
> +	endpoint = of_graph_get_endpoint_by_regs(np, 1, -1);
> +	if (!endpoint) {
> +		DRM_ERROR("no valid endpoint node\n");
> +		return -ENODEV;
> +	}
> +	of_node_put(endpoint);
> +
> +	bridge_node = of_graph_get_remote_port_parent(endpoint);
> +	if (!bridge_node) {
> +		DRM_ERROR("no valid bridge node\n");
> +		return -ENODEV;
> +	}
> +	of_node_put(bridge_node);
> +
> +	bridge = of_drm_find_bridge(bridge_node);
> +	if (!bridge) {
> +		DRM_INFO("wait for external HDMI bridge driver.\n");
> +		return -EPROBE_DEFER;
> +	}
> +	dsi->bridge = bridge;
> +
>   	ctx->pclk = devm_clk_get(&pdev->dev, "pclk");
>   	if (IS_ERR(ctx->pclk)) {
>   		DRM_ERROR("failed to get pclk clock\n");
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
