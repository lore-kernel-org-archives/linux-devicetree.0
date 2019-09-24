From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V3 09/10] interconnect: mediatek: Add mt8183 interconnect
 provider driver
Date: Tue, 24 Sep 2019 16:53:57 -0700
Message-ID: <ff52d219-1621-37de-3b70-d10d95bf370f@linaro.org>
References: <1566995328-15158-1-git-send-email-henryc.chen@mediatek.com>
 <1566995328-15158-10-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566995328-15158-10-git-send-email-henryc.chen@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Henry,

Please CC also the linux-pm@ list.

On 8/28/19 05:28, Henry Chen wrote:
> Introduce Mediatek MT8183 specific provider driver using the
> interconnect framework.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/interconnect/Kconfig            |   1 +
>  drivers/interconnect/Makefile           |   1 +
>  drivers/interconnect/mediatek/Kconfig   |  13 ++
>  drivers/interconnect/mediatek/Makefile  |   3 +
>  drivers/interconnect/mediatek/mtk-emi.c | 246 ++++++++++++++++++++++++++++++++
>  5 files changed, 264 insertions(+)
>  create mode 100644 drivers/interconnect/mediatek/Kconfig
>  create mode 100644 drivers/interconnect/mediatek/Makefile
>  create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
> 
[..]
> +
> +#define MT8183_MAX_LINKS	6

Looks like 1 is enough. Sorry for missing this in my earlier review.

> +
> +/**
> + * struct mtk_icc_node - Mediatek specific interconnect nodes
> + * @name: the node name used in debugfs
> + * @ep: true if the node is an end point.
> + * @id: a unique node identifier
> + * @links: an array of nodes where we can go next while traversing
> + * @num_links: the total number of @links
> + * @buswidth: width of the interconnect between a node and the bus
> + * @sum_avg: current sum aggregate value of all avg bw kBps requests
> + * @max_peak: current max aggregate value of all peak bw kBps requests
> + */
> +struct mtk_icc_node {
> +	unsigned char *name;
> +	bool ep;
> +	u16 id;
> +	u16 links[MT8183_MAX_LINKS];
> +	u16 num_links;
> +	u16 buswidth;
> +	u64 sum_avg;
> +	u64 max_peak;
> +};
> +
> +struct mtk_icc_desc {
> +	struct mtk_icc_node **nodes;
> +	size_t num_nodes;
> +};
> +
> +#define DEFINE_MNODE(_name, _id, _buswidth, _ep, ...)	\
> +		static struct mtk_icc_node _name = {			\
> +		.name = #_name,						\
> +		.id = _id,						\
> +		.buswidth = _buswidth,					\
> +		.ep = _ep,						\
> +		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
> +}
> +
> +DEFINE_MNODE(ddr_emi, SLAVE_DDR_EMI, 1024, 1, 0);
> +DEFINE_MNODE(mcusys, MASTER_MCUSYS, 256, 0, SLAVE_DDR_EMI);
> +DEFINE_MNODE(gpu, MASTER_GPUSYS, 256, 0, SLAVE_DDR_EMI);
> +DEFINE_MNODE(mmsys, MASTER_MMSYS, 256, 0, SLAVE_DDR_EMI);
> +DEFINE_MNODE(mm_vpu, MASTER_MM_VPU, 128, 0, MASTER_MMSYS);
> +DEFINE_MNODE(mm_disp, MASTER_MM_DISP, 128, 0, MASTER_MMSYS);
> +DEFINE_MNODE(mm_vdec, MASTER_MM_VDEC, 128, 0, MASTER_MMSYS);
> +DEFINE_MNODE(mm_venc, MASTER_MM_VENC, 128, 0, MASTER_MMSYS);
> +DEFINE_MNODE(mm_cam, MASTER_MM_CAM, 128, 0, MASTER_MMSYS);
> +DEFINE_MNODE(mm_img, MASTER_MM_IMG, 128, 0, MASTER_MMSYS);
> +DEFINE_MNODE(mm_mdp, MASTER_MM_MDP, 128, 0, MASTER_MMSYS);
> +
[..]

> +static int emi_icc_aggregate(struct icc_node *node, u32 avg_bw,
> +			      u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
> +{

The prototype of this function has changed meanwhile, so you might want to update.

[..]
> +static int emi_icc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	const struct mtk_icc_desc *desc;
> +	struct icc_node *node;
> +	struct icc_onecell_data *data;
> +	struct icc_provider *provider;
> +	struct mtk_icc_node **mnodes;
> +	size_t num_nodes, i, j;
> +
> +	desc = of_device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	mnodes = desc->nodes;
> +	num_nodes = desc->num_nodes;
> +
> +	provider = devm_kzalloc(&pdev->dev, sizeof(*provider), GFP_KERNEL);
> +	if (!provider)
> +		return -ENOMEM;
> +
> +	data = devm_kcalloc(&pdev->dev, num_nodes, sizeof(*node), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	provider->dev = &pdev->dev;
> +	provider->set = emi_icc_set;
> +	provider->aggregate = emi_icc_aggregate;
> +	provider->xlate = of_icc_xlate_onecell;
> +	INIT_LIST_HEAD(&provider->nodes);
> +	provider->data = data;
> +
> +	ret = icc_provider_add(provider);
> +	if (ret) {
> +		dev_err(&pdev->dev, "error adding interconnect provider\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num_nodes; i++) {
> +		node = icc_node_create(mnodes[i]->id);
> +		if (IS_ERR(node)) {
> +			ret = PTR_ERR(node);
> +			goto err;
> +		}
> +
> +		node->name = mnodes[i]->name;
> +		node->data = mnodes[i];
> +		icc_node_add(node, provider);
> +
> +		dev_dbg(&pdev->dev, "registered node %s, num link: %d\n",
> +			mnodes[i]->name, mnodes[i]->num_links);
> +
> +		/* populate links */
> +		for (j = 0; j < mnodes[i]->num_links; j++)
> +			icc_link_create(node, mnodes[i]->links[j]);
> +
> +		data->nodes[i] = node;
> +	}
> +	data->num_nodes = num_nodes;
> +
> +	platform_set_drvdata(pdev, provider);
> +
> +	return 0;
> +err:
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		icc_node_del(node);
> +		icc_node_destroy(node->id);
> +	}
> +
> +	icc_provider_del(provider);

You can just call emi_icc_remove() instead of the above.

Thanks,
Georgi

> +	return ret;
> +}
> +
> +static int emi_icc_remove(struct platform_device *pdev)
> +{
> +	struct icc_provider *provider = platform_get_drvdata(pdev);
> +	struct icc_node *n;
> +
> +	list_for_each_entry(n, &provider->nodes, node_list) {
> +		icc_node_del(n);
> +		icc_node_destroy(n->id);
> +	}
> +
> +	return icc_provider_del(provider);
> +}
