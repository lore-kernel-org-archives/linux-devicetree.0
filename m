From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] devicetree: provide hook to allow setting
 devicetree device name
Date: Wed, 7 May 2014 16:21:09 +0100
Message-ID: <CACxGe6tdOytQT5D0ykptya1gaPeMeeJ0a0K4ZvUE9RmRmGMD0g@mail.gmail.com>
References: <536982E3.10303@gmail.com> <536983D0.8090307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536983D0.8090307-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 7, 2014 at 1:52 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>
> Optionally push devicetree device naming into a function called dynamically by
> of_device_alloc().
>
> TODO:
>    Change made to of_device_alloc() could also be made to
>    of_amba_device_create()
>
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>  drivers/of/platform.c |    2 ++
>  include/linux/of.h    |    2 ++
>  3 files changed, 43 insertions(+)
>
> Index: b/drivers/of/platform.c
> ===================================================================
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -179,6 +179,8 @@ struct platform_device *of_device_alloc(
>
>         if (bus_id)
>                 dev_set_name(&dev->dev, "%s", bus_id);
> +       else if (np->parent->of_device_make_bus_id)
> +               np->parent->of_device_make_bus_id(&dev->dev);

This isn't dangerous in the way the first patch is, but I don't want
to expose control over the naming scheme outside of the core code. It
would be too easy to get wrong and mess up other drivers. The problem
that is being hit is clearly a bug in the core DT code. It should be
naming devices so that there isn't a conflict. I think Rob's suggested
patch is the best fix.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
