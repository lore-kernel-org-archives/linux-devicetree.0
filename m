From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH] of: add pre-operation notifications
Date: Thu, 25 Feb 2016 08:41:33 -0600
Message-ID: <alpine.DEB.2.10.1602250825420.2516@atull-730U3E-740U3E>
References: <1456352937-28311-1-git-send-email-atull@opensource.altera.com> <CAL_Jsq+YF-+frAJANSSEO60-O6dmavsE4PJ69VMwSjPAm0UJUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+YF-+frAJANSSEO60-O6dmavsE4PJ69VMwSjPAm0UJUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Feb 2016, Rob Herring wrote:

> On Wed, Feb 24, 2016 at 4:28 PM, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> > Add pre-apply and pre-remove notifications.
> >
> > For pre-apply notifications that result from creating an overlay,
> > include a device node to the overlay fragment in of_reconfig_data.
> >
> > If a pre-apply notifier return error, reject the changeset.
> 
> A couple of high level comments.
> 
> >
> > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > ---
> >  drivers/of/base.c    |   20 +++++++++++++
> >  drivers/of/dynamic.c |   79 +++++++++++++++++++++++++++++++++++++++++++++-----
> >  drivers/of/overlay.c |   46 +++++++++++++++++++++++++----
> >  include/linux/of.h   |    7 +++++
> >  4 files changed, 138 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 017dd94..6d170e0 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -1719,6 +1719,12 @@ int of_add_property(struct device_node *np, struct property *prop)
> >
> >         mutex_lock(&of_mutex);
> >
> > +       rc = of_property_notify(OF_RECONFIG_PRE_ADD_PROPERTY, np, prop, NULL);
> 
> Do we really need these for properties too? I thought nodes would be enough.

Yes, in my case programming the FPGA is triggered by properties being
added to a pre-existing node.  The pre-existing node is a fpga-region
which has phandles to the FPGA managers and bridges, so this stuff
would be in the tree before the overlay is applied.  When properties
are added (firmware-name, partial-fpga-config), the fpga region code
reprograms the FPGA and either returns success or error from the
notifier.  If programming succeeds, it returns success and the overlay
goes into the live tree as post-configuration information.  I've
cleaned up my bindings further, I should submit the latest version of
them.

> 
> [...]
> 
> > diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> > index 8225081..9d0c0d9 100644
> > --- a/drivers/of/overlay.c
> > +++ b/drivers/of/overlay.c
> > @@ -53,13 +53,30 @@ struct of_overlay {
> >         struct of_changeset cset;
> >  };
> >
> > +static int of_overlay_notify(unsigned long action, struct device_node *np,
> > +                            struct property *prop, struct property *old_prop,
> > +                            struct device_node *overlay)
> > +{
> > +       struct of_reconfig_data rd;
> > +
> > +       memset(&rd, 0, sizeof(rd));
> > +       rd.dn = np;
> > +       rd.prop = prop;
> > +       rd.old_prop = old_prop;
> > +       rd.overlay = overlay;
> > +       return of_reconfig_notify(action, &rd);
> > +}
> > +
> >  static int of_overlay_apply_one(struct of_overlay *ov,
> > -               struct device_node *target, const struct device_node *overlay);
> > +               struct device_node *target, struct device_node *overlay);
> >
> >  static int of_overlay_apply_single_property(struct of_overlay *ov,
> > -               struct device_node *target, struct property *prop)
> > +               struct device_node *target, struct property *prop,
> > +               struct device_node *overlay)
> >  {
> >         struct property *propn, *tprop;
> > +       unsigned long action;
> > +       int ret;
> >
> >         /* NOTE: Multiple changes of single properties not supported */
> >         tprop = of_find_property(target, prop->name, NULL);
> > @@ -74,6 +91,15 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
> >         if (propn == NULL)
> >                 return -ENOMEM;
> >
> > +       if (!tprop)
> > +               action = OF_RECONFIG_PRE_ADD_PROPERTY;
> > +       else
> > +               action = OF_RECONFIG_PRE_UPDATE_PROPERTY;
> > +
> > +       ret = of_overlay_notify(action, target, propn, tprop, overlay);
> > +       if (ret)
> > +               return ret;
> > +
> I don't understand why the notifier is in the overlay code. All the
> notifiers should be contained within the changeset code. Or if we do
> need changeset and overlay notifiers, they should be distinct.

Yes it's not great.  The only reason I put the notifier in the overlay
code was to include a pointer to the overlay.  That's only needed for
pre-apply notifiers as the rest of the notifiers have the rest of the
overlay available to be perused as part of the live tree, but not
pre-apply.

I could easily implement overlay notifications.  That code will be a
lot more compact than this patch.  It will only impact of.h and
overlay.c similar to the callback patch I proposed a few days ago.

Alan

> 
> >         /* not found? add */
> >         if (tprop == NULL)
> >                 return of_changeset_add_property(&ov->cset, target, propn);
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
