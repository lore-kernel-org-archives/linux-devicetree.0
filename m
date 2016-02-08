From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 5/6] dts: ipq4019: Add support for IPQ4019 DK01 board
Date: Mon, 8 Feb 2016 14:43:28 -0800
Message-ID: <20160208224328.GB10791@codeaurora.org>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
 <1447975173-29485-6-git-send-email-mmcclint@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447975173-29485-6-git-send-email-mmcclint@qca.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@qca.qualcomm.com>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Matthew McClintock <mmcclint@codeaurora.org>, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, Senthilkumar N L <snlakshm@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 11/19, Matthew McClintock wrote:
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
> +	compatible = "qcom,ipq4019";
> +
> +	clocks {
> +                xo: xo {
> +                        compatible = "fixed-clock";
> +                        clock-frequency = <48000000>;
> +                        #clock-cells = <0>;
> +                };
> +	};

Is there a reason the xo is here and the sleep clk is in the SoC
dtsi file? Both are board clocks so I would think they would be
added in the same place.

> +
> +	soc {
> +
> +
> +		timer {
> +			compatible = "arm,armv7-timer";
> +			interrupts = <1 2 0xf08>,
> +				     <1 3 0xf08>,
> +				     <1 4 0xf08>,
> +				     <1 1 0xf08>;
> +			clock-frequency = <48000000>;
> +		};

The timer shouldn't be part of the SoC node (it has no reg property).

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
