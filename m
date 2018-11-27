From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 3/3] soc: qcom: Add AOSS QMP genpd provider
Date: Tue, 27 Nov 2018 16:20:37 +0530
Message-ID: <e8b74746-23a4-67fe-9b6d-060f77a0a043@codeaurora.org>
References: <20181112080557.22698-1-bjorn.andersson@linaro.org>
 <20181112080557.22698-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112080557.22698-4-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 11/12/2018 1:35 PM, Bjorn Andersson wrote:
> The AOSS QMP genpd provider implements control over power-related
> resources related to low-power state associated with the remoteprocs in
> the system as well as control over a set of clocks related to debug
> hardware in the SoC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

One more issue is that amba bus probe fails and coresight(qdss) does not
work with these because of clocks being modeled as power-domain.

Below is the log snippet:

[    4.580715] coresight-etm4x: probe of 7040000.etm failed with error -2
[    4.588087] coresight-etm4x: probe of 7140000.etm failed with error -2
[    4.595407] coresight-etm4x: probe of 7240000.etm failed with error -2
[    4.602796] coresight-etm4x: probe of 7340000.etm failed with error -2
[    4.610108] coresight-etm4x: probe of 7440000.etm failed with error -2
[    4.617453] coresight-etm4x: probe of 7540000.etm failed with error -2
[    4.624831] coresight-etm4x: probe of 7640000.etm failed with error -2
[    4.632190] coresight-etm4x: probe of 7740000.etm failed with error -2

This is because Amba bus probe has amba_get_enable_pclk() which gets
apb_pclk and returns error if it can't get that clk.

Just for testing, I ignored amba_get_enable_pclk() in probe and
coresight seems to work fine.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
