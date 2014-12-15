From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: Re: [PATCH v3 05/11] memory: add Atmel EBI (External Bus Interface) driver
Date: Mon, 15 Dec 2014 11:29:14 +0100
Message-ID: <6356167.d2upusqxqj@ws-stein>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <5455670.EDnhYEk7hP@kongar> <20141215112230.6fca1d69@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141215112230.6fca1d69@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 15 December 2014 11:22:30, Boris Brezillon wrote:
> Hi Alexander,
> 
> On Tue, 09 Dec 2014 21:53:12 +0100
> Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org> wrote:
> 
> > Hi,
> > 
> > On Monday 01 December 2014, 11:27:21 wrote Boris Brezillon:
> > > +static int at91_ebi_probe(struct platform_device *pdev)
> > > +{
> > > +	const struct of_device_id *match;
> > > +	struct device_node *child;
> > > +	struct device_node *np;
> > > +	struct at91_ebi *ebi;
> > > +	struct clk *clk;
> > > +	int ret;
> > > +
> > > +	match = of_match_device(at91_ebi_id_table, &pdev->dev);
> > > +	if (!match || !match->data)
> > > +		return -EINVAL;
> > > +
> > > +	ebi = devm_kzalloc(&pdev->dev, sizeof(*ebi), GFP_KERNEL);
> > > +	if (!ebi)
> > > +		return -ENOMEM;
> > > +
> > > +	ebi->caps = match->data;
> > > +	ebi->dev = &pdev->dev;
> > > +
> > > +	clk = devm_clk_get(&pdev->dev, NULL);
> > > +	if (IS_ERR(clk))
> > > +		return PTR_ERR(clk);
> > > +
> > > +	ebi->clk = clk;
> > > +
> > > +	np = of_parse_phandle(pdev->dev.of_node, "atmel,smc", 0);
> > > +	if (!np)
> > > +		return -EINVAL;
> > > +
> > > +	ebi->smc = syscon_node_to_regmap(np);
> > > +	if (IS_ERR(ebi->smc))
> > > +		return PTR_ERR(ebi->smc);
> > > +
> > > +	/*
> > > +	 * The sama5d3 does not provide an EBICSA register and thus does need
> > > +	 * to access the matrix registers.
> > > +	 */
> > > +	if (ebi->caps->ebi_csa) {
> > > +		np = of_parse_phandle(pdev->dev.of_node, "atmel,matrix", 0);
> > > +		if (np)
> >          ^^^^^^^
> > Shouldn't this be if (!np)?
> 
> Absolutely, thanks for pointing this out.
> I'll test on other at91 platforms (I currently only test on sama5d3
> boards, which do not have this EBICSA register) before submitting a new
> version.

Oh, well. I've noticed you posted a v4 of this patch which changed this specific code. I didn't noticed this.
I'll replace the old v3 and retry. I'm using this code on 9263 so far configuring EBI1 for a PSRAM. Works so far.
Once I exchanged patch 05/11 with your v4 I'll send my DT changes for 9263 to support this feature.

Best regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
