From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 8/9] arm: dts: mt2701: Add clock controller device
 nodes
Date: Fri, 19 Aug 2016 13:42:11 +0800
Message-ID: <1471585331.8551.24.camel@mtksdaap41>
References: <1471332629-15722-1-git-send-email-erin.lo@mediatek.com>
         <1471332629-15722-9-git-send-email-erin.lo@mediatek.com>
         <20160819001805.GR361@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819001805.GR361-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-08-18 at 17:18 -0700, Stephen Boyd wrote:
> On 08/16, Erin Lo wrote:
> > From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > Add clock controller nodes for MT2701, include topckgen, infracfg,
> > pericfg, apmixedsys, mmsys, imgsys, vdecsys, hifsys, ethsys and
> > bdpsys. This patch also add two oscillators that provide clocks for
> > MT2701.
> > 
> > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> 
> This should go through arm-soc tree, so do you need a stable
> branch in clk tree to pull through arm-soc, or are we going to
> wait a release cycle on the dts patches?

Hi Stephen,

I prefer to wait a release cycle. We may merge clk driver first, then
merge dts patches in next kernel release.


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
