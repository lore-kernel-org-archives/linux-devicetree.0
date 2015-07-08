From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 01/11] soc: qcom: Add device tree binding for SMEM
Date: Wed, 08 Jul 2015 16:56:34 -0700
Message-ID: <559DB8B2.2090202@codeaurora.org>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com> <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn@kryo.se, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/26/2015 02:50 PM, bjorn@kryo.se wrote:
> += EXAMPLE
> +The following example shows the SMEM setup for MSM8974, with a main SMEM region
> +at 0xfa00000 and an auxiliary region at 0xfc428000:
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		smem_region: smem@fa00000 {
> +			reg = <0xfa00000 0x200000>;
> +			no-map;
> +		};
> +	};
> +
> +	smem@fa00000 {

This should be smem@fc428000 matching the first reg property. It's weird
though, because if smem is using a secondary region it will be under the
SoC node and have a reg property. Otherwise it would be directly under
the root node and only have a memory-region. It would be nice if we
could somehow move the rpm message ram (0xfc428000) into the
reserved-memory node so that we could use memory-region for both regions.

> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_region>;
> +		reg = <0xfc428000 0x4000>;
> +
> +		hwlocks = <&tcsr_mutex 3>;
> +	};


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
