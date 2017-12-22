From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 06/11] clk: qcom: ipq8074: add PCIE, USB and SDCC
 clocks
Date: Thu, 21 Dec 2017 16:24:02 -0800
Message-ID: <20171222002402.GN7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-7-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513175142-3702-7-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/13, Abhishek Sahu wrote:
> - It has 2 instances of PCIE which uses AXI, AHB, AUX, SYS NOC
>   AXI and PIPE clocks.
> - It has 2 instances of USB 3.0 which uses AUX, SLEEP, PIPE,
>   SYS NOC, mock UTMI and master clocks.
> - It has 2 instances of SDCC which uses APSS and AHB clock.
>   SDCC1 requires ICE core clock also.
> - All the PIPE clocks are external clocks which will be
>   registered in clock framework by PHY drivers. The enabling
>   and disabling of PIPE RCG clocks are dependent upon PHY
>   initialization sequence so BRANCH_HALT_DELAY flag is required for
>   these clocks.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
