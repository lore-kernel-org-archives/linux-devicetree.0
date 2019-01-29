From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 04/10] soc: mediatek: clear the event in cmdq initial
 flow
Date: Tue, 29 Jan 2019 17:29:50 +0800
Message-ID: <1548754190.11055.7.camel@mtksdaap41>
References: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
         <1548747128-60136-5-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548747128-60136-5-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Bibby:

On Tue, 2019-01-29 at 15:32 +0800, Bibby Hsieh wrote:
> GCE hardware stored event information in own internal sysram,
> if the initial value in those sysram is not zero value
> it will cause a situation that gce can wait the event immediately
> after client ask gce to wait event but not really trigger the
> corresponding hardware.
> 
> In order to make sure that the wait event function is
> exactly correct, we need to clear the sysram value in
> cmdq initial flow.

If MT8173 has the same problem, add a fix tag.

Regards,
CK

> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 5 +++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 2 ++
>  include/linux/soc/mediatek/mtk-cmdq.h    | 3 ---
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index f6174ca..2b5febd 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -33,6 +33,7 @@
>  #define CMDQ_THR_END_ADDR		0x24
>  #define CMDQ_THR_WAIT_TOKEN		0x30
>  #define CMDQ_THR_PRIORITY		0x40
> +#define CMDQ_SYNC_TOKEN_UPDATE		0x68
>  
>  #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
>  #define CMDQ_THR_ENABLED		0x1
> @@ -103,8 +104,12 @@ static void cmdq_thread_resume(struct cmdq_thread *thread)
>  
>  static void cmdq_init(struct cmdq *cmdq)
>  {
> +	int i;
> +
>  	WARN_ON(clk_enable(cmdq->clock) < 0);
>  	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
> +	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
> +		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
>  	clk_disable(cmdq->clock);
>  }
>  
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index ccb7342..911475da 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -19,6 +19,8 @@
>  #define CMDQ_WFE_UPDATE			BIT(31)
>  #define CMDQ_WFE_WAIT			BIT(15)
>  #define CMDQ_WFE_WAIT_VALUE		0x1
> +/** cmdq event maximum */
> +#define CMDQ_MAX_EVENT			0x3ff
>  
>  /*
>   * CMDQ_CODE_MASK:
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 54ade13..4e88999 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -13,9 +13,6 @@
>  
>  #define CMDQ_NO_TIMEOUT		0xffffffffu
>  
> -/** cmdq event maximum */
> -#define CMDQ_MAX_EVENT				0x3ff
> -
>  struct cmdq_pkt;
>  
>  struct cmdq_client {
