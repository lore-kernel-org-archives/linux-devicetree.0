From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v2 3/7] soc: qcom: Add AOSS QMP genpd provider
Date: Thu, 10 Jan 2019 10:29:18 +0530
Message-ID: <b9c970f1-2c2e-6e4f-acad-838054db14db@codeaurora.org>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
 <20190106080915.4493-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-4-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 1/6/2019 1:39 PM, Bjorn Andersson wrote:
> The AOSS QMP genpd provider implements control over power-related
> resources related to low-power state associated with the remoteprocs in
> the system as well as control over a set of clocks related to debug
> hardware in the SoC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Drop compatible, as the QMP DT node is flattened
> - Correct size of send
> 

Thanks for the patch. I tested QDSS functionality with this on SDM845
and it works fine. Also posted the patch for the same here:
  - https://lore.kernel.org/patchwork/patch/1030510/

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
