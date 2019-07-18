From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 2/5] arm64: dts: qcom: msm8998: Add Coresight support
Date: Thu, 18 Jul 2019 15:23:49 +0530
Message-ID: <2b08943b-3900-ceb5-15ac-28ef2bbad03e@codeaurora.org>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
 <4854b0f7-6a81-bc87-3e63-d2b7c68a44f6@codeaurora.org>
 <281e3548-af53-f9a7-b9e4-813b448ab078@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <281e3548-af53-f9a7-b9e4-813b448ab078@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, gregkh@linuxfoundation.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, mike.leach@linaro.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, david.brown@linaro.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, vivek.gautam@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, marc.w.gonzalez@free.fr
List-Id: devicetree@vger.kernel.org

Hi,

On 7/18/2019 3:07 PM, Suzuki K Poulose wrote:
> 
> 
> Using the sysfs doesn't guarantee that the ETR actually uses SG mode, 
> unless
> the buffer size selected is > 1M, which is why I am more interested in the
> perf usage. Alternatively you may configure a larger buffer size (say, 
> 8MB) via:
> 
> echo 0x800000 > /sys/bus/coresight/.../tmc_etr0/buffer_size
> 

Yes, you had mentioned about setting buffer size > 1M in the same 
thread[1] and I had followed the same.

[1] https://lkml.org/lkml/2019/1/18/311

> 
>>
>> As said in one of the series initially [1], QCOM msm downstream kernels
>> have been using scatter gather mode and we haven't seen any fatal issues.
>>
>> [1] https://patchwork.kernel.org/patch/10769535/
> 
> I haven't seen any test results there either.
> 

You did not ask for it there ;)

I do not have the test results handy now and those platforms.
I will arrange for them and post some test results.

Just to confirm, do you need some traces or just the buffer size
and sink set?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
