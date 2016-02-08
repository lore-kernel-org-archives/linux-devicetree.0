From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 4/6] qcom: ipq4019: Add basic board/dts support for
 IPQ4019 SoC
Date: Mon, 8 Feb 2016 14:45:03 -0800
Message-ID: <20160208224503.GC10791@codeaurora.org>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
 <1447975173-29485-5-git-send-email-mmcclint@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447975173-29485-5-git-send-email-mmcclint@qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@qca.qualcomm.com>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Matthew McClintock <mmcclint@codeaurora.org>, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 11/19, Matthew McClintock wrote:
> +
> +/ {
> +
> +	clocks {
> +		sleep_clk: sleep_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +			#clock-cells = <0>;
> +		};
> +	};

The timer should be right here in the SoC file.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
