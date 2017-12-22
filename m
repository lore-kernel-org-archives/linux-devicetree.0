From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 01/11] clk: qcom: add read-only divider operations
Date: Thu, 21 Dec 2017 16:23:39 -0800
Message-ID: <20171222002339.GJ7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-2-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513175142-3702-2-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/13, Abhishek Sahu wrote:
> Some of the divider settings are preconfigured and should not
> be changed by the clock framework during frequency change. This
> patch adds the read-only divider operation for QCOM dividers
> which is equivalent to generic divider operations in
> 'commit 79c6ab509558 ("clk: divider: add CLK_DIVIDER_READ_ONLY flag")'.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
