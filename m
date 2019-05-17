From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v6 10/12] soc: mediatek: cmdq: add cmdq_dev_get_subsys
 function
Date: Fri, 17 May 2019 09:43:30 +0800
Message-ID: <1558057410.14401.7.camel@mtksdaap41>
References: <20190516090224.59070-1-bibby.hsieh@mediatek.com>
 <20190516090224.59070-11-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190516090224.59070-11-bibby.hsieh@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Houlong Wei <houlong.wei@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Dennis-YC Hsieh <dennis-yc.hsimediatek/mtkcam/drv/fdvt/4.0/cam_fdvt_v4l2.cppeh@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Bibby:

On Thu, 2019-05-16 at 17:02 +0800, Bibby Hsieh wrote:
> GCE cannot know the register base address, this function
> can help cmdq client to get the relationship of subsys
> and register base address.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 25 +++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-cmdq.h  | 18 ++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index a53cdd71cfc2..a64060a34e01 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -27,6 +27,31 @@ struct cmdq_instruction {
>  	u8 op;
>  };
>  
> +struct cmdq_subsys *cmdq_dev_get_subsys(struct device *dev, int idx)
> +{
> +	struct cmdq_subsys *subsys;
> +	struct of_phandle_args spec;
> +
> +	subsys = devm_kzalloc(dev, sizeof(*subsys), GFP_KERNEL);
> +	if (!subsys)
> +		return NULL;
> +
> +	if (of_parse_phandle_with_args(dev->of_node, "mediatek,gce-client-reg",
> +				       "#subsys-cells", idx, &spec)) {
> +		dev_err(dev, "can't parse gce-client-reg property");

print the idx info.

> +

I think you should free the buffer you allocate. Don't expect this
function is called in caller's probe function.

> +		return (struct cmdq_subsys *)-ENODEV;

Why not return NULL?

> +	}
> +
> +	subsys->id = spec.args[0];
> +	subsys->offset = spec.args[1];
> +	subsys->size = spec.args[2];
> +	of_node_put(spec.np);
> +
> +	return subsys;
> +}
> +EXPORT_SYMBOL(cmdq_dev_get_subsys);
> +
>  static void cmdq_client_timeout(struct timer_list *t)
>  {
>  	struct cmdq_client *client = from_timer(client, t, timer);
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 0651a0bffa54..574006c5cd76 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -15,6 +15,12 @@
>  
>  struct cmdq_pkt;
>  
> +struct cmdq_subsys {

May be cmdq_client_reg.

> +	u8 id;

May be subsys.

Regards,
CK

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
> + * cmdq_dev_get_subsys() - parse sub system from the device node of CMDQ client
> + * @dev:	device of CMDQ mailbox client
> + * @idx:	the index of desired subsys
> + *
> + * Return: CMDQ subsys pointer
> + *
> + * Help CMDQ client pasing the sub system number
> + * from the device node of CMDQ client.
> + */
> +struct cmdq_subsys *cmdq_dev_get_subsys(struct device *dev, int idx);
> +
>  #endif	/* __MTK_CMDQ_H__ */
