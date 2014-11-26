From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of: add optional options parameter to
 of_find_node_by_path()
Date: Wed, 26 Nov 2014 22:19:03 +0000
Message-ID: <20141126221903.GI2361@bivouac.eciton.net>
References: <1417023640-23464-1-git-send-email-leif.lindholm@linaro.org>
 <1417023640-23464-2-git-send-email-leif.lindholm@linaro.org>
 <CACxGe6tQ5rWzCUcS+_fFY+rjEyua2khApAoCVKpTuJAghU=N_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6tQ5rWzCUcS+_fFY+rjEyua2khApAoCVKpTuJAghU=N_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Ian Campbell <ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 09:06:33PM +0000, Grant Likely wrote:
> On Wed, Nov 26, 2014 at 5:40 PM, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Update of_find_node_by_path():
> > 1) Ignore any part of the path beyond and including the ':' separator.
> > 2) Set the new provided pointer argument to the beginning of the string
> >    following the ':' separator.
> >
> > Coccinelle fixup using:
> >
> > @@
> > expression E1;
> > @@
> >
> > - of_find_node_by_path(E1)
> > + of_find_node_by_path(E1, NULL)
> >
> > drivers/of/resolver.c manually updated, since spatch fails to parse
> > it correctly.
> >
> > Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Okay, so you're probably going to kill me for the next comment...
> After actually looking at this I can see that it's going to be a hard
> patch to merge because of conflicts. It will need to be merged at the
> end of a merge window to catch all the users, but that will mean that
> the important part of the patch won't be able to be queued up in
> linux-next.

Not to worry - I'll simply keep this to guilt trip you with at some
point in the future.

Seeing get_maintainer take 1m42s on a quad-i7 with the entire kernel
tree in disk cache was nearly reward enough :)

> So you were right the first time around. Create a new function name
> that adds the extra argument and make of_find_node_by_path() a static
> inline wrapper. That way I can queue it up into linux-next immediately
> and the cleanup across the tree can be generated and submitted at the
> very end of the merge window.

That will also make it a lot less invasive to potentially get it
backported to debian-kernel, so we can have this support for the
Jessie installer.

I'll whip that up tomorrow morning.

/
    Leif

> > @@ -380,7 +380,8 @@ static inline struct device_node *of_find_matching_node_and_match(
> >         return NULL;
> >  }
> >
> > -static inline struct device_node *of_find_node_by_path(const char *path)
> > +static inline struct device_node *of_find_node_by_path(const char *path,
> > +       char **opts)
> 
> const char **opts
> 
> >  {
> >         return NULL;
> >  }
> > diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> > index e695517..0056963 100644
> > --- a/sound/soc/fsl/fsl_ssi.c
> > +++ b/sound/soc/fsl/fsl_ssi.c
> > @@ -1427,7 +1427,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
> >          * device tree.  We also pass the address of the CPU DAI driver
> >          * structure.
> >          */
> > -       sprop = of_get_property(of_find_node_by_path("/"), "compatible", NULL);
> > +       sprop = of_get_property(of_find_node_by_path("/", NULL), "compatible", NULL);
> >         /* Sometimes the compatible name has a "fsl," prefix, so we strip it. */
> >         p = strrchr(sprop, ',');
> >         if (p)
> > --
> > 1.7.10.4
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
