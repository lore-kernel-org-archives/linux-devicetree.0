From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: add lpass node
Date: Fri, 5 Feb 2016 11:55:14 -0800
Message-ID: <56B4FE22.8030403@codeaurora.org>
References: <1454698819-13885-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1454698896-14058-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454698896-14058-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/05/2016 11:01 AM, Srinivas Kandagatla wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index c1592d4..cdda026 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -343,6 +343,32 @@
>  			status = "disabled";
>  		};
>  
> +		lpass: lpass@07700000 {
[..]
> +			reg = <0x07708000 0x10000>;

Unit address and reg don't match. Please make them the same.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
