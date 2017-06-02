From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: Provide dummy of_clk_get_from_provider() for
 compile-testing
Date: Fri, 2 Jun 2017 10:49:11 -0700
Message-ID: <20170602174911.GK20170@codeaurora.org>
References: <1493384933-31297-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493384933-31297-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/28, Geert Uytterhoeven wrote:
> When CONFIG_ON=n, dummies are provided for of_clk_get() and
> of_clk_get_by_name(), but not for of_clk_get_from_provider().
> 
> Provide a dummy for the latter, to improve the ability to do
> compile-testing.  This requires removing the existing dummy in the
> Lantiq clock code.
> 
> Fixes: 766e6a4ec602d0c1 ("clk: add DT clock binding support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
