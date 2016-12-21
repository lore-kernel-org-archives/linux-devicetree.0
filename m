From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 1/6] clk: qcom: ipq4019: remove fixed clocks and add
 pll clocks
Date: Wed, 21 Dec 2016 15:57:44 -0800
Message-ID: <20161221235744.GJ8288@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
 <1480088493-4590-2-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480088493-4590-2-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/25, Abhishek Sahu wrote:
> The current ipq4019 clock driver registered the PLL clocks and
> dividers as fixed clock. These fixed clock needs to be removed
> from driver probe function and same need to be registered with
> clock framework. These PLL clocks should be programmed only
> once and the same are being programmed already by the boot
> loader so the set rate operation is not required for these
> clocks. Only the rate can be calculated by clock operations
> in clock driver file so this patch adds the same.
> 
> The PLL takes the reference clock from XO and generates the
> intermediate VCO frequency. This VCO frequency will be divided
> down by different PLL internal dividers. Some of the PLL
> internal dividers are fixed while other are programmable.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-ipq4019 and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
