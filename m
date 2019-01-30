From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH 03/10] soc: mediatek: move the CMDQ_IRQ_MASK into cmdq
 driver data
Date: Wed, 30 Jan 2019 13:59:19 +0800
Message-ID: <e5cffd3f-5b65-b3f3-80d8-b0567bd4baf3@chromium.org>
References: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
 <1548747128-60136-4-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548747128-60136-4-git-send-email-bibby.hsieh@mediatek.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, kendrick.hsu@mediatek.com, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Frederic Chen <Frederic.Chen@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 01/29/2019 03:32 PM, Bibby Hsieh wrote:
> The interrupt mask and thread number has positive correlation,
> so we move the CMDQ_IRQ_MASK into cmdq driver data and calculate
> it by thread number.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c 
b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 909eb23..f6174ca 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -17,7 +17,6 @@
>   #include <linux/of_device.h>
>
>   #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
> -#define CMDQ_IRQ_MASK			0xffff
>   #define CMDQ_NUM_CMD(t)			(t->cmd_buf_size / CMDQ_INST_SIZE)
>
>   #define CMDQ_CURR_IRQ_STATUS		0x10
> @@ -71,6 +70,7 @@ struct cmdq {
>   	void __iomem		*base;
>   	u32			irq;
>   	u32			thread_nr;
> +	u32			irq_mask;
>   	struct cmdq_thread	*thread;
>   	struct clk		*clock;
>   	bool			suspended;
> @@ -284,11 +284,11 @@ static irqreturn_t cmdq_irq_handler(int irq, 
void *dev)
>   	unsigned long irq_status, flags = 0L;
>   	int bit;
>
> -	irq_status = readl(cmdq->base + CMDQ_CURR_IRQ_STATUS) & CMDQ_IRQ_MASK;
> -	if (!(irq_status ^ CMDQ_IRQ_MASK))
> +	irq_status = readl(cmdq->base + CMDQ_CURR_IRQ_STATUS) & cmdq->irq_mask;
> +	if (!(irq_status ^ cmdq->irq_mask))
>   		return IRQ_NONE;
>
> -	for_each_clear_bit(bit, &irq_status, fls(CMDQ_IRQ_MASK)) {
> +	for_each_clear_bit(bit, &irq_status, fls(cmdq->irq_mask)) {
>   		struct cmdq_thread *thread = &cmdq->thread[bit];
>
>   		spin_lock_irqsave(&thread->chan->lock, flags);
> @@ -472,6 +472,9 @@ static int cmdq_probe(struct platform_device *pdev)
>   		dev_err(dev, "failed to get irq\n");
>   		return -EINVAL;
>   	}
> +
> +	cmdq->thread_nr = (u32)(unsigned long)of_device_get_match_data(dev);
> +	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>   	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
>   			       "mtk_cmdq", cmdq);
>   	if (err < 0) {
> @@ -489,6 +492,7 @@ static int cmdq_probe(struct platform_device *pdev)
>   	}
>
>   	cmdq->thread_nr = (u32)(unsigned long)of_device_get_match_data(dev);
> +	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);

The cmdq->thread_nr and cmdq->irq_mask are already set above, so these 
two lines can be removed.

>   	cmdq->mbox.dev = dev;
>   	cmdq->mbox.chans = devm_kcalloc(dev, cmdq->thread_nr,
>   					sizeof(*cmdq->mbox.chans), GFP_KERNEL);
>
