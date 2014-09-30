From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH 2/6] hwrng: atmel: use clk_prepapre_enable/_disable_unprepare
Date: Tue, 30 Sep 2014 18:55:05 +0200
Message-ID: <87k34loxp2.fsf@dell.be.48ers.dk>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1412093987-30241-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412093987-30241-3-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
	(Boris Brezillon's message of "Tue, 30 Sep 2014 18:19:43 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Boris" == Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

 > Use clk_prepapre_enable/_disable_unprepare instead of clk_enable/disable
 > to work properly with the CCF.

s/prepapre/prepare/

Other than that, looks fine to me.

Acked-by: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>

 > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
 > ---
 >  drivers/char/hw_random/atmel-rng.c | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
 > index 851bc7e..644ec48 100644
 > --- a/drivers/char/hw_random/atmel-rng.c
 > +++ b/drivers/char/hw_random/atmel-rng.c
 > @@ -67,7 +67,7 @@ static int atmel_trng_probe(struct platform_device *pdev)
 >  	if (IS_ERR(trng->clk))
 >  		return PTR_ERR(trng->clk);
 
 > -	ret = clk_enable(trng->clk);
 > +	ret = clk_prepare_enable(trng->clk);
 >  	if (ret)
 >  		return ret;
 
 > @@ -95,7 +95,7 @@ static int atmel_trng_remove(struct platform_device *pdev)
 >  	hwrng_unregister(&trng->rng);
 
 >  	writel(TRNG_KEY, trng->base + TRNG_CR);
 > -	clk_disable(trng->clk);
 > +	clk_disable_unprepare(trng->clk);
 
 >  	return 0;
 >  }
 > @@ -105,7 +105,7 @@ static int atmel_trng_suspend(struct device *dev)
 >  {
 >  	struct atmel_trng *trng = dev_get_drvdata(dev);
 
 > -	clk_disable(trng->clk);
 > +	clk_disable_unprepare(trng->clk);
 
 >  	return 0;
 >  }
 > @@ -114,7 +114,7 @@ static int atmel_trng_resume(struct device *dev)
 >  {
 >  	struct atmel_trng *trng = dev_get_drvdata(dev);
 
 > -	return clk_enable(trng->clk);
 > +	return clk_prepare_enable(trng->clk);
 >  }
 
 >  static const struct dev_pm_ops atmel_trng_pm_ops = {
 > -- 
 > 1.9.1



-- 
Bye, Peter Korsgaard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
