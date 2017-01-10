From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC PATCHv2 2/4] clk: mdm9615: Add EBI2 clock
Date: Mon, 9 Jan 2017 16:33:41 -0800
Message-ID: <20170110003341.GL17126@codeaurora.org>
References: <1482468884-31027-1-git-send-email-zmarkovic@sierrawireless.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482468884-31027-1-git-send-email-zmarkovic@sierrawireless.com>
Sender: linux-clk-owner@vger.kernel.org
To: Zoran Markovic <zmarkovic@sierrawireless.com>
Cc: linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/22, Zoran Markovic wrote:
> Add definition of EBI2 clock used by MDM9615 NAND controller.
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Zoran Markovic <zmarkovic@sierrawireless.com>
> ---

Applied to clk-next + fixed halt bit of ebi2_clk to be 24 not 23.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
