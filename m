From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V7 1/2] clk: qcom: Add spmi_pmic clock divider support
Date: Wed, 6 Dec 2017 22:32:43 -0800
Message-ID: <20171207063243.GL4283@codeaurora.org>
References: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
 <1511255465-3984-2-git-send-email-tirupath@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511255465-3984-2-git-send-email-tirupath@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tirupathi Reddy <tirupath@codeaurora.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/21, Tirupathi Reddy wrote:
> Clkdiv module provides a clock output on the PMIC with CXO as
> the source. This clock can be routed through PMIC GPIOs. Add
> a device driver to configure this clkdiv module.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
