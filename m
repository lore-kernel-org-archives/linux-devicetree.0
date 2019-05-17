From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v4 0/9] RPMPD for QCS404 and MSM8998
Date: Fri, 17 May 2019 11:03:52 -0600
Message-ID: <2d453c99-4ea2-e4f0-1d99-e13d099bfa07@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc: david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, marc.w.gonzalez@free.fr
List-Id: devicetree@vger.kernel.org

On 5/13/2019 4:20 AM, Sibi Sankar wrote:
> Re-worked the macros of the rpmpd driver. Add power domains support
> for QCS404 and MSM8998.

For the series:
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

> 
> V4:
> * fixup fixes tag and commit message in patch 1 [Marc]
> * fixup typos in qcs404 and msm8998 dt nodes
> * fixup comments regarding resource type in patch 8 [Marc]
> 
> V3:
> * always send level updates to vfc and vfl in set_performance state
> * fixup commit messages [Rajendra]
> * fixup s-o-b ordering
> 
> V2:
> * Add rpmpd support for msm8998
> * fixup corner/vfc with vlfl/vfl
> 
> Bjorn Andersson (4):
>    soc: qcom: rpmpd: Modify corner defining macros
>    dt-bindings: power: Add rpm power domain bindings for qcs404
>    soc: qcom: rpmpd: Add QCS404 power-domains
>    arm64: dts: qcom: qcs404: Add rpmpd node
> 
> Sibi Sankar (5):
>    soc: qcom: rpmpd: fixup rpmpd set performance state
>    soc: qcom: rpmpd: Add support to set rpmpd state to max
>    dt-bindings: power: Add rpm power domain bindings for msm8998
>    soc: qcom: rpmpd: Add MSM8998 power-domains
>    arm64: dts: qcom: msm8998: Add rpmpd node
> 
>   .../devicetree/bindings/power/qcom,rpmpd.txt  |   2 +
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         |  51 +++++++
>   arch/arm64/boot/dts/qcom/qcs404.dtsi          |  55 +++++++
>   drivers/soc/qcom/rpmpd.c                      | 134 ++++++++++++++----
>   include/dt-bindings/power/qcom-rpmpd.h        |  34 +++++
>   5 files changed, 252 insertions(+), 24 deletions(-)
> 


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
