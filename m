From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/4] mfd: devicetree: bindings: Add Qualcomm RPM regulator
 subnodes
Date: Tue, 03 Mar 2015 10:53:45 -0800
Message-ID: <54F60339.6000803@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/02/15 20:25, Bjorn Andersson wrote:
>
> += SUBNODES
> +
> +The RPM exposes resources to its subnodes. The below bindings specify the set
> +of valid subnodes that can operate on these resources.
> +
> +== Regulators
> +
> +Regulator notes are identified by their compatible:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,rpm-pm8058-regulators"
> +		    "qcom,rpm-pm8901-regulators"
> +		    "qcom,rpm-pm8921-regulators"
> +
> +- vdd_l0_l1_lvs-supply:
> +- vdd_l10-supply:
> +- vdd_l13_l16-supply:
> +- vdd_l14_l15-supply:
> +- vdd_l17_l18-supply:
> +- vdd_l19_l20-supply:
> +- vdd_l21-supply:
> +- vdd_l22-supply:
> +- vdd_l23_l24_l25-supply:
> +- vdd_l2_l11_l12-supply:
> +- vdd_l3_l4_l5-supply:
> +- vdd_l6_l7-supply:
> +- vdd_l8-supply:
> +- vdd_l9-supply:
> +- vdd_ncp-supply:
> +- vdd_s0-supply:
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +	Usage: optional (pm8058 only)
> +	Value type: <phandle>
> +	Definition: reference to regulator supplying the input pin, as
> +		    described in the data sheet
> +
> +- vdd_l0-supply:
> +- vdd_l1-supply:
> +- vdd_l2-supply:
> +- vdd_l3-supply:
> +- vdd_l4-supply:
> +- vdd_l5-supply:
> +- vdd_l6-supply:
> +- vdd_s0-supply:
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +- lvs0_in-supply:
> +- lvs1_in-supply:
> +- lvs2_in-supply:
> +- lvs3_in-supply:
> +- mvs_in-supply:
> +	Usage: optional (pm8901 only)
> +	Value type: <phandle>
> +	Definition: reference to regulator supplying the input pin, as
> +		    described in the data sheet
> +
> +- vin_l1_l2_l12_l18-supply:
> +- vin_l24-supply:
> +- vin_l25-supply:
> +- vin_l27-supply:
> +- vin_l28-supply:
> +- vin_lvs_1_3_6-supply:
> +- vin_lvs2-supply:
> +- vin_lvs_4_5_7-supply:
> +- vin_ncp-supply:

Can you also include vin_s1,vin_s2, etc. for the rest of the supplies I
left out? It looks like you've covered all the inputs for the other pmics.

> +	Usage: optional (pm8921 only)
> +	Value type: <phandle>
> +	Definition: reference to regulator supplying the input pin, as
> +		    described in the data sheet
> +
> +The regulator node houses sub-nodes for each regulator within the device. Each
> +sub-node is identified using the node's name, with valid values listed for each
> +of the pmics below.
> +


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
