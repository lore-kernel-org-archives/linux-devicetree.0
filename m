From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/4] dmaengine: qcom: bam_dma: make bam clk optional
Date: Mon, 22 Jan 2018 09:55:01 +0000
Message-ID: <8dfa8ba1-6e98-a8e4-614c-592861cef571@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180116190236.14558-2-srinivas.kandagatla@linaro.org>
 <20180119055221.GV18649@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180119055221.GV18649@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org



On 19/01/18 05:52, Vinod Koul wrote:
> On Tue, Jan 16, 2018 at 07:02:33PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> When BAM is remotely controlled it does not sound correct to control
>> its clk on Linux side. Make it optional, so that its not madatory
> 
> s/madatory/mandatory
> 
Yep,
>> for remote controlled BAM instances.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/dma/qcom/bam_dma.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index 03c4eb3fd314..78e488e8f96d 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
>> @@ -1180,13 +1180,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>>   						"qcom,controlled-remotely");
>>   
>>   	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> 
> but you still do clk_get unconditionally?

Only reason to do this way is to not break existing users in the mainline.

remotely controlled BAM is already supported in upstream driver, there 
are users of this who pass clk from device tree, If I make this 
conditional then subsequent reads to the BAM registers for those 
instances might crash the system.

This sounds wrong to control clk from linux for the dma controller which 
is remotely controlled. These users should be transitioned to new 
bindings once the new bindings endup in the mainline.

> 
>> -	if (IS_ERR(bdev->bamclk))
>> -		return PTR_ERR(bdev->bamclk);
>> -
>> -	ret = clk_prepare_enable(bdev->bamclk);
>> -	if (ret) {
>> -		dev_err(bdev->dev, "failed to prepare/enable clock\n");
>> -		return ret;
>> +	if (IS_ERR(bdev->bamclk)) {
>> +		bdev->bamclk = NULL;
>> +	} else {
>> +		ret = clk_prepare_enable(bdev->bamclk);
>> +		if (ret) {
>> +			dev_err(bdev->dev, "failed to prepare/enable clock\n");
>> +			return ret;
>> +		}
> 
> wouldn't it be better to set that an instance is remote controlled and thus
> not at all visible to Linux?

We already have a flag "controlled_remotely" for that in the driver.

thanks,
srini
> 
>>   	}
>>   
>>   	ret = bam_init(bdev);
>> -- 
>> 2.15.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
