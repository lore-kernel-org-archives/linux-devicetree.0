From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of: fix unittest build without CONFIG_OF_OVERLAY
Date: Fri, 28 Apr 2017 16:18:31 -0500
Message-ID: <20170428211831.2tvndexevfv5xx55@rob-hp-laptop>
References: <20170428094429.2396195-1-arnd@arndb.de>
 <20170428094429.2396195-2-arnd@arndb.de>
 <59036282.3050502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59036282.3050502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 08:40:50AM -0700, Frank Rowand wrote:
> On 04/28/17 02:44, Arnd Bergmann wrote:
> > We get a link error when the new tests are used by overlays
> > are not:
> > 
> > drivers/of/built-in.o: In function `unflatten_device_tree':
> > (.init.text+0x967): undefined reference to `unittest_unflatten_overlay_base'
> > 
> > This makes the #ifdef check match the symbols that lead to building
> > the unittest_unflatten_overlay_base function.
> > 
> > Fixes: 81d0848fc8d2 ("of: Add unit tests for applying overlays")
> > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > ---
> >  drivers/of/of_private.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> > index de5c604f5cc4..4ebb0149d118 100644
> > --- a/drivers/of/of_private.h
> > +++ b/drivers/of/of_private.h
> > @@ -55,7 +55,7 @@ static inline int of_property_notify(int action, struct device_node *np,
> >  }
> >  #endif /* CONFIG_OF_DYNAMIC */
> >  
> > -#ifdef CONFIG_OF_UNITTEST
> > +#if defined(CONFIG_OF_UNITTEST) && defined(CONFIG_OF_OVERLAY)
> >  extern void __init unittest_unflatten_overlay_base(void);
> >  #else
> >  static inline void unittest_unflatten_overlay_base(void) {};
> > 
> 
> I thought I had tested that OF_UNITTEST forced OF_OVERLAY.  But
> going back and trying again, I can confirm your results that it
> does not.  Thanks for catching this!
> 
> Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> Tested-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Both applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
