From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 4/7] clk: mediatek: Add MT2701 clock support
Date: Wed, 24 Feb 2016 13:25:33 -0800
Message-ID: <20160224212533.2278.7597@quark.deferred.io>
References: <1454665050-37776-1-git-send-email-jamesjj.liao@mediatek.com>
 <1454665050-37776-5-git-send-email-jamesjj.liao@mediatek.com>
 <20160210200853.26445.15165@quark.deferred.io>
 <1455527982.29688.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1455527982.29688.8.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi James,

Quoting James Liao (2016-02-15 01:19:42)
> Hi Mike,
> 
> On Wed, 2016-02-10 at 12:08 -0800, Michael Turquette wrote:
> > Quoting James Liao (2016-02-05 01:37:27)
> > > +CLK_OF_DECLARE(mtk_topckgen, "mediatek,mt2701-topckgen", mtk_topckgen_init);
> > > +CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt2701-infracfg", mtk_infrasys_init);
> > > +CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt2701-pericfg", mtk_pericfg_init);
> > > +CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt2701-mmsys", mtk_mmsys_init);
> > > +CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt2701-imgsys", mtk_imgsys_init);
> > > +CLK_OF_DECLARE(mtk_vdecsys, "mediatek,mt2701-vdecsys", mtk_vdecsys_init);
> > > +CLK_OF_DECLARE(mtk_hifsys, "mediatek,mt2701-hifsys", mtk_hifsys_init);
> > > +CLK_OF_DECLARE(mtk_ethsys, "mediatek,mt2701-ethsys", mtk_ethsys_init);
> > > +CLK_OF_DECLARE(mtk_bdpsys, "mediatek,mt2701-bdpsys", mtk_bdpsys_init);
> > > +CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt2701-apmixedsys",
> > 
> > :-/
> > 
> > This is way too much CLK_OF_DECLARE and not enough Linux Driver Model.
> > 
> > I understand that some platforms really must initialize some clocks very
> > early, but can we please separate those into one table and call
> > CLK_OF_DECLARE on only that set, and then register the rest through a
> > platform_driver later on?
> 
> I know CLK_OF_DECLARE is much earlier than platform_driver, so it can
> ensure all drivers lookup their clocks successfully during
> platform_driver probe. Is there anything different to init these clock
> providers in CLK_OF_DECLARE and platform_driver?

This a common pattern we're seeing right now. Joachim did a nice job of
supporting early clocks with CLK_OF_DECLARE, and also using a proper
driver in his lpc18xx implementation:

http://marc.info/?l=devicetree&m=145618160610001

Regards,
Mike

> 
> 
> Best regards,
> 
> James
> 
> 
> 
