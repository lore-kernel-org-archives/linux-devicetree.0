From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/7] regulator: anatop-regulator: convert to use
 imx-syscon to access anatop register
Date: Thu, 23 Aug 2012 15:32:04 +0800
Message-ID: <20120823073203.GH10057@shlinux2.ap.freescale.net>
References: <1345619928-15446-1-git-send-email-b29396@freescale.com>
 <1345619928-15446-5-git-send-email-b29396@freescale.com>
 <5035BDBF.9020602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5035BDBF.9020602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <paul.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2012 at 01:21:03PM +0800, Stephen Warren wrote:
> On 08/22/2012 01:18 AM, Dong Aisheng wrote:
> > Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> > diff --git a/drivers/regulator/anatop-regulator.c b/drivers/regulator/anatop-regulator.c
> 
> > @@ -109,7 +110,11 @@ static int __devinit anatop_regulator_probe(struct platform_device *pdev)
> >  	rdesc->ops = &anatop_rops;
> >  	rdesc->type = REGULATOR_VOLTAGE;
> >  	rdesc->owner = THIS_MODULE;
> > -	sreg->mfd = anatopmfd;
> > +
> > +	sreg->anatop = of_parse_phandle(np, "fsl,anatop", 0);
> > +	if (!sreg->anatop)
> > +		return -ENODEV;
> 
> In fact, that imx_syscon_lookup function I proposed could even do the
> of_parse_phandle() internally, so perhaps:
> 
> foo->syscon_dev = imx_syscon_lookup(np, "fsl,anatop", 0);
> if (IS_ERR(foo->syscon_dev))
>     return PTR_ERR(foo->syscon_dev);
> 
> with imx_syscon_lookup() internally knowing when to return EPROBE_DEFER
> rather than any other permanent error code (e.g. for missing property,
> bad phandle, etc.)
> 
This also looks reasonable to me.
btw, see my last reply to mark in another mail.
I'm not sure but Mark may want something slightly different as this one,
imx_syscon_lookup directly return regmap rather than dev, then we do not
need implement any register read/write API in imx-syscon driver, just
using the exist regmap r/w API is ok.

Regards
Dong Aisheng
