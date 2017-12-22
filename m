From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 07/11] clk: qcom: ipq8074: add NSS clocks
Date: Thu, 21 Dec 2017 16:24:05 -0800
Message-ID: <20171222002405.GO7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-8-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513175142-3702-8-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/13, Abhishek Sahu wrote:
> IPQ8074 has NSS (Network Switching System) which has 2 UBI cores
> and hardware crypto engine. Some clocks are separate for each UBI
> core and remaining NSS clocks are common. The BIAS_PLL (300 Mhz)
> and BIAS_PLL_NSS_NOC (416.5 Mhz) are external fixed clocks and
> will be registered from dtsi or NSS driver.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
