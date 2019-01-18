From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 2/4] arm64: dts: qcom: msm8996: Add Coresight support
Date: Fri, 18 Jan 2019 17:18:01 +0530
Message-ID: <6543ad5c-bbcf-b3ec-332c-115e8e3d0825@codeaurora.org>
References: <cover.1547798966.git.saiprakash.ranjan@codeaurora.org>
 <552e408950525b1bac39d05b8b4f2ae1975397e0.1547798966.git.saiprakash.ranjan@codeaurora.org>
 <1311e78a-21f6-6470-7861-39b3499974ce@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1311e78a-21f6-6470-7861-39b3499974ce@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 1/18/2019 4:27 PM, Suzuki K Poulose wrote:
> 
> If you want to use the scatter-gather mode, you must add 
> "arm,scatter-gather"
> property to the node here.
> 
> Have you tested the scatter-gather mode on the chip ? Does that work at 
> all ?
> Note: You could try this by setting a buffer_size > 1M for the ETR and use
> it as a sink from the sysfs mode.
> 

Yes the chip supports scatter-gather mode[1]. But is it required in
dt node since it's an optional property?

[1] 
https://source.codeaurora.org/quic/la/kernel/msm-3.18/tree/arch/arm/boot/dts/qcom/msm8996-coresight-v3.dtsi?h=LA.BR.5.6#n24

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
