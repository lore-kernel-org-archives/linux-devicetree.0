From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 2/5] arm64: dts: qcom: msm8998: Add Coresight support
Date: Thu, 18 Jul 2019 14:44:01 +0530
Message-ID: <4854b0f7-6a81-bc87-3e63-d2b7c68a44f6@codeaurora.org>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, gregkh@linuxfoundation.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, mike.leach@linaro.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, david.brown@linaro.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, vivek.gautam@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, marc.w.gonzalez@free.fr
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 7/18/2019 1:58 PM, Suzuki K Poulose wrote:
> Hi Sai,
> 
> 
>          etr@6048000 {
>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>> +            reg = <0x06048000 0x1000>;
>> +
>> +            clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc 
>> RPM_SMD_QDSS_A_CLK>;
>> +            clock-names = "apb_pclk", "atclk";
>> +            arm,scatter-gather;
> 
> Please could you confirm that you have tested the scatter-gather mode 
> with ETR ? Either via perf/sysfs. Please could you share your results ? 
> Unless verified
> this is going to be fatal for the system.
> 
> Similarly for other platforms.
> 

Yes I have tested with scatter-gather mode with ETR on all platforms
which I have posted via sysfs(not perf) before on previous versions of 
this patch series and no issues were found. And I suppose this was
discussed in v2 of this patch series [1].

As said in one of the series initially [1], QCOM msm downstream kernels 
have been using scatter gather mode and we haven't seen any fatal issues.

[1] https://patchwork.kernel.org/patch/10769535/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
