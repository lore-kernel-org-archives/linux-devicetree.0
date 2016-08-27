From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v12 2/4] reset: mediatek: Add MT2701 reset driver
Date: Sat, 27 Aug 2016 12:21:12 +0800
Message-ID: <1472271672.21203.17.camel@mtksdaap41>
References: <1471854565-19810-1-git-send-email-erin.lo@mediatek.com>
 <1471854565-19810-3-git-send-email-erin.lo@mediatek.com>
 <20160824175049.GC19826@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160824175049.GC19826-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-08-24 at 10:50 -0700, Stephen Boyd wrote:
> On 08/22, Erin Lo wrote:
> > diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
> > index 18b4ab5..702fd74 100644
> > --- a/drivers/clk/mediatek/clk-mt2701-hif.c
> > +++ b/drivers/clk/mediatek/clk-mt2701-hif.c
> > @@ -52,11 +52,15 @@ static int mtk_hifsys_init(struct device_node *node)
> >  						clk_data);
> >  
> >  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > -	if (r)
> > +	if (r) {
> >  		pr_err("%s(): could not register clock provider: %d\n",
> >  			__func__, r);
> > +		return r;
> > +	}
> > +
> > +	mtk_register_reset_controller(node, 1, 0x34);
> 
> The cleanup here isn't great. mtk_register_reset_controller()
> should really return an error so that we can properly cleanup if
> needed. Fixing that in a later patch would be a good idea.

Hi Stephen,

I think so. This function returns void because it was invoked in
CLK_OF_DECLARE() in previous SoC's drivers. I'll investigate how to make
it return an error code without breaking backward compatibility.


Best regards,

James
