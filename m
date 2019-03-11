From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 1/9] mfd: mt6397: clean up code
Date: Mon, 11 Mar 2019 12:01:52 -0700
Message-ID: <CAGp9Lzo77XsggYZuhoTO20rh68PQrET1CSVB3GO4fpBzgWKPEw@mail.gmail.com>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1552275991-34648-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552275991-34648-2-git-send-email-hsin-hsiung.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream <srv_heupstream@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Marc Zyngier <marc.zyngier@arm.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Mar 10, 2019 at 8:48 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> clean up code
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 77b64bd..acb9812 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -18,17 +18,17 @@
>  #include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/core.h>
> -#include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/core.h>
> -#include <linux/mfd/mt6397/registers.h>
> +#include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6397/registers.h>
>
>  #define MT6397_RTC_BASE                0xe000
>  #define MT6397_RTC_SIZE                0x3e
>
> -#define MT6323_CID_CODE                0x23
> -#define MT6391_CID_CODE                0x91
> -#define MT6397_CID_CODE                0x97
> +#define MT6323_CHIP_ID         0x23
> +#define MT6391_CHIP_ID         0x91
> +#define MT6397_CHIP_ID         0x97
>

It would be not necessary to simply rename the definition or do you
have a strong reason to do that?

>  static const struct resource mt6397_rtc_resources[] = {
>         {
> @@ -298,7 +298,7 @@ static int mt6397_probe(struct platform_device *pdev)
>                 return pmic->irq;
>
>         switch (id & 0xff) {
> -       case MT6323_CID_CODE:
> +       case MT6323_CHIP_ID:
>                 pmic->int_con[0] = MT6323_INT_CON0;
>                 pmic->int_con[1] = MT6323_INT_CON1;
>                 pmic->int_status[0] = MT6323_INT_STATUS0;
> @@ -312,8 +312,8 @@ static int mt6397_probe(struct platform_device *pdev)
>                                            0, pmic->irq_domain);
>                 break;
>
> -       case MT6397_CID_CODE:
> -       case MT6391_CID_CODE:
> +       case MT6391_CHIP_ID:
> +       case MT6397_CHIP_ID:
>                 pmic->int_con[0] = MT6397_INT_CON0;
>                 pmic->int_con[1] = MT6397_INT_CON1;
>                 pmic->int_status[0] = MT6397_INT_STATUS0;
> --
> 1.9.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
