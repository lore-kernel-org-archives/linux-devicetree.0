From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 10/25] mtd: nand: qcom: reorganize nand devices probing
Date: Wed, 2 Aug 2017 13:51:45 +0530
Message-ID: <772b9720-cd17-0897-4ee1-836abb748f34@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-11-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500464893-11352-11-git-send-email-absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 07/19/2017 05:17 PM, Abhishek Sahu wrote:
> This is reorganization of exiting code and will not change any
> functionality. The NAND controller supports multiple NAND device
> with different page size. The subsequent patch allocate memory
> which depends upon the maximum number of codewords so this patch
> reorganizes the NAND device probing. First the ONFI parameter
> page will be read from each connected device followed by MTD
> device registration.
> 

Modified the commit message slightly so that it's more clear.
Looks good otherwise.

"The NAND controller can support multiple NAND devices having different
page sizes. Future code will require us to allocate memory based on the
maximum number of codewords among all the devices. We reorganize the NAND
device probing such that the ONFI parameters are first read for each
connected device to identify the maximum number of codewords possible,
and only then proceed with MTD device registration (i.e, call nand_scan_tail
and mtd_device_register).

This is a reorganization of the existing code and will not change
any functionality."

Thanks,
Archit

> Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 88 +++++++++++++++++++++++++++++--------------
>   1 file changed, 59 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 7ecd0f8..8f9e86c 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2059,14 +2059,67 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
>   		return ret;
>   
>   	ret = qcom_nand_host_setup(host);
> -	if (ret)
> -		return ret;
> +
> +	return ret;
> +}
> +
> +static int qcom_nand_mtd_register(struct qcom_nand_controller *nandc,
> +				  struct qcom_nand_host *host,
> +				  struct device_node *dn)
> +{
> +	struct nand_chip *chip = &host->chip;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int ret;
>   
>   	ret = nand_scan_tail(mtd);
>   	if (ret)
>   		return ret;
>   
> -	return mtd_device_register(mtd, NULL, 0);
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		nand_cleanup(mtd_to_nand(mtd));
> +
> +	return ret;
> +}
> +
> +static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
> +{
> +	struct device *dev = nandc->dev;
> +	struct device_node *dn = dev->of_node, *child;
> +	struct qcom_nand_host *host, *tmp;
> +	int ret;
> +
> +	for_each_available_child_of_node(dn, child) {
> +		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +		if (!host) {
> +			of_node_put(child);
> +			return -ENOMEM;
> +		}
> +
> +		ret = qcom_nand_host_init(nandc, host, child);
> +		if (ret) {
> +			devm_kfree(dev, host);
> +			continue;
> +		}
> +
> +		list_add_tail(&host->node, &nandc->host_list);
> +	}
> +
> +	if (list_empty(&nandc->host_list))
> +		return -ENODEV;
> +
> +	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
> +		ret = qcom_nand_mtd_register(nandc, host, child);
> +		if (ret) {
> +			list_del(&host->node);
> +			devm_kfree(dev, host);
> +		}
> +	}
> +
> +	if (list_empty(&nandc->host_list))
> +		return -ENODEV;
> +
> +	return 0;
>   }
>   
>   /* parse custom DT properties here */
> @@ -2094,10 +2147,8 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
>   static int qcom_nandc_probe(struct platform_device *pdev)
>   {
>   	struct qcom_nand_controller *nandc;
> -	struct qcom_nand_host *host;
>   	const void *dev_data;
>   	struct device *dev = &pdev->dev;
> -	struct device_node *dn = dev->of_node, *child;
>   	struct resource *res;
>   	int ret;
>   
> @@ -2151,33 +2202,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_setup;
>   
> -	for_each_available_child_of_node(dn, child) {
> -		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> -		if (!host) {
> -			of_node_put(child);
> -			ret = -ENOMEM;
> -			goto err_cs_init;
> -		}
> -
> -		ret = qcom_nand_host_init(nandc, host, child);
> -		if (ret) {
> -			devm_kfree(dev, host);
> -			continue;
> -		}
> -
> -		list_add_tail(&host->node, &nandc->host_list);
> -	}
> -
> -	if (list_empty(&nandc->host_list)) {
> -		ret = -ENODEV;
> -		goto err_cs_init;
> -	}
> +	ret = qcom_probe_nand_devices(nandc);
> +	if (ret)
> +		goto err_setup;
>   
>   	return 0;
>   
> -err_cs_init:
> -	list_for_each_entry(host, &nandc->host_list, node)
> -		nand_release(nand_to_mtd(&host->chip));
>   err_setup:
>   	clk_disable_unprepare(nandc->aon_clk);
>   err_aon_clk:
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
