Return-Path: <devicetree-owner@vger.kernel.org>
Received: from nasmtp02.atmel.com ([204.2.163.16]:30575 "EHLO
	nasmtp02.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753630Ab3HWD62 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 23:58:28 -0400
Message-ID: <5216DCB0.7050909@atmel.com>
Date: Fri, 23 Aug 2013 11:53:20 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
Subject: Re: [PATCH -next] mtd: atmel_nand: fix error return code in atmel_nand_probe()
References: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
In-Reply-To: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, artem.bityutskiy@linux.intel.com, plagnioj@jcrosoft.com, jg1.han@samsung.com, yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 8/23/2013 10:50 AM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Thank you for catch this. And
Acked-by: Josh Wu <josh.wu@atmel.com>

> ---
>   drivers/mtd/nand/atmel_nand.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 65b302c..093bcf8 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2047,6 +2047,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
>   		irq = platform_get_irq(pdev, 0);
>   		if (irq < 0) {
>   			dev_err(host->dev, "Cannot get HSMC irq!\n");
> +			res = irq;
>   			goto err_nand_ioremap;
>   		}
>   
>

