From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH 06/10] soc: mediatek: add register device function
Date: Wed, 30 Jan 2019 14:00:28 +0800
Message-ID: <69c8ff46-c34c-c000-631c-a6ea8b4364c7@chromium.org>
References: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
 <1548747128-60136-7-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548747128-60136-7-git-send-email-bibby.hsieh@mediatek.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, kendrick.hsu@mediatek.com, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Frederic Chen <Frederic.Chen@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 01/29/2019 03:32 PM, Bibby Hsieh wrote:
> GCE cannot know the register base address, we store the subsys-base address
> relationship in the device node, and store the relationship by
> cmdq_register_device function.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 24 ++++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 6e4b85e..6ad997f 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -32,6 +32,30 @@ u8 cmdq_subsys_base_to_id(struct cmdq_base *clt_base, u32 base)
>   }
>   EXPORT_SYMBOL(cmdq_subsys_base_to_id);
>   
> +struct cmdq_base *cmdq_register_device(struct device *dev)
> +{
> +	struct cmdq_base *clt_base;
> +	struct of_phandle_args spec;
> +	u32 idx;
> +
> +	clt_base = devm_kzalloc(dev, sizeof(*clt_base), GFP_KERNEL);
> +	if (!clt_base)
> +		return NULL;
> +
> +	/* parse subsys */
> +	for (idx = 0; idx < ARRAY_SIZE(clt_base->subsys); idx++) {
> +		if (of_parse_phandle_with_args(dev->of_node, "gce-subsys",
> +		    "#gce-subsys-cells", idx, &spec))

nit: Should have more indention for the line above. (Align with the
dev->of_node?)

> +			break;
> +		clt_base->subsys[idx].base = spec.args[0];
> +		clt_base->subsys[idx].id = spec.args[1];
> +	}
> +	clt_base->count = idx;
> +
> +	return clt_base;
> +}
> +EXPORT_SYMBOL(cmdq_register_device);
> +
>   static void cmdq_client_timeout(struct timer_list *t)
>   {
>   	struct cmdq_client *client = from_timer(client, t, timer);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 0c7a6ee..a1f5eb6 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -138,5 +138,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>   int cmdq_pkt_flush(struct cmdq_pkt *pkt);
>   
>   u8 cmdq_subsys_base_to_id(struct cmdq_base *clt_base, u32 base);
> +struct cmdq_base *cmdq_register_device(struct device *dev);
>   
>   #endif	/* __MTK_CMDQ_H__ */
> 
