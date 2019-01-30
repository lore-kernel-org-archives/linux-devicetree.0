From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH 07/10] soc: mediatek: add cmdq_dev_get_event function
Date: Wed, 30 Jan 2019 14:00:54 +0800
Message-ID: <4d6f8e17-58d7-2986-29b0-3e0134836929@chromium.org>
References: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
 <1548747128-60136-8-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548747128-60136-8-git-send-email-bibby.hsieh@mediatek.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, kendrick.hsu@mediatek.com, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Frederic Chen <Frederic.Chen@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 01/29/2019 03:32 PM, Bibby Hsieh wrote:
> When client ask gce to clear or wait for event,
> client need to pass event number to the API.
> We suggest client store the event information in device node,
> so we provide an API for client parse the event property.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 29 +++++++++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 6ad997f..16c0393 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -56,6 +56,35 @@ struct cmdq_base *cmdq_register_device(struct device *dev)
>   }
>   EXPORT_SYMBOL(cmdq_register_device);
>   
> +s32 cmdq_dev_get_event(struct device *dev, const char *name)
> +{
> +	s32 index = 0;
> +	struct of_phandle_args spec;
> +	s32 result;
> +
> +	if (!dev)
> +		return -EINVAL;
> +
> +	index = of_property_match_string(dev->of_node, "gce-event-names", name);
> +	if (index < 0) {
> +		dev_err(dev, "no gce-event-names property or no such event:%s",
> +			name);
> +		return index;
> +	}
> +
> +	if (of_parse_phandle_with_args(dev->of_node, "gce-events",
> +	    "#gce-event-cells", index, &spec)) {

nit: Should have more indention for the line above. (Align with the
dev->of_node?)

> +		dev_err(dev, "can't parse gce-events property");
> +		return -ENODEV;
> +	}
> +
> +	result = spec.args[0];
> +	of_node_put(spec.np);
> +
> +	return result;
> +}
> +EXPORT_SYMBOL(cmdq_dev_get_event);
> +
>   static void cmdq_client_timeout(struct timer_list *t)
>   {
>   	struct cmdq_client *client = from_timer(client, t, timer);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index a1f5eb6..e5b0a98 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -139,5 +139,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>   
>   u8 cmdq_subsys_base_to_id(struct cmdq_base *clt_base, u32 base);
>   struct cmdq_base *cmdq_register_device(struct device *dev);
> +s32 cmdq_dev_get_event(struct device *dev, const char *name);
>   
>   #endif	/* __MTK_CMDQ_H__ */
> 
