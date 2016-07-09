From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v9 01/10] clk: fix initial state of critical clock's
 parents
Date: Fri, 8 Jul 2016 17:46:43 -0700
Message-ID: <57804973.4050306@codeaurora.org>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
 <1466581229-2342-2-git-send-email-erin.lo@mediatek.com>
 <20160702012140.GB17071@codeaurora.org> <1467604308.26485.4.camel@mtksdaap41>
 <146802073038.73491.6675612765998057903@resonance>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <146802073038.73491.6675612765998057903@resonance>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>
Cc: Erin Lo <erin.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, John Crispin <blogic@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 07/08/2016 04:32 PM, Michael Turquette wrote:
> ---
>  drivers/clk/clk.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 820a939fb6bb..70efe4c4e0cc 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2449,8 +2449,14 @@ static int __clk_core_init(struct clk_core *core)
>  	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
>  		struct clk_core *parent = __clk_init_parent(orphan);
>  
> -		if (parent)
> -			clk_core_reparent(orphan, parent);
> +		/*
> +		 * we could call __clk_set_parent, but that would result in a
> +		 * reducant call to the .set_rate op, if it exists

Did you mean .set_parent op?

> +		 */
> +		if (parent) {
> +			__clk_set_parent_before(orphan, parent);
> +			__clk_set_parent_after(orphan, parent, NULL);
> +		}
>  	}
>  
>  	/*


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

