From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 11/12] soc: mediatek: cmdq: add
 cmdq_dev_get_client_reg function
Date: Tue, 21 May 2019 11:30:25 +0800
Message-ID: <1558409425.25526.13.camel@mtksdaap41>
References: <20190521011108.40428-1-bibby.hsieh@mediatek.com>
         <20190521011108.40428-12-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521011108.40428-12-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, 2019-05-21 at 09:11 +0800, Bibby Hsieh wrote:
> GCE cannot know the register base address, this function
> can help cmdq client to get the cmdq_client_reg structure.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 25 +++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  | 18 ++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 70ad4d806fac..815845bb5982 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -27,6 +27,31 @@ struct cmdq_instruction {
>  	u8 op;
>  };
>  
> +struct cmdq_client_reg  *cmdq_dev_get_client_reg(struct device *dev, int idx)
> +{
> +	struct cmdq_client_reg *client_reg;
> +	struct of_phandle_args spec;
> +
> +	client_reg  = devm_kzalloc(dev, sizeof(*client_reg), GFP_KERNEL);
> +	if (!client_reg)
> +		return NULL;
> +
> +	if (of_parse_phandle_with_args(dev->of_node, "mediatek,gce-client-reg",
> +				       "#subsys-cells", idx, &spec)) {
> +		dev_err(dev, "can't parse gce-client-reg property (%d)", idx);

I think you should call devm_kfree(client_reg) here because this
function may not be called in client driver's probe function. But in
another view point, I would like you to move the memory allocation out
of this function. When client call cmdq_dev_get_client_reg() to get a
pointer, it's easy that client does not free it because you does not
provide free API, Some client may embed struct cmdq_client_reg with its
client structure together,

struct client {
	struct cmdq_client_reg client_reg;
};

Because each client may have different memory allocation strategy, so I
would like you to move memory allocation out of this function to let
client driver have the flexibility.

Regards,
CK

> +
> +		return NULL;
> +	}
> +
> +	client_reg->subsys = spec.args[0];
> +	client_reg->offset = spec.args[1];
> +	client_reg->size = spec.args[2];
> +	of_node_put(spec.np);
> +
> +	return client_reg;
> +}
> +EXPORT_SYMBOL(cmdq_dev_get_client_reg);
> +
>  static void cmdq_client_timeout(struct timer_list *t)
>  {
>  	struct cmdq_client *client = from_timer(client, t, timer);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index a345870a6d10..d0dea3780f7a 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -15,6 +15,12 @@
>  
>  struct cmdq_pkt;
>  
> +struct cmdq_client_reg {
> +	u8 subsys;
> +	u16 offset;
> +	u16 size;
> +};
> +
>  struct cmdq_client {
>  	spinlock_t lock;
>  	u32 pkt_cnt;
> @@ -142,4 +148,16 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>   */
>  int cmdq_pkt_flush(struct cmdq_pkt *pkt);
>  
> +/**
> + * cmdq_dev_get_client_reg() - parse cmdq client reg from the device node of CMDQ client
> + * @dev:	device of CMDQ mailbox client
> + * @idx:	the index of desired reg
> + *
> + * Return: CMDQ client reg pointer
> + *
> + * Help CMDQ client pasing the cmdq client reg
> + * from the device node of CMDQ client.
> + */
> +struct cmdq_client_reg  *cmdq_dev_get_client_reg(struct device *dev, int idx);
> +
>  #endif	/* __MTK_CMDQ_H__ */
