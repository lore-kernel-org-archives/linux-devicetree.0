From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V2 1/2] clk: vc5: Add bindings for IDT VersaClock
 5P49V5923 and 5P49V5933
Date: Fri, 20 Jan 2017 16:12:34 -0800
Message-ID: <20170121001234.GH20800@codeaurora.org>
References: <20170112010324.28068-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170112010324.28068-1-marek.vasut@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/12, Marek Vasut wrote:
> Add bindings for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips.
> These are I2C clock generators with optional clock source from
> either XTal or dedicated clock generator and, depending on the
> model, two or more clock outputs.
> 
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
