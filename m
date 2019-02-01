From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv6 6/6] coresight: debug: Add Unique Component Identifier
 (UCI) table
Date: Fri, 1 Feb 2019 06:17:02 +0530
Message-ID: <2801964a-ba35-9393-593b-c5108a8825e4@codeaurora.org>
References: <cover.1548943727.git.saiprakash.ranjan@codeaurora.org>
 <f724b28e5bfd7bca062aa5380cfd9328289559bf.1548943727.git.saiprakash.ranjan@codeaurora.org>
 <304febd7-da9a-92d6-47bb-d9983d4bc5d4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <304febd7-da9a-92d6-47bb-d9983d4bc5d4@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, robh+dt@kernel.org, mathieu.poirier@linaro.org, mike.leach@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, jhugo@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, tingwei@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 1/31/2019 11:31 PM, Suzuki K Poulose wrote:
> 
> 
> On 31/01/2019 14:22, Sai Prakash Ranjan wrote:
>> Add UCI table for coresight CPU debug module. This patch adds
>> the UCI entries for Kryo CPUs found on MSM8996 which shares
>> the same PIDs as ETMs.
>>
>> Without this, below error is observed on MSM8996:
> 
> nit: Subject doesn't match the patch contents. You could simply say :
> 
> coresight: cpu-debug: Add support for Qualcomm Kryo
> 

Done.

>>
>> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c 
>> b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> index e8819d750938..915d86a39cee 100644
>> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
>> @@ -655,24 +655,23 @@ static int debug_remove(struct amba_device *adev)
>>       return 0;
>>   }
>> +static struct amba_cs_uci_id uci_id_debug[] = {
> 
> As Stephen mentioned, this must be "const".
> 
> Rest looks fine.

Done.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
