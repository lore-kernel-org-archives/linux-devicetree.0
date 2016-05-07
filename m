From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 1/4] extcon: arizona: Remove enable/disable of 32k
 clock
Date: Fri, 6 May 2016 17:50:46 -0700
Message-ID: <20160507005046.GM3492@codeaurora.org>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-clk-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 01/08, Charles Keepax wrote:
> The 32k clock is unconditionally enabled by the MFD core so there is no
> need to control it from the extcon device, so this patch removes the
> control of the 32k clock.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
