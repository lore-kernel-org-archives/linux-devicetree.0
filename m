From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8998: Add SDC2 control pins
Date: Thu, 15 Nov 2018 11:16:23 -0800
Message-ID: <20181115191623.GK10915@tuxbook-pro>
References: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
 <1542302291-6864-4-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542302291-6864-4-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 15 Nov 09:18 PST 2018, Jeffrey Hugo wrote:

> The SDC2 control pins are typically used to manage sleep.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 78 ++++++++++++++++++++++++++++++

Rather than adding a -pins file, add the pinctrl states the individual
dts(i) directly.

>  arch/arm64/boot/dts/qcom/msm8998.dtsi      |  2 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> new file mode 100644
> index 0000000..a22abf9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
> +
> +&tlmm {
> +	sdc2_clk_on: sdc2_clk_on {

Use _ in labels, - in node names.

> +		config {

You don't have to put the pinctrl state properties in an additional
subnode anymore, so feel free to remove the extra subnode level.

> +			pins = "sdc2_clk";
> +			bias-disable;           /* NO pull */
> +			drive-strength = <16>;  /* 16 MA */

Please push electrical properties to the board dts instead of the
platform one, as they might be board specific.

> +		};
> +	};

Apart from this the patch loogs good.

Regards,
Bjorn
