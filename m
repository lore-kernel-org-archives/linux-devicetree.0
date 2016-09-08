From: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] of: Add array read functions with min/max size
 limits
Date: Thu, 8 Sep 2016 16:46:01 +0100
Message-ID: <1473349561.4359.23.camel@rf-debian.wolfsonmicro.main>
References: <1473174121-19742-1-git-send-email-rf@opensource.wolfsonmicro.com>
         <1473174121-19742-2-git-send-email-rf@opensource.wolfsonmicro.com>
         <CAL_JsqJpOistyWyKvpVWUNR2d1umNwnZmpO2jFSi574umUNLOA@mail.gmail.com>
         <1473348852.4359.18.camel@rf-debian.wolfsonmicro.main>
         <CAL_Jsq+Rdw041Xnf8JRocozjeiOCDFaPcAQFM+emjeyrE4W=Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+Rdw041Xnf8JRocozjeiOCDFaPcAQFM+emjeyrE4W=Jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2016-09-08 at 10:38 -0500, Rob Herring wrote:
> On Thu, Sep 8, 2016 at 10:34 AM, Richard Fitzgerald
> <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > On Thu, 2016-09-08 at 09:46 -0500, Rob Herring wrote:
> >> On Tue, Sep 6, 2016 at 10:02 AM, Richard Fitzgerald
> >> <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> >> > Add a new set of array reading functions that take a minimum and
> >> > maximum size limit and will fail if the property size is not within
> >> > the size limits. This makes it more convenient for drivers that
> >> > use variable-size DT arrays which must be bounded at both ends -
> >> > data must be at least N entries but must not overflow the array
> >> > it is being copied into. It is also more efficient than making this
> >> > functionality out of existing public functions and avoids duplication.
> >> >
> >> > The existing array functions have been left in the API, since there
> >> > are a very large number of clients of those functions and their
> >> > existing functionality is still useful. This avoids turning a small
> >> > API improvement into a major kernel rework.
> 
> [...]
> 
> >> > @@ -1229,21 +1270,53 @@ EXPORT_SYMBOL_GPL(of_property_read_u32_index);
> >> >  int of_property_read_u8_array(const struct device_node *np,
> >> >                         const char *propname, u8 *out_values, size_t sz)
> >> >  {
> >> > -       const u8 *val = of_find_property_value_of_size(np, propname,
> >> > -                                               (sz * sizeof(*out_values)),
> >> > -                                               0,
> >> > -                                               NULL);
> >> > -
> >> > -       if (IS_ERR(val))
> >> > -               return PTR_ERR(val);
> >> > -
> >> > -       while (sz--)
> >> > -               *out_values++ = *val++;
> >> > -       return 0;
> >> > +       return of_property_read_variable_u8_array(np, propname, out_values,
> >> > +                                                 sz, 0);
> >>
> >> This should be min and max both set to sz.
> >
> > Passing 0 as max preserves the existing behaviour of these functions of
> > only requiring the array to be at least sz long, but not caring if it's
> > longer.
> 
> Yes, I was just writing to say that after reading patch 1 more carefully.
> 

Although at the same time I was realizing that actually my code is
broken for that and somehow I missed validating it in my testing.
The new functions validate the min and max against the DT entry size and
copy the actual number of elements. The old functions effectively
validate only the min and return that number of elements.

I'm just considering whether it's worth fixing my new functions to keep
the intention that max=0 duplicates the old behaviour, or not bother and
just keep the old functions.

> Rob


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
