From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 2/6] clk: qcom: ipq4019: Add the apss cpu pll divider
 clock node
Date: Wed, 21 Dec 2016 15:57:50 -0800
Message-ID: <20161221235750.GK8288@codeaurora.org>
References: <1480088493-4590-1-git-send-email-absahu@codeaurora.org>
 <1480088493-4590-3-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480088493-4590-3-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, varada@codeaurora.org, pradeepb@codeaurora.org, snlakshm@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/25, Abhishek Sahu wrote:
> The current ipq4019 clock driver does not have support for all
> the frequency supported by APSS CPU. APSS CPU frequency is
> provided with APSS CPU PLL divider which divides down the VCO
> frequency. This divider is nonlinear and specific to IPQ4019
> so the standard divider code cannot be used for this.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-ipq4019 and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
