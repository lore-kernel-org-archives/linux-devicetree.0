From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: introduces helper to manage optional property
Date: Thu, 16 Jan 2014 17:26:17 +0000
Message-ID: <20140116172617.97C28C40973@trevor.secretlab.ca>
References: <1388035115-893-1-git-send-email-Li.Xiubo@freescale.com> < 20140106162609.GG24664@e106331-lin.cambridge.arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140106162609.GG24664-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 6 Jan 2014 16:26:09 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Thu, Dec 26, 2013 at 05:18:35AM +0000, Xiubo Li wrote:
> > Gets to know whether one optional property is present or not in one
> > device node. Returns true if the property is present, false otherwise.
> > 
> > There is one similar helper of_property_read_bool(), but it means that
> > the property is one boolen type. For many drivers, they need to know
> > whether one optional property is present or not firstly. Though many
> > other of_XX helper can do this before deal with it's real work, there
> > maybe other errors the driver need to deal with, and the errors maybe
> > the same with the property absent error. And this helper can make the
> > code briefer,more readable and easier to deal with.
> > 
> > Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  include/linux/of.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 276c546..0bd8cb9 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -601,6 +601,23 @@ static inline int of_property_read_u32(const struct device_node *np,
> >  	return of_property_read_u32_array(np, propname, out_value, 1);
> >  }
> >  
> > +/**
> > + * of_property_optional - Find one optional property
> 
> If we really do need something like this, it would be better named
> of_property_present (and can alias of_property_read_bool internally).

I would rather not add an alias or new function for this is possible
given that existing functions (of_find_property and
of_property_read_bool provide the same behavour)

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
