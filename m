From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/3] mfd: devicetree: bindings: Add Qualcomm SMD based
 RPM DT binding
Date: Tue, 12 May 2015 11:15:58 -0700
Message-ID: <5552435E.4040407@codeaurora.org>
References: <1428962282-32430-1-git-send-email-bjorn.andersson@sonymobile.com> <1428962282-32430-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428962282-32430-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/13/15 14:58, Bjorn Andersson wrote:
> +
> +== Regulators
> +
> +Regulator nodes are identified by their compatible:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,rpm-pm8841-regulators"
> +		    "qcom,rpm-pm8941-regulators"
> +
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +- vdd_s5-supply:
> +- vdd_s6-supply:
> +- vdd_s7-supply:
> +- vdd_s8-supply:
> +	Usage: optional (pm8841 only)
> +	Value type: <phandle>
> +	Definition: reference to regulator supplying the input pin, as
> +		    described in the data sheet
> +
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_l1_l3-supply:
> +- vdd_l2_lvs1_2_3-supply:
> +- vdd_l1_l3-supply:
> +- vdd_l4_l11-supply:
> +- vdd_l5_l7-supply:
> +- vdd_l6_l12_l14_l15-supply:
> +- vdd_l5_l7-supply:
> +- vdd_l8_l16_l18_l19-supply:
> +- vdd_l9_l10_l17_l22-supply:
> +- vdd_l9_l10_l17_l22-supply:
> +- vdd_l4_l11-supply:
> +- vdd_l6_l12_l14_l15-supply:
> +- vdd_l13_l20_l23_l24-supply:
> +- vdd_l6_l12_l14_l15-supply:
> +- vdd_l6_l12_l14_l15-supply:
> +- vdd_l8_l16_l18_l19-supply:
> +- vdd_l9_l10_l17_l22-supply:
> +- vdd_l8_l16_l18_l19-supply:
> +- vdd_l8_l16_l18_l19-supply:
> +- vdd_l13_l20_l23_l24-supply:
> +- vdd_l21-supply:
> +- vdd_l9_l10_l17_l22-supply:
> +- vdd_l13_l20_l23_l24-supply:
> +- vdd_l13_l20_l23_l24-supply:
> +- vdd_l2_lvs1_2_3-supply:
> +- vdd_l2_lvs1_2_3-supply:
> +- vdd_l2_lvs1_2_3-supply:
> +- vin_5vs-supply:
> +- vin_5vs-supply:

Can you remove the duplicates here please?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
