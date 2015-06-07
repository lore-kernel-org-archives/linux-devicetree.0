From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/4] base/platform: Remove code duplication
Date: Sun, 07 Jun 2015 15:32:20 +0100
Message-ID: <20150607143220.B3807C42468@trevor.secretlab.ca>
References: <1429797494-29242-1-git-send-email-ricardo.ribalda@gmail.com>
	<1429797494-29242-5-git-send-email-ricardo.ribalda@gmail.com>
	<CAL_JsqLOBvTgaLx7Ev3y5UQQdKGqMwnYSptDKvBQmmN0EnQL5Q@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLOBvTgaLx7Ev3y5UQQdKGqMwnYSptDKvBQmmN0EnQL5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 13 May 2015 09:03:31 -0500
, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> On Thu, Apr 23, 2015 at 8:58 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Failure path of platform_device_add was almost the same as
> > platform_device_del. Refactor same code in a function.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Clean-ups should come first in the series. Otherwise:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I disagree in this case, but only because the bug fix needs to be fixed
immediately, but the refactoring can wait for v4.1. Ricardo, if you can
confirm my patch solves the problem, then I'll push it to Linus, and you
can respin this patch to match.

g.

> 
> > ---
> >  drivers/base/platform.c | 60 +++++++++++++++++++++----------------------------
> >  1 file changed, 25 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 2e7e904..152d84d 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -298,6 +298,25 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
> >  }
> >  EXPORT_SYMBOL_GPL(platform_device_add_data);
> >
> > +static void platform_device_cleanout(struct platform_device *pdev, int n_res)
> > +{
> > +       int i;
> > +
> > +       if (pdev->id_auto) {
> > +               ida_simple_remove(&platform_devid_ida, pdev->id);
> > +               pdev->id = PLATFORM_DEVID_AUTO;
> > +       }
> > +
> > +       for (i = 0; i < n_res; i++) {
> > +               struct resource *r = &pdev->resource[i];
> > +               unsigned long type = resource_type(r);
> > +
> > +               if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> > +                               r->parent)
> > +                       release_resource(r);
> > +       }
> > +}
> > +
> >  /**
> >   * platform_device_add - add a platform device to device hierarchy
> >   * @pdev: platform device we're adding
> > @@ -371,23 +390,8 @@ int platform_device_add(struct platform_device *pdev)
> >                  dev_name(&pdev->dev), dev_name(pdev->dev.parent));
> >
> >         ret = device_add(&pdev->dev);
> > -       if (ret == 0)
> > -               return ret;
> > -
> > -       /* Failure path */
> > -       if (pdev->id_auto) {
> > -               ida_simple_remove(&platform_devid_ida, pdev->id);
> > -               pdev->id = PLATFORM_DEVID_AUTO;
> > -       }
> > -
> > -       while (--i >= 0) {
> > -               struct resource *r = &pdev->resource[i];
> > -               unsigned long type = resource_type(r);
> > -
> > -               if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> > -                               r->parent)
> > -                       release_resource(r);
> > -       }
> > +       if (ret)
> > +               platform_device_cleanout(pdev, i);
> >
> >         return ret;
> >  }
> > @@ -403,25 +407,11 @@ EXPORT_SYMBOL_GPL(platform_device_add);
> >   */
> >  void platform_device_del(struct platform_device *pdev)
> >  {
> > -       int i;
> > -
> > -       if (pdev) {
> > -               device_del(&pdev->dev);
> > -
> > -               if (pdev->id_auto) {
> > -                       ida_simple_remove(&platform_devid_ida, pdev->id);
> > -                       pdev->id = PLATFORM_DEVID_AUTO;
> > -               }
> > -
> > -               for (i = 0; i < pdev->num_resources; i++) {
> > -                       struct resource *r = &pdev->resource[i];
> > -                       unsigned long type = resource_type(r);
> > +       if (!pdev)
> > +               return;
> >
> > -                       if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
> > -                                       r->parent)
> > -                               release_resource(r);
> > -               }
> > -       }
> > +       device_del(&pdev->dev);
> > +       platform_device_cleanout(pdev, pdev->num_resources);
> >  }
> >  EXPORT_SYMBOL_GPL(platform_device_del);
> >
> > --
> > 2.1.4
> >

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
