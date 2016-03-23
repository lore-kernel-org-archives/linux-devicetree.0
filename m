From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 04/12] ARM: dts: dragonboard-600c: add board support with
 serial
Date: Wed, 23 Mar 2016 13:07:42 -0700
Message-ID: <56F2F78E.8050002@codeaurora.org>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762442-9492-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1458762442-9492-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/23/2016 12:47 PM, Srinivas Kandagatla wrote:
> diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> new file mode 100644
> index 0000000..e96aab6
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
> @@ -0,0 +1,36 @@
> +#include "qcom-apq8064-v2.0.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. APQ8064 DragonBoard600c";
> +	compatible = "qcom,apq8064-dragonboard600c", "qcom,apq8064";

Does the bootloader look at this string at all or is it using appended
DTB design? I'm mostly worried about having that
qcom,apq8064-dragonboard600c part. It should probably be
qcom,apq8064-sbc or something like that instead.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
