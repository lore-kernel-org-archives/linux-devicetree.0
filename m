From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] watchdog: jz4740: Add DT support
Date: Tue, 27 Jan 2015 12:54:30 -0800
Message-ID: <20150127205430.GB6983@roeck-us.net>
References: <1422371490-44402-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1422371490-44402-3-git-send-email-Zubair.Kakakhel@imgtec.com>
 <2690526.hgsE0j4AZc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2690526.hgsE0j4AZc@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 27, 2015 at 09:15:37PM +0100, Arnd Bergmann wrote:
> On Tuesday 27 January 2015 15:11:30 Zubair Lutfullah Kakakhel wrote:
> >  };
> >  
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id jz4740_of_matches[] = {
> > +       { .compatible = "ingenic,jz4740-watchdog", },
> > +       { /* sentinel */ }
> > +};
> > +#endif
> > +
> >  static int jz4740_wdt_probe(struct platform_device *pdev)
> >  {
> >         struct jz4740_wdt_drvdata *drvdata;
> > @@ -211,6 +219,7 @@ static struct platform_driver jz4740_wdt_driver = {
> >         .remove = jz4740_wdt_remove,
> >         .driver = {
> >                 .name = "jz4740-wdt",
> > +               .of_match_table = of_match_ptr(jz4740_of_matches),
> >         },
> > 
> 
> Why the #ifdef? Presumably we want to move over jz4740 to DT-only in the
> long run, so you could just remove the #ifdef and the of_match_ptr()
> wrapper.
> 
Only if "depends on OF" is added to its Kconfig entry, or am I missing
something ?

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
