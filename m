From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [RESEND, PATCH v13 11/12] soc: mediatek: cmdq: add
 cmdq_dev_get_client_reg function
Date: Tue, 20 Aug 2019 17:47:13 +0800
Message-ID: <1566294433.24117.19.camel@mhfsdcap03>
References: <20190820084932.22282-1-bibby.hsieh@mediatek.com>
         <20190820084932.22282-12-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820084932.22282-12-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT
List-Id: devicetree@vger.kernel.org

On Tue, 2019-08-20 at 16:49 +0800, Bibby Hsieh wrote:
> GCE cannot know the register base address, this function
> can help cmdq client to get the cmdq_client_reg structure.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 29 ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  | 21 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index c53f8476c68d..80f75a1075b4 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -27,6 +27,35 @@ struct cmdq_instruction {
>  	u8 op;
>  };
>  
> +int cmdq_dev_get_client_reg(struct device *dev,
> +			    struct cmdq_client_reg *client_reg, int idx)
> +{
> +	struct of_phandle_args spec;
> +	int err;
> +
> +	if (!client_reg)
> +		return -ENOENT;
> +
> +	err = of_parse_phandle_with_fixed_args(dev->of_node,
> +					       "mediatek,gce-client-reg",
> +					       3, idx, &spec);
> +	if (err < 0) {
> +		dev_err(dev,
> +			"error %d can't parse gce-client-reg property (%d)",
> +			err, idx);
> +
> +		return err;
> +	}
> +
> +	client_reg->subsys = (u8)spec.args[0];
> +	client_reg->offset = (u16)spec.args[1];
> +	client_reg->size = (u16)spec.args[2];
> +	of_node_put(spec.np);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(cmdq_dev_get_client_reg);
> +
>  static void cmdq_client_timeout(struct timer_list *t)
>  {
>  	struct cmdq_client *client = from_timer(client, t, timer);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index a345870a6d10..02ddd60b212f 100644
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
> @@ -24,6 +30,21 @@ struct cmdq_client {
>  	u32 timeout_ms; /* in unit of microsecond */
>  };
>  
> +/**
> + * cmdq_dev_get_client_reg() - parse cmdq client reg from the device
> + *			       node of CMDQ client
> + * @dev:	device of CMDQ mailbox client
> + * @client_reg: CMDQ client reg pointer
> + * @idx:	the index of desired reg
> + *
> + * Return: 0 for success; else the error code is returned
> + *
> + * Help CMDQ client parsing the cmdq client reg
> + * from the device node of CMDQ client.
> + */
> +int cmdq_dev_get_client_reg(struct device *dev,
> +			    struct cmdq_client_reg *client_reg, int idx);
> +
>  /**
>   * cmdq_mbox_create() - create CMDQ mailbox client and channel
>   * @dev:	device of CMDQ mailbox client

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
