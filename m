From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 1/7] clk: mediatek: Add fixed clocks support for
 Mediatek SoC.
Date: Tue, 28 Jul 2015 13:10:45 +0800
Message-ID: <1438060245.17770.11.camel@mtksdaap41>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1437706925-3222-2-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omAhnqy7AZ6x7QoEez3Fq8ghkj5_DrNCf18c0AO+aKnoyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omAhnqy7AZ6x7QoEez3Fq8ghkj5_DrNCf18c0AO+aKnoyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, 2015-07-24 at 19:33 +0800, Daniel Kurtz wrote:
> Hi James,
> 
> On Fri, Jul 24, 2015 at 11:01 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >
> > +void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
> > +               struct clk_onecell_data *clk_data)
> 
> 
> void __init mtk_clk_register_fixed_clks(...

It will be added in next patch.


> > -extern void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> > +void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
> 
> Technically, this hunk is unrelated and should probably be in its own patch.

It will be in a separated patch.


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
