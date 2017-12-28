From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 04/15] clk: ingenic: Add code to enable/disable PLLs
Date: Thu, 28 Dec 2017 10:39:40 -0800
Message-ID: <20171228183940.GM7997@codeaurora.org>
References: <20170702163016.6714-2-paul@crapouillou.net>
 <20171228135634.30000-1-paul@crapouillou.net>
 <20171228135634.30000-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171228135634.30000-5-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/28, Paul Cercueil wrote:
> This commit permits the PLLs to be dynamically enabled and disabled when
> their children clocks are enabled and disabled.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
