From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 02/11] clk: qcom: add parent map for regmap mux
Date: Thu, 21 Dec 2017 16:23:49 -0800
Message-ID: <20171222002349.GK7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-3-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513175142-3702-3-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/13, Abhishek Sahu wrote:
> Currently the driver assumes the register configuration value
> is identical to its index in the parent map. This patch adds
> the parent map field in regmap mux clock node which contains
> the mapping of parent index with actual register configuration
> value. If regmap node contains this parent map then the
> configuration value will be taken from this
> parent map instead of simply writing the index value.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
