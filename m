From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/5] dmaengine: qcom: bam_dma: make bam clk optional
Date: Wed, 14 Feb 2018 18:19:54 +0000
Message-ID: <69c7a7e4-1a1f-e0e6-d5e9-c39ff666df64@linaro.org>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
 <20180214144459.29813-2-srinivas.kandagatla@linaro.org>
 <20180214154144.GB93895@bjorns-mbp-2.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180214154144.GB93895@bjorns-mbp-2.lan>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org

Thanks for the Review,

On 14/02/18 15:41, Bjorn Andersson wrote:
>>   
>>   	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>> -	if (IS_ERR(bdev->bamclk))
>> -		return PTR_ERR(bdev->bamclk);
>> -
>> -	ret = clk_prepare_enable(bdev->bamclk);
>> -	if (ret) {
>> -		dev_err(bdev->dev, "failed to prepare/enable clock\n");
>> -		return ret;
>> +	if (IS_ERR(bdev->bamclk)) {
> In the case of !bdev->controlled_remotely I think this should still be
> an error.
> 
Yep makes sense,

You mean something like this?

------------------------->cut<------------------------
         bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
         if (IS_ERR(bdev->bamclk)) {
                 if (!bdev->controlled_remotely);
                         return PTR_ERR(bdev->bamclk);

                 bdev->bamclk = NULL;
         }

         ret = clk_prepare_enable(bdev->bamclk);
         if (ret) {
                 dev_err(bdev->dev, "failed to prepare/enable clock\n");
                 return ret;
         }

------------------------->cut<------------------------


>> +		bdev->bamclk = NULL;
>> +	} else {
>> +		ret = clk_prepare_enable(bdev->bamclk);
>> +		if (ret) {
>> +			dev_err(bdev->dev, "failed to prepare/enable clock\n");
>> +			return ret;
>> +		}
> The rest of the driver will keep operating the bamclk (which is okay),
> so for symmetry purposes I think you should just keep the
> clk_prepare_enable() block unmodified.
> 
Yep, with above change, this block should be unchanged.


--srini
> Regards,
> Bjorn
