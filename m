From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/device: Fix of_device_get_modalias() buffer handling
Date: Thu, 24 Aug 2017 10:25:09 -0700
Message-ID: <20170824172509.GE29306@minitux>
References: <20170824010352.9085-1-bjorn.andersson@linaro.org>
 <CAL_JsqLqc488ALEqZT-PKw54h5QAbU=q=CEhM9jwROmukR7fZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLqc488ALEqZT-PKw54h5QAbU=q=CEhM9jwROmukR7fZg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 24 Aug 09:51 PDT 2017, Rob Herring wrote:

> On Wed, Aug 23, 2017 at 8:03 PM, Bjorn Andersson
> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
[..]
> > @@ -206,12 +207,16 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
> >         /* Name & Type */
> >         csize = snprintf(str, len, "of:N%sT%s", dev->of_node->name,
> >                          dev->of_node->type);
> > +       tsize = csize;
> >         len -= csize;
> > -       str += csize;
> > +       if (str)
> > +               str += csize;
> >
> >         of_property_for_each_string(dev->of_node, "compatible", p, compat) {
> > -               if (strlen(compat) + 2 > len)
> > -                       break;
> > +               csize = strlen(compat) + 1;
> > +               tsize += csize;
> > +               if (csize > len)
> > +                       continue;
> >
> >                 csize = snprintf(str, len, "C%s", compat);
> 
> We could just use the snprintf to give us the length. Something like
> this following the snprintf:
> 
> tsize +=csize;
> if (csize > len) {
>   if (len) {
>     str[0] = '\0';
>     len = 0;
>   }
>   continue;
> }
> 
> You'd need to prevent len from going negative up above too. It ends up
> being more lines but you save a strlen call. So perhaps it's fine as
> is, but since I've written it already throwing it out there...
> 

Indeed, I did attempt a few variants of this as well, but ended up
taking the cost of an extra strlen() to keep the complexity of the code
down.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
