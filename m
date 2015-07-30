From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 06/10] clk: mediatek: mt8173: Fix enabling of
 critical clocks
Date: Thu, 30 Jul 2015 10:23:33 +0800
Message-ID: <1438223013.17770.42.camel@mtksdaap41>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1438152754-11970-7-git-send-email-jamesjj.liao@mediatek.com>
	 <20150730002754.GG3159@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150730002754.GG3159-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, 2015-07-29 at 17:27 -0700, Stephen Boyd wrote:
> On 07/29, James Liao wrote:
> > From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > On the MT8173 the clocks are provided by different units. To enable
> > the critical clocks we must be sure that all parent clocks are already
> > registered, otherwise the parents of the critical clocks end up being
> > unused and get disabled later.
> > 
> > On MT8173, for example, it is the CLK_TOP clocks that have CLK_APMIXED
> > PLLs as their parents, so we cannot enable the CLK_TOP critical clocks
> > until the CLK_APMIXED clocks have all been registered.
> > 
> > To find a place where all parents are registered we try each time
> > after we've registered some clocks if all known providers are present
> > now and only then we enable the critical clocks.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> 
> Please move up to v4.2-rc2 so that this patch can be dropped. I
> already applied this and sent it off to Linus so it's in -rc2.

OK. I'll rebase to v4.2-rc2 in next patchset.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
