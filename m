From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: at91: add ram controller DT support
Date: Thu, 8 Mar 2012 07:13:24 +0100
Message-ID: <20120308061324.GE27213@game.jcrosoft.org>
References: <20120302192844.GB21255@game.jcrosoft.org>
 <1330718048-9314-5-git-send-email-plagnioj@jcrosoft.com>
 <4F57BDCE.1050708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F57BDCE.1050708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > diff --git a/arch/arm/mach-at91/include/mach/at91sam9x5.h b/arch/arm/mach-at91/include/mach/at91sam9x5.h
> > index a297a77..88e43d5 100644
> > --- a/arch/arm/mach-at91/include/mach/at91sam9x5.h
> > +++ b/arch/arm/mach-at91/include/mach/at91sam9x5.h
> > @@ -55,11 +55,6 @@
> >  #define AT91SAM9X5_BASE_USART2	0xf8024000
> >  
> >  /*
> > - * System Peripherals
> > - */
> > -#define AT91SAM9X5_BASE_DDRSDRC0	0xffffe800
> > -
> > -/*
> >   * Base addresses for early serial code (uncompress.h)
> >   */
> >  #define AT91_DBGU	AT91_BASE_DBGU0
> > diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
> > index 3e48b59..f86450d 100644
> > --- a/arch/arm/mach-at91/setup.c
> > +++ b/arch/arm/mach-at91/setup.c
> > @@ -315,12 +315,33 @@ static void at91_dt_rstc(void)
> >  	of_node_put(np);
> >  }
> >  
> > +static struct of_device_id ramc_ids[] = {
> > +	{ .compatible = "atmel,at91sam9260-sdramc" },
> > +	{ .compatible = "atmel,at91sam9g45-ddramc" },
> > +	{ /*sentinel*/ }
> > +};
> > +
> > +static void at91_dt_ramc(void)
> > +{
> > +	struct device_node *np;
> > +
> > +	np = of_find_matching_node(NULL, ramc_ids);
> > +	if (!np)
> > +		panic("unable to find compatible ram conroller node in dtb\n");
> 
> You really can't boot if this fails? A WARN is better if it allows you
> to boot until at least your console is actually up.
if the restart is called you will have a oops so no it's a basic mandatory
device on at91

Best Regards,
J.
