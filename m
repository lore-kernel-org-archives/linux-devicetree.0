From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/4] dmaengine: qcom: bam_dma: add num-channels binding
 for remotely controlled
Date: Mon, 22 Jan 2018 09:55:06 +0000
Message-ID: <57712340-96b3-0be3-81e3-ec107c559a2e@linaro.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180116190236.14558-3-srinivas.kandagatla@linaro.org>
 <20180119055509.GW18649@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180119055509.GW18649@localhost>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org



On 19/01/18 05:55, Vinod Koul wrote:
> On Tue, Jan 16, 2018 at 07:02:34PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> When Linux is master of BAM, it can directly read registers to know number
>> of supported channels, however when its remotely controlled reading these
>> registers would trigger a crash if the BAM is not yet intialized/powered up
>> on the remote side.
>>
>> This patch adds num-channels binding to specify number of supported
>> dma channels on remotely controlled BAM.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/dma/qcom_bam_dma.txt |  2 ++
>>   drivers/dma/qcom/bam_dma.c                             | 13 +++++++++++--
>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>> index 9cbf5d9df8fd..aa6822cbb230 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>> @@ -15,6 +15,8 @@ Required properties:
>>     the secure world.
>>   - qcom,controlled-remotely : optional, indicates that the bam is controlled by
>>     remote proccessor i.e. execution environment.
>> +- num-channels : optional, indicates supported number of DMA channels in a
>> +  remotely controlled bam.
>>   
>>   Example:
>>   
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index 78e488e8f96d..523bd178047a 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
>> @@ -1083,8 +1083,10 @@ static int bam_init(struct bam_device *bdev)
>>   	if (bdev->ee >= val)
>>   		return -EINVAL;
>>   
>> -	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
>> -	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
>> +	if (!bdev->num_channels) {
>> +		val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
>> +		bdev->num_channels = val & BAM_NUM_PIPES_MASK;
>> +	}
>>   
>>   	if (bdev->controlled_remotely)
>>   		return 0;
>> @@ -1179,6 +1181,13 @@ static int bam_dma_probe(struct platform_device *pdev)
>>   	bdev->controlled_remotely = of_property_read_bool(pdev->dev.of_node,
>>   						"qcom,controlled-remotely");
>>   
>> +	if (bdev->controlled_remotely) {
> 
> hmm so if we remove the remotely controlled instanced from DT and then Linux
> won't see them and not do anything. Do we need to do configuration of these
> instances too?
No, bindings "num-channels" and "num-ees" are applicable to remote 
controlled instances only, which is documented in the DT bindings.

Normally these values come from register reads, which are not possible 
in case of remotely controlled instances as BAM driver would not know if 
the remote is powered up or not.

thanks,
srini

> 
>> +		ret = of_property_read_u32(pdev->dev.of_node, "num-channels",
>> +					   &bdev->num_channels);
>> +		if (ret)
>> +			dev_err(bdev->dev, "num-channels unspecified in dt\n");
>> +	}
>> +
>>   	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>>   	if (IS_ERR(bdev->bamclk)) {
>>   		bdev->bamclk = NULL;
>> -- 
>> 2.15.1
>>
> 
