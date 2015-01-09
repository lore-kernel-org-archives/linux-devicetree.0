From: "George G. Davis" <ggdavisiv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers: of: Export of_reserved_mem_device_{init,release}
Date: Fri, 9 Jan 2015 13:33:10 -0500
Message-ID: <20150109183310.GA38065@gandalf.middle.earth.net>
References: <1420813745-130341-1-git-send-email-george_davis@mentor.com>
 <CAL_JsqJaT-Y7DHQS5ZZ0TP6r0iPDbUZwU-Kec5MSE7DOPgZxCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJaT-Y7DHQS5ZZ0TP6r0iPDbUZwU-Kec5MSE7DOPgZxCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "George G. Davis" <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 09, 2015 at 11:53:01AM -0600, Rob Herring wrote:
> On Fri, Jan 9, 2015 at 8:29 AM, George G. Davis <ggdavisiv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Export of_reserved_mem_device_{init,release} so that modules
> > can initialize and release their assigned per-device cma_area.
> 
> I believe the original intent was for the core bus code to call these
> functions. While the commit adding them says "automated assignment"
> that part did not go in.

I suspected that there may have been a bit of missing magic.  The only
use of these functions that I was able to find was in an earlier out of
tree patch series where these functions were called from the s5p-mfc
driver:

http://lists.linaro.org/pipermail/linaro-mm-sig/2014-August/004140.html

I agree that "automated assignment" via core bus code would be a better
solution but I don't know where to add the calls.

> As it stands, there are no in tree users of
> these functions.
> 
> Marek, comments?

Thanks!

--
Regards,
George

> 
> Rob
> 
> >
> > Signed-off-by: George G. Davis <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/of/of_reserved_mem.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> > index dc566b3..5eeb5b2 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -265,6 +265,7 @@ int of_reserved_mem_device_init(struct device *dev)
> >
> >         return ret;
> >  }
> > +EXPORT_SYMBOL(of_reserved_mem_device_init);
> >
> >  /**
> >   * of_reserved_mem_device_release() - release reserved memory device structures
> > @@ -289,3 +290,4 @@ void of_reserved_mem_device_release(struct device *dev)
> >
> >         rmem->ops->device_release(rmem, dev);
> >  }
> > +EXPORT_SYMBOL(of_reserved_mem_device_release);
> > --
> > 1.9.3
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
