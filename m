From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/3] clk: vc5: Add support for IDT VersaClock 5P49V5935
Date: Wed, 19 Apr 2017 09:09:46 -0700
Message-ID: <20170419160946.GX7065@codeaurora.org>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-4-git-send-email-alexey_firago@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491556344-9465-4-git-send-email-alexey_firago@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
To: Alexey Firago <alexey_firago@mentor.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, marek.vasut@gmail.com, geert@linux-m68k.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/07, Alexey Firago wrote:
> Update IDT VersaClock 5 driver to support 5P49V5935. This chip has
> two clock inputs (internal XTAL or external CLKIN), four fractional
> dividers (FODs) and five clock outputs (four universal clock outputs
> and one reference clock output at OUT0_SELB_I2C).
> 
> Current driver supports up to 2 FODs and up to 3 clock outputs. This
> patch sets max number of supported FODs to 4 and max number of supported
> clock outputs to 5.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
