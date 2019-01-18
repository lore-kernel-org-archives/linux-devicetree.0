From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 2/4] arm64: dts: qcom: msm8996: Add Coresight support
Date: Fri, 18 Jan 2019 17:38:25 +0530
Message-ID: <7a82a0c1-a449-f062-0cc3-944102472fb0@codeaurora.org>
References: <cover.1547798966.git.saiprakash.ranjan@codeaurora.org>
 <552e408950525b1bac39d05b8b4f2ae1975397e0.1547798966.git.saiprakash.ranjan@codeaurora.org>
 <1311e78a-21f6-6470-7861-39b3499974ce@arm.com>
 <6543ad5c-bbcf-b3ec-332c-115e8e3d0825@codeaurora.org>
 <1b7d4c2f-98f7-4b80-4e32-6e0fe5c906ce@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1b7d4c2f-98f7-4b80-4e32-6e0fe5c906ce@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 1/18/2019 5:34 PM, Suzuki K Poulose wrote:
> If you would like to use the scatter-gather mode, you must specify it
> explicitly. We have had some other boards with broken scatter-gather
> mode integration which causes mysterious issues when used. So we have
> a white-list approach for enabling the scatter-gather mode in the driver.
> 
> So, if you have tested to make sure that the mode works fine with a recent
> kernel version (v4.19 onwards), you may want to add the property.
> 
> Suzuki
> 

Will add scatter-gather and post v3 soon for both SDM845 and MSM8996.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
