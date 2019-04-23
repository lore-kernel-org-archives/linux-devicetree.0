From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
Subject: Re: [PATCH v4 09/12] soc: mediatek: cmdq: add polling function
Date: Tue, 23 Apr 2019 23:25:02 +0800
Message-ID: <1556033102.20906.4.camel@mtkswgap22>
References: <20190415125833.38704-1-bibby.hsieh@mediatek.com>
         <20190415125833.38704-10-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415125833.38704-10-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@m>
List-Id: devicetree@vger.kernel.org

Hi Bibby,


On Mon, 2019-04-15 at 20:58 +0800, Bibby Hsieh wrote:
> add polling function in cmdq helper functions
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c   | 30 ++++++++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  include/linux/soc/mediatek/mtk-cmdq.h    | 15 ++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index d3873ab21db3..80856b8c2385 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -231,6 +231,36 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_clear_event);
>  
> +int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
> +		  u16 offset, u32 value, u32 mask)
> +{
> +	int err;
> +
> +	if (mask != 0xffffffff) {
> +		err = cmdq_pkt_append_command(pkt, CMDQ_GET_ARG_C(~mask),
> +					      CMDQ_GET_ARG_B(~mask),
> +					      CMDQ_IMMEDIATE_VALUE,
> +					      CMDQ_IMMEDIATE_VALUE,
> +					      CMDQ_IMMEDIATE_VALUE,
> +					      CMDQ_IMMEDIATE_VALUE,
> +					      CMDQ_IMMEDIATE_VALUE,
> +					      CMDQ_CODE_MASK);
> +
> +		if (err != 0)
> +			return err;
> +	}
> +	offset = offset | 0x1;

Does this "or" operation make gce use mask? If it does, maybe it should
move into brace?


Regards,
Dennis

> +
> +	return cmdq_pkt_append_command(pkt, CMDQ_GET_ARG_C(value),
> +				       CMDQ_GET_ARG_B(value),
> +				       offset, subsys,
> +				       CMDQ_IMMEDIATE_VALUE,
> +				       CMDQ_IMMEDIATE_VALUE,
> +				       CMDQ_IMMEDIATE_VALUE,
> +				       CMDQ_CODE_POLL);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_poll);
> +
>  static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  {
>  	int err;
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index f21801d32a3a..1dfd5ed5c8c5 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -46,6 +46,7 @@
>  enum cmdq_code {
>  	CMDQ_CODE_MASK = 0x02,
>  	CMDQ_CODE_WRITE = 0x04,
> +	CMDQ_CODE_POLL = 0x08,
>  	CMDQ_CODE_JUMP = 0x10,
>  	CMDQ_CODE_WFE = 0x20,
>  	CMDQ_CODE_EOC = 0x40,
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 52f69c8db8de..0651a0bffa54 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -99,6 +99,21 @@ int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event);
>   */
>  int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event);
>  
> +/**
> + * cmdq_pkt_poll() - Append polling command to the CMDQ packet, ask GCE to
> + *		     execute an instruction that wait for a specified hardware
> + *		     register to check for the value. All GCE hardware
> + *		     threads will be blocked by this instruction.
> + * @pkt:	the CMDQ packet
> + * @subsys:	the CMDQ sub system code
> + * @offset:	register offset from CMDQ sub system
> + * @value:	the specified target register value
> + * @mask:	the specified target register mask
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
> +		  u16 offset, u32 value, u32 mask);
>  /**
>   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
>   *                          packet and call back at the end of done packet
