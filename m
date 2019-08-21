From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 1/2] venus: use on-chip interconnect API
Date: Wed, 21 Aug 2019 10:53:20 +0300
Message-ID: <939ace85-e006-db6d-02d2-b55385fa5043@linaro.org>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
 <20190814084701.25455-2-stanimir.varbanov@linaro.org>
 <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cc85f55c-3d21-c3b2-6848-e48513263e39@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Aniket Masule <amasule@codeaurora.org>, Linux PM list <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Georgi,

Thanks for the review!

On 8/20/19 12:34 PM, Georgi Djakov wrote:
> Hi Stan,
> 
> On 8/14/19 11:47, Stanimir Varbanov wrote:
>> This aims to add a requests for bandwidth scaling depending
>> on the resolution and framerate (macroblocks per second). The
>> exact value ff the requested bandwidth is get from a
> 
> s/ff/of/
> 
>> pre-calculated tables for encoder and decoder.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
>>  drivers/media/platform/qcom/venus/core.h    | 14 +++++
>>  drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
>>  3 files changed, 114 insertions(+), 1 deletion(-)
> 
> It looks like venus can be built-in, so how about the case when venus is
> built-in and the interconnect provider is a module? Maybe add a dependency in
> Kconfig to depend on INTERCONNECT || !INTERCONNECT?

yes, I forgot about that dependency.

> 
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 0acc7576cc58..19cbe9d5d028 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -5,6 +5,7 @@
>>   */
>>  #include <linux/clk.h>
>>  #include <linux/init.h>
>> +#include <linux/interconnect.h>
>>  #include <linux/ioctl.h>
>>  #include <linux/list.h>
>>  #include <linux/module.h>
>> @@ -239,6 +240,14 @@ static int venus_probe(struct platform_device *pdev)
>>  	if (IS_ERR(core->base))
>>  		return PTR_ERR(core->base);
>>  
>> +	core->video_path = of_icc_get(dev, "video-mem");
>> +	if (IS_ERR(core->video_path))
>> +		return PTR_ERR(core->video_path);
>> +
>> +	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
>> +	if (IS_ERR(core->cpucfg_path))
>> +		return PTR_ERR(core->cpucfg_path);
>> +
>>  	core->irq = platform_get_irq(pdev, 0);
>>  	if (core->irq < 0)
>>  		return core->irq;
>> @@ -273,6 +282,10 @@ static int venus_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = hfi_create(core, &venus_core_ops);
>>  	if (ret)
>>  		return ret;
>> @@ -355,6 +368,9 @@ static int venus_remove(struct platform_device *pdev)
>>  	pm_runtime_put_sync(dev);
>>  	pm_runtime_disable(dev);
>>  
>> +	icc_put(core->video_path);
>> +	icc_put(core->cpucfg_path);
>> +
> 
> Do you have any plans to scale the bandwidth on suspend/resume too?

Yes, we definitely need that in suspend/resume, but I guess the plan
should be add it once we implement pm_runtime autosuspend functionality
in order to easily test that.

-- 
regards,
Stan
