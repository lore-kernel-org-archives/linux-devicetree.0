From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 1/2] clk: add lpc18xx creg clk driver
Date: Fri, 4 Mar 2016 12:53:28 -0800
Message-ID: <20160304205328.GB25972@codeaurora.org>
References: <1457041625-21163-1-git-send-email-manabian@gmail.com>
 <1457041625-21163-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457041625-21163-2-git-send-email-manabian@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/03, Joachim Eastwood wrote:
> The CREG block on lpc18xx contains configuration register
> for two low power clocks. Support enabling of these two
> clocks with a clk driver that access CREG trough the
> syscon regmap interface.
> 
> These clocks are needed to support peripherals like the
> internal RTC on lpc18xx.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
