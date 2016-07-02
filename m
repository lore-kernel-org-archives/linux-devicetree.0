From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: fixed-factor: Allow for a few clocks to change
 the parent rate
Date: Fri, 1 Jul 2016 17:17:08 -0700
Message-ID: <20160702001708.GE27880@codeaurora.org>
References: <20160622091555.18415-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160622091555.18415-1-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Jongsung Kim <neidhard.kim@lge.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/22, Maxime Ripard wrote:
> The only way for a fixed factor clock to change its rate would be to change
> its parent rate.
> 
> Since passing blindly CLK_SET_RATE_PARENT might break a lot of platforms
> that were relying on the fact that the parent rate wouldn't change,
> introduce a compatible-based whitelist that will allow clocks to opt-in
> that flag.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
