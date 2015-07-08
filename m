From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] Add MT8173 MMPLL change rate support
Date: Wed, 8 Jul 2015 16:49:54 +0800
Message-ID: <1436345394.3526.111.camel@mtksdaap41>
References: <1436344666-25645-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436344666-25645-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

The cover letter's title should be "[PATCH v2 0/2] ..."

changes since v1:
- Add a separated patch for mtk_pll_set_rate_regs().
- Use a structure array to describe a div_table.
- Limit max frequency to div_table[0].
- Minor changes such as static and comments.


Best regards,

James

On Wed, 2015-07-08 at 16:37 +0800, James Liao wrote:
> MT8173 MMPLL frequency settings are different from common PLLs.
> It needs different post divider settings for some ranges of frequency.
> This patch add support for MT8173 MMPLL frequency setting, includes:
> 
> 1. Add div-rate table for PLLs.
> 2. Increase the max ost divider setting from 3 (/8) to 4 (/16).
> 3. Write postdiv and pcw settings at the same time.
> 
> James Liao (2):
>   clk: mediatek: Fix PLL registers setting flow
>   clk: mediatek: Add MT8173 MMPLL change rate support
> 
>  drivers/clk/mediatek/clk-mt8173.c | 24 +++++++++++++++++++++---
>  drivers/clk/mediatek/clk-mtk.h    |  6 ++++++
>  drivers/clk/mediatek/clk-pll.c    | 39 +++++++++++++++++++++++++++------------
>  3 files changed, 54 insertions(+), 15 deletions(-)
> 
> --
> 1.8.1.1.dirty
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
