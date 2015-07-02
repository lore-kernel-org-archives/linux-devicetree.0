From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: mediatek: mt8173: Fix enabling of critical
 clocks
Date: Thu, 2 Jul 2015 10:18:09 +0800
Message-ID: <1435803489.3526.18.camel@mtksdaap41>
References: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1435633127-31952-2-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omDqSEn_WnUYz0XmeRpejhthb0J_qa4H9VEfihtA0Axorg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omDqSEn_WnUYz0XmeRpejhthb0J_qa4H9VEfihtA0Axorg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Wed, 2015-07-01 at 22:21 +0800, Daniel Kurtz wrote:
> To be precise, it is the CLK_TOP clocks that have CLK_APMIXED PLLs as
> their parents, so we cannot enable the CLK_TOP critical clocks until
> the CLK_APMIXED clocks have all been registered.
> 
> Please add something like the above to the commit message.

OK. I'll add them.

> 
> >
> > +static struct clk_onecell_data *mt8173_top_clk_data;
> > +static struct clk_onecell_data *mt8173_pll_clk_data;
> 
> These globals can be:
> __initdata
> 
> > +
> > +static void mtk_clk_enable_critical(void)
> 
> And this function is:
> 
> static void __init

I'll add them in next patch.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
