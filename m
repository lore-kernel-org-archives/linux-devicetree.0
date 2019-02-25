From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 0/3] RPMPD for QCS404
Date: Mon, 25 Feb 2019 18:18:09 +0530
Message-ID: <c4b2a60c-80a5-8491-38fb-1fed3dee2e8a@codeaurora.org>
References: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221064434.2760-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 2/21/2019 12:14 PM, Bjorn Andersson wrote:
> Reworkd the macros of the rpmpd driver and add qcs404 power domains, then add
> this to the dts.

For the entire series,

Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

> 
> Bjorn Andersson (3):
>    soc: qcom: rpmpd: Modify corner defining macros
>    soc: qcom: rpmpd: Add QCS404 corners
>    arm64: dts: qcom: qcs404: Add rpmpd node
> 
>   .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
>   arch/arm64/boot/dts/qcom/qcs404.dtsi          | 35 +++++++++++
>   drivers/soc/qcom/rpmpd.c                      | 63 +++++++++++++------
>   include/dt-bindings/power/qcom-rpmpd.h        |  9 +++
>   4 files changed, 88 insertions(+), 20 deletions(-)
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
