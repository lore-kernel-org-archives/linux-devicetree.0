From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v4 06/12] soc: mediatek: cmdq: support mt8183 gce function
Date: Mon, 22 Apr 2019 11:53:06 +0800
Message-ID: <1555905186.25149.1.camel@mtksdaap41>
References: <20190415125833.38704-1-bibby.hsieh@mediatek.com>
 <20190415125833.38704-7-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190415125833.38704-7-bibby.hsieh@mediatek.com>
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

On Mon, 2019-04-15 at 20:58 +0800, Bibby Hsieh wrote:
> add mt8183 compatible name for supporting gce function

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 87617dc7504d..6db1e2dd2dea 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -538,6 +538,7 @@ static const struct dev_pm_ops cmdq_pm_ops = {
>  
>  static const struct of_device_id cmdq_of_ids[] = {
>  	{.compatible = "mediatek,mt8173-gce", .data = (void *)16},
> +	{.compatible = "mediatek,mt8183-gce", .data = (void *)24},
>  	{}
>  };
>  
