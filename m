From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 01/12] ARM: dts: apq8064: add RPM regulators support
Date: Thu, 26 Feb 2015 11:31:23 -0800
Message-ID: <54EF748B.3090404@codeaurora.org>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org> <1424678093-12966-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424678093-12966-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/22/15 23:54, Srinivas Kandagatla wrote:
> +			pm8921_s5: pm8921-s5 {
> +				compatible	= "qcom,rpm-pm8921-ftsmps";
> +				reg		= <QCOM_RPM_PM8921_SMPS5>;
> +			};
> +
> +			pm8921_s6: pm8921-s6 {
> +				compatible	= "qcom,rpm-pm8921-ftsmps";
> +				reg		= <QCOM_RPM_PM8921_SMPS6>;
> +			};
> +

There's no RPM control for S5 and S6. Please remove. Also, has this been
tested?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
