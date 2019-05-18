From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/4] iio: adc: mediatek: SET_LATE_SYSTEM_SLEEP_PM_OPS
 support
Date: Sat, 18 May 2019 11:35:27 +0100
Message-ID: <20190518113527.5210b0bf@archlinux>
References: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
        <1557994247-16739-4-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557994247-16739-4-git-send-email-chun-hung.wu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com, jg_poxu@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 16 May 2019 16:10:46 +0800
Chun-Hung Wu <chun-hung.wu@mediatek.com> wrote:

>   Move suspend/resume to late_suspend and
> early_resume to gurantee users can use auxadc
guarantee

> driver at suspend/resume stage.
No problem with the patch content, but we need a reason why they may
want to do so?

Thanks,

Jonathan
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/iio/adc/mt6577_auxadc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index e1bdcc0..58d7cb2 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -326,9 +326,10 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(mt6577_auxadc_pm_ops,
> -			 mt6577_auxadc_suspend,
> -			 mt6577_auxadc_resume);
> +static const struct dev_pm_ops mt6577_auxadc_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(mt6577_auxadc_suspend,
> +				     mt6577_auxadc_resume)
> +};
>  
>  static const struct of_device_id mt6577_auxadc_of_match[] = {
>  	{ .compatible = "mediatek,mt2701-auxadc", .data = &mt8173_compat},
