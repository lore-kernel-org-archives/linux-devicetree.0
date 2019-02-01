From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 06/10] soc: mediatek: add register device function
Date: Fri, 1 Feb 2019 09:31:10 +0800
Message-ID: <1548984670.7501.2.camel@mtksdaap41>
References: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
 <1548747128-60136-7-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548747128-60136-7-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, kendrick.hsu@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Frederic Chen <Frederic.Chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Bibby:

On Tue, 2019-01-29 at 15:32 +0800, Bibby Hsieh wrote:
> GCE cannot know the register base address, we store the subsys-base address
> relationship in the device node, and store the relationship by
> cmdq_register_device function.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 24 ++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 6e4b85e..6ad997f 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -32,6 +32,30 @@ u8 cmdq_subsys_base_to_id(struct cmdq_base *clt_base, u32 base)
>  }
>  EXPORT_SYMBOL(cmdq_subsys_base_to_id);
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
> +			break;
> +		clt_base->subsys[idx].base = spec.args[0];
> +		clt_base->subsys[idx].id = spec.args[1];

This does not match the binding [1].

[1]
https://www.kernel.org/doc/Documentation/devicetree/bindings/mailbox/mtk-gce.txt

Regards,
CK

> +	}
> +	clt_base->count = idx;
> +
> +	return clt_base;
> +}
> +EXPORT_SYMBOL(cmdq_register_device);
> +
>  static void cmdq_client_timeout(struct timer_list *t)
>  {
>  	struct cmdq_client *client = from_timer(client, t, timer);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 0c7a6ee..a1f5eb6 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -138,5 +138,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>  int cmdq_pkt_flush(struct cmdq_pkt *pkt);
>  
>  u8 cmdq_subsys_base_to_id(struct cmdq_base *clt_base, u32 base);
> +struct cmdq_base *cmdq_register_device(struct device *dev);
>  
>  #endif	/* __MTK_CMDQ_H__ */
