From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [RESEND, PATCH v13 04/12] mailbox: mediatek: cmdq: move the
 CMDQ_IRQ_MASK into cmdq driver data
Date: Fri, 23 Aug 2019 13:32:54 +0200
Message-ID: <7e282a0e-6366-0cb5-29af-5fef4278d17c@gmail.com>
References: <20190820084932.22282-1-bibby.hsieh@mediatek.com>
 <20190820084932.22282-5-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820084932.22282-5-bibby.hsieh@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org



On 20/08/2019 10:49, Bibby Hsieh wrote:
> The interrupt mask and thread number has positive correlation,
> so we move the CMDQ_IRQ_MASK into cmdq driver data and calculate
> it by thread number.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 00d5219094e5..8fddd26288e8 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -18,7 +18,6 @@
>  #include <linux/of_device.h>
>  
>  #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
> -#define CMDQ_IRQ_MASK			0xffff
>  #define CMDQ_NUM_CMD(t)			(t->cmd_buf_size / CMDQ_INST_SIZE)
>  
>  #define CMDQ_CURR_IRQ_STATUS		0x10
> @@ -72,6 +71,7 @@ struct cmdq {
>  	void __iomem		*base;
>  	u32			irq;
>  	u32			thread_nr;
> +	u32			irq_mask;
>  	struct cmdq_thread	*thread;
>  	struct clk		*clock;
>  	bool			suspended;
> @@ -285,11 +285,11 @@ static irqreturn_t cmdq_irq_handler(int irq, void *dev)
>  	unsigned long irq_status, flags = 0L;
>  	int bit;
>  
> -	irq_status = readl(cmdq->base + CMDQ_CURR_IRQ_STATUS) & CMDQ_IRQ_MASK;
> -	if (!(irq_status ^ CMDQ_IRQ_MASK))
> +	irq_status = readl(cmdq->base + CMDQ_CURR_IRQ_STATUS) & cmdq->irq_mask;
> +	if (!(irq_status ^ cmdq->irq_mask))
>  		return IRQ_NONE;
>  
> -	for_each_clear_bit(bit, &irq_status, fls(CMDQ_IRQ_MASK)) {
> +	for_each_clear_bit(bit, &irq_status, cmdq->thread_nr) {
>  		struct cmdq_thread *thread = &cmdq->thread[bit];
>  
>  		spin_lock_irqsave(&thread->chan->lock, flags);
> @@ -473,6 +473,9 @@ static int cmdq_probe(struct platform_device *pdev)
>  		dev_err(dev, "failed to get irq\n");
>  		return -EINVAL;
>  	}
> +
> +	cmdq->thread_nr = (u32)(unsigned long)of_device_get_match_data(dev);
> +	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>  	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
>  			       "mtk_cmdq", cmdq);
>  	if (err < 0) {
> @@ -489,7 +492,6 @@ static int cmdq_probe(struct platform_device *pdev)
>  		return PTR_ERR(cmdq->clock);
>  	}
>  
> -	cmdq->thread_nr = (u32)(unsigned long)of_device_get_match_data(dev);
>  	cmdq->mbox.dev = dev;
>  	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->thread_nr,
>  					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
> 
