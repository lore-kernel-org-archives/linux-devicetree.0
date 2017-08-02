From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 10/25] mtd: nand: qcom: reorganize nand devices probing
Date: Wed, 02 Aug 2017 19:26:59 +0530
Message-ID: <c0557fb9dc26c2fdb23567a7b566367d@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-11-git-send-email-absahu@codeaurora.org>
 <772b9720-cd17-0897-4ee1-836abb748f34@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <772b9720-cd17-0897-4ee1-836abb748f34@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2017-08-02 13:51, Archit Taneja wrote:
> On 07/19/2017 05:17 PM, Abhishek Sahu wrote:
>> This is reorganization of exiting code and will not change any
>> functionality. The NAND controller supports multiple NAND device
>> with different page size. The subsequent patch allocate memory
>> which depends upon the maximum number of codewords so this patch
>> reorganizes the NAND device probing. First the ONFI parameter
>> page will be read from each connected device followed by MTD
>> device registration.
>> 
> 
> Modified the commit message slightly so that it's more clear.
> Looks good otherwise.
> 
> "The NAND controller can support multiple NAND devices having different
> page sizes. Future code will require us to allocate memory based on the
> maximum number of codewords among all the devices. We reorganize the 
> NAND
> device probing such that the ONFI parameters are first read for each
> connected device to identify the maximum number of codewords possible,
> and only then proceed with MTD device registration (i.e, call 
> nand_scan_tail
> and mtd_device_register).
> 
> This is a reorganization of the existing code and will not change
> any functionality."
> 
> Thanks,
> Archit

  Thanks for making it more clear.
  I will amend the commit message in v3.

> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 88 
>> +++++++++++++++++++++++++++++--------------
>>   1 file changed, 59 insertions(+), 29 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 7ecd0f8..8f9e86c 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -2059,14 +2059,67 @@ static int qcom_nand_host_init(struct 
>> qcom_nand_controller *nandc,
>>   		return ret;
>>     	ret = qcom_nand_host_setup(host);
>> -	if (ret)
>> -		return ret;
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_nand_mtd_register(struct qcom_nand_controller *nandc,
>> +				  struct qcom_nand_host *host,
>> +				  struct device_node *dn)
>> +{
>> +	struct nand_chip *chip = &host->chip;
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	int ret;
>>     	ret = nand_scan_tail(mtd);
>>   	if (ret)
>>   		return ret;
>>   -	return mtd_device_register(mtd, NULL, 0);
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret)
>> +		nand_cleanup(mtd_to_nand(mtd));
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_probe_nand_devices(struct qcom_nand_controller 
>> *nandc)
>> +{
>> +	struct device *dev = nandc->dev;
>> +	struct device_node *dn = dev->of_node, *child;
>> +	struct qcom_nand_host *host, *tmp;
>> +	int ret;
>> +
>> +	for_each_available_child_of_node(dn, child) {
>> +		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> +		if (!host) {
>> +			of_node_put(child);
>> +			return -ENOMEM;
>> +		}
>> +
>> +		ret = qcom_nand_host_init(nandc, host, child);
>> +		if (ret) {
>> +			devm_kfree(dev, host);
>> +			continue;
>> +		}
>> +
>> +		list_add_tail(&host->node, &nandc->host_list);
>> +	}
>> +
>> +	if (list_empty(&nandc->host_list))
>> +		return -ENODEV;
>> +
>> +	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
>> +		ret = qcom_nand_mtd_register(nandc, host, child);
>> +		if (ret) {
>> +			list_del(&host->node);
>> +			devm_kfree(dev, host);
>> +		}
>> +	}
>> +
>> +	if (list_empty(&nandc->host_list))
>> +		return -ENODEV;
>> +
>> +	return 0;
>>   }
>>     /* parse custom DT properties here */
>> @@ -2094,10 +2147,8 @@ static int qcom_nandc_parse_dt(struct 
>> platform_device *pdev)
>>   static int qcom_nandc_probe(struct platform_device *pdev)
>>   {
>>   	struct qcom_nand_controller *nandc;
>> -	struct qcom_nand_host *host;
>>   	const void *dev_data;
>>   	struct device *dev = &pdev->dev;
>> -	struct device_node *dn = dev->of_node, *child;
>>   	struct resource *res;
>>   	int ret;
>>   @@ -2151,33 +2202,12 @@ static int qcom_nandc_probe(struct 
>> platform_device *pdev)
>>   	if (ret)
>>   		goto err_setup;
>>   -	for_each_available_child_of_node(dn, child) {
>> -		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>> -		if (!host) {
>> -			of_node_put(child);
>> -			ret = -ENOMEM;
>> -			goto err_cs_init;
>> -		}
>> -
>> -		ret = qcom_nand_host_init(nandc, host, child);
>> -		if (ret) {
>> -			devm_kfree(dev, host);
>> -			continue;
>> -		}
>> -
>> -		list_add_tail(&host->node, &nandc->host_list);
>> -	}
>> -
>> -	if (list_empty(&nandc->host_list)) {
>> -		ret = -ENODEV;
>> -		goto err_cs_init;
>> -	}
>> +	ret = qcom_probe_nand_devices(nandc);
>> +	if (ret)
>> +		goto err_setup;
>>     	return 0;
>>   -err_cs_init:
>> -	list_for_each_entry(host, &nandc->host_list, node)
>> -		nand_release(nand_to_mtd(&host->chip));
>>   err_setup:
>>   	clk_disable_unprepare(nandc->aon_clk);
>>   err_aon_clk:
>> 

-- 
Abhishek Sahu
