From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 2/2] coresight: Abort probe if cpus are not available
Date: Fri, 21 Jun 2019 16:01:23 +0530
Message-ID: <01e1758f-7574-7735-f129-f072f93aeca6@codeaurora.org>
References: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
 <65050e4cb2b0433f3cb9b1ca0bf6ec49d0751086.1561054498.git.saiprakash.ranjan@codeaurora.org>
 <d6e6a32e-4e15-5bc8-42f9-6cfe72fc0910@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d6e6a32e-4e15-5bc8-42f9-6cfe72fc0910@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, mathieu.poirier@linaro.org, leo.yan@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, alexander.shishkin@linux.intel.com, david.brown@linaro.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, vivek.gautam@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 6/21/2019 3:10 PM, Suzuki K Poulose wrote:
> On 06/20/2019 07:31 PM, Sai Prakash Ranjan wrote:
>> Currently coresight etm and cpu-debug will go ahead with
>> the probe even when corresponding cpus are not available
>> and error out later in the probe path. In such cases, it
>> is better to abort the probe earlier.
>>
>> Without this, setting *nosmp* will throw below errors:
>>
>>   [    5.910622] coresight-cpu-debug 850000.debug: Coresight 
>> debug-CPU0 initialized
>>   [    5.914266] coresight-cpu-debug 852000.debug: CPU1 debug arch 
>> init failed
>>   [    5.921474] coresight-cpu-debug 854000.debug: CPU2 debug arch 
>> init failed
>>   [    5.928328] coresight-cpu-debug 856000.debug: CPU3 debug arch 
>> init failed
>>   [    5.935330] coresight etm0: CPU0: ETM v4.0 initialized
>>   [    5.941875] coresight-etm4x 85d000.etm: ETM arch init failed
>>   [    5.946794] coresight-etm4x: probe of 85d000.etm failed with 
>> error -22
>>   [    5.952707] coresight-etm4x 85e000.etm: ETM arch init failed
>>   [    5.958945] coresight-etm4x: probe of 85e000.etm failed with 
>> error -22
>>   [    5.964853] coresight-etm4x 85f000.etm: ETM arch init failed
>>   [    5.971096] coresight-etm4x: probe of 85f000.etm failed with 
>> error -22
> 
> That is expected. What else do you expect ?
> 
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-platform.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c 
>> b/drivers/hwtracing/coresight/coresight-platform.c
>> index 8b03fa573684..3f4559596c6b 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -168,6 +168,9 @@ static int of_coresight_get_cpu(struct device *dev)
>>       cpu = of_cpu_node_to_id(dn);
>>       of_node_put(dn);
>> +    if (num_online_cpus() <= cpu)
>> +        return -ENODEV;
> 
> That is a pointless and terribly wrong check. What if you have only 2
> online CPUs (CPU0 and CPU4) and you were processing the ETM for CPU4 ?
>

Sorry, I did not consider such cases.

> More over you should simply let the driver handle a case where the CPU
> is not online. May be the driver could register a hotplug notifier and
> bring itself up when the CPU comes online.
> 
> So, please drop this patch.
> 

Sure I will drop this patch.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
