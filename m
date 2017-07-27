From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] arm64: dts: Add device node for pmi8994 gpios
Date: Thu, 27 Jul 2017 14:00:15 -0700
Message-ID: <f0ad95d2-f79e-c3d4-1ac6-48d5d6e21956@codeaurora.org>
References: <1501137036-20155-1-git-send-email-vivek.gautam@codeaurora.org>
 <1501137036-20155-2-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1501137036-20155-2-git-send-email-vivek.gautam@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>, bjorn.andersson@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: rnayak@codeaurora.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/26/2017 11:30 PM, Vivek Gautam wrote:
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8994.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
> index d3879a4e8076..3b04ca63c31e 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
> @@ -8,6 +8,23 @@
>  		reg = <0x2 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		pmi8994_gpios: gpios@c000 {
> +			compatible = "qcom,pmi8994-gpio";


Please also include the generic "qcom,spmi-gpio" compatible. We really
don't need to add the "qcom,pmi8994-gpio" one to the driver right now so
I would leave that out of the driver but leave it here in the dtsi file
of course.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

