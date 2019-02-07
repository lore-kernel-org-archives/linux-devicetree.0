From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 3/3] reset: hisilicon: Add HiSilicon HI3670 reset support
Date: Thu, 07 Feb 2019 11:41:42 +0100
Message-ID: <1549536102.4557.10.camel@pengutronix.de>
References: <20190201153841.21903-1-manivannan.sadhasivam@linaro.org>
         <20190201153841.21903-4-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201153841.21903-4-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-02-01 at 21:08 +0530, Manivannan Sadhasivam wrote:
> HI3670 SoC is architecturally same as the HI3660 SoC. Hence, add the
> HI3670 compatible to HI3660 reset driver in order to reuse it.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/reset/hisilicon/reset-hi3660.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/hisilicon/reset-hi3660.c b/drivers/reset/hisilicon/reset-hi3660.c
> index 17d8bb128e6e..1c22f3457ba7 100644
> --- a/drivers/reset/hisilicon/reset-hi3660.c
> +++ b/drivers/reset/hisilicon/reset-hi3660.c
> @@ -103,6 +103,7 @@ static int hi3660_reset_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id hi3660_reset_match[] = {
>  	{ .compatible = "hisilicon,hi3660-reset", },
> +	{ .compatible = "hisilicon,hi3670-reset", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, hi3660_reset_match);

If the HI3670 device tree contained the hisilicon,hi3660-reset
compatible as well, this change would not be necessary.

regards
Philipp
