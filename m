From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v1 1/7] ARM: dts: ifc6410: Add pwrseq support for WLAN
Date: Wed, 29 Jul 2015 15:55:00 -0700
Message-ID: <55B959C4.2090600@codeaurora.org>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org> <1438088022-17350-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438088022-17350-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/28/2015 05:53 AM, Srinivas Kandagatla wrote:
> +
> +		sdcc4_pwrseq:pwrseq {

Missing space here between label and node name.

> +			compatible = "mmc-pwrseq-simple";
> +			reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
> +		};
> +

Also this node is not part of the SoC so it should be in the root, 
possibly under some sort of power-sequences node so that all the 
sequences are grouped in one place.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
