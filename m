From: icenowy@aosc.io
Subject: Re: [PATCH v6 1/6] clk: sunxi-ng: div: Add support for fixed
 post-divider
Date: Sat, 12 Aug 2017 11:07:42 +0800
Message-ID: <d3ca32de91e857a8933fd570600cda17@aosc.io>
References: <cover.ba2aaaa405a7ec685034e34926b8855fd6c9ab86.1500043741.git-series.plaes@plaes.org>
 <946794e97ae2c36cd67c272099e8236a589efc28.1500043741.git-series.plaes@plaes.org>
 <20170717085235.i7pwwql5dgmnf6kk@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170717085235.i7pwwql5dgmnf6kk@flea>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Priit Laes <plaes@plaes.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jonathan Liu <net147@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi@googlegroups.com, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

在 2017-07-17 16:52，Maxime Ripard 写道：
> On Fri, Jul 14, 2017 at 05:49:23PM +0300, Priit Laes wrote:
>> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
>> 6 is fixed post-divider.
>> 
>> Signed-off-by: Priit Laes <plaes@plaes.org>
>> ---
>>  drivers/clk/sunxi-ng/ccu_div.c | 15 +++++++++++++--
>>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/clk/sunxi-ng/ccu_div.c 
>> b/drivers/clk/sunxi-ng/ccu_div.c
>> index c0e5c10..744502a 100644
>> --- a/drivers/clk/sunxi-ng/ccu_div.c
>> +++ b/drivers/clk/sunxi-ng/ccu_div.c
>> @@ -21,6 +21,9 @@ static unsigned long ccu_div_round_rate(struct 
>> ccu_mux_internal *mux,
>>  {
>>  	struct ccu_div *cd = data;
>> 
>> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
>> +		rate *= cd->fixed_post_div;
>> +
>>  	return divider_round_rate_parent(&cd->common.hw, parent,
>>  					 rate, parent_rate,
>>  					 cd->div.table, cd->div.width,
> 
> 
> You still haven't addressed the biggest issue with this patch, see:
> https://patchwork.kernel.org/patch/9825565/

I think he has already did the changes suggested in the review.

(P.S. during developing R40 CCU driver I found that pll-periph0-sata
also needs this patch, so I'm rechecking it)

> 
> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
