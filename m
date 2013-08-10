Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:60577 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758787Ab3HJUd7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 10 Aug 2013 16:33:59 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so5536975pbc.30
        for <devicetree@vger.kernel.org>; Sat, 10 Aug 2013 13:33:59 -0700 (PDT)
Date: Sat, 10 Aug 2013 13:33:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 01/14] mtd: nand: pxa3xx: Introduce
 'marvell,armada370-nand' compatible string
Message-ID: <20130810203347.GA14331@norris.computersforpeace.net>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1375878679-18098-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130810182854.GA10830@norris.computersforpeace.net>
 <20130810184116.GA2756@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130810184116.GA2756@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Lior Amsalem <alior@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Daniel Mack <zonque@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 10, 2013 at 03:41:17PM -0300, Ezequiel Garcia wrote:
> On Sat, Aug 10, 2013 at 11:28:57AM -0700, Brian Norris wrote:
> > On Wed, Aug 07, 2013 at 09:31:06AM -0300, Ezequiel Garcia wrote:
> > > @@ -1221,11 +1239,28 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
> > >  
> > >  	return 0;
> > >  }
> > > +
> > > +static enum pxa3xx_nand_variant
> > > +pxa3xx_nand_get_variant(struct platform_device *pdev)
> > > +{
> > > +	const struct of_device_id *of_id =
> > > +			of_match_device(pxa3xx_nand_dt_ids, &pdev->dev);
> > > +	if (!of_id)
> > > +		return PXA3XX_NAND_VARIANT_PXA;
> > > +	return (enum pxa3xx_nand_variant) of_id->data;
> > > +}
> > >  #else
> > >  static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
> > >  {
> > >  	return 0;
> > >  }
> > 
> > It looks like before this patch, you don't actually need the whole
> > #ifdef/#else CONFIG_OF block. All the of_* helpers have default inline
> > implementations that allow things to compile even without CONFIG_OF. So
> > without CONFIG_OF, of_match_device() will just return NULL and the
> > compiler can easiliy figure out that pxa3xx_nand_probe_dt() always
> > should return 0.
> > 
> > IOW, you only need a single pxa3xx_nand_probe_dt() implementation.
> > 
> > And directly related to this patch: you don't need two
> > pxa3xx_nand_get_variant() implementations either. Again,
> > of_match_device() returns NULL in the !defined(CONFIG_OF) case.
> > 
> > > +
> > > +static enum pxa3xx_nand_variant
> > > +pxa3xx_nand_get_variant(struct platform_device *pdev)
> > > +{
> > > +	/* Default lefacy (non-DT) variant */
> > 
> > s/lefacy/legacy/
> > 
> > > +	return PXA3XX_NAND_VARIANT_PXA;
> > > +}
> > 
> > Given the above comments, you won't need this version of
> > pxa3xx_nand_get_variant().
> > 
> > >  #endif
> > >  
> > >  static int pxa3xx_nand_probe(struct platform_device *pdev)
> > > @@ -1252,6 +1287,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
> > >  	}
> > >  
> > >  	info = platform_get_drvdata(pdev);
> > > +	info->variant = pxa3xx_nand_get_variant(pdev);
> > >  	probe_success = 0;
> > >  	for (cs = 0; cs < pdata->num_cs; cs++) {
> > >  		info->cs = cs;
> > 
> > I would recommend rewriting this patch to remove the #ifdef CONFIG_OF.
> > 
> 
> Good to hear this! It was my intention in the first place, but refrained
> from doing so for I thought someone might complain about the CONFIG_OF removal.

As a general rule: the fewer #ifdef's the better. And in this case, the
emitted code should be identical (but I Am Not A Compiler).

> So if I remember correct, I'd say this means a patch split (right?):
> one patch to remove CONFIG_OF, one patch to introduce the SoC variant.

Sure. I presume you did that in v3, which I will now look at...

Brian
