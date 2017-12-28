From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 02/15] clk: ingenic: Fix recalc_rate for clocks with
 fixed divider
Date: Thu, 28 Dec 2017 10:36:06 -0800
Message-ID: <20171228183606.GI7997@codeaurora.org>
References: <20170702163016.6714-2-paul@crapouillou.net>
 <20171228135634.30000-1-paul@crapouillou.net>
 <20171228135634.30000-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171228135634.30000-3-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/28, Paul Cercueil wrote:
> Previously, the clocks with a fixed divider would report their rate
> as being the same as the one of their parent, independently of the
> divider in use. This commit fixes this behaviour.
> 
> This went unnoticed as neither the jz4740 nor the jz4780 CGU code
> have clocks with fixed dividers yet.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
