Return-Path: <SRS0=o39O=R6=gmail.com=rjwysocki@kernel.org>
MIME-Version: 1.0
References: <20190316113605.12928-1-sakari.ailus@linux.intel.com>
 <CAJZ5v0iNA3VVV_W+wSSJ0wzuByNUwpiEcMatuOT+f7dvQtPBkw@mail.gmail.com> <20190327095635.ozf4ttmiuyhm6u72@paasikivi.fi.intel.com>
In-Reply-To: <20190327095635.ozf4ttmiuyhm6u72@paasikivi.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Mar 2019 11:37:04 +0100
Message-ID: <CAJZ5v0g-vzOH_4QQ8SfiFONZSsy4hj7ZDWkq+kEV-aNrNX-Srg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Content-Type: text/plain; charset="UTF-8"
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 27, 2019 at 10:56 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> Thank you for the review.

No problem.  That's my job after all ...

[cut]

> >
> > > + *
> > > + * Flags may be set in order to obtain the endpoint instead of just returning
> > > + * the specified one or none at all, or to only return endpoints that belong to
> > > + * a device that is available.
> > > + *
> > > + * Use fwnode_handle_put() on the endpoint fwnode handle when done using it.
> >
> > I would say "The returned endpoint needs to be released by calling
> > fwnode_handle_put() on it when it is not necessary any more."
>
> How about s/necessary/needed/ ?

That works too.

> >
> > > + */
> > > +struct fwnode_handle *
> > > +fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
> > > +                               u32 port, u32 endpoint,
> > > +                               enum fwnode_graph_get_endpoint_flags flags)
> > > +{
> > > +       struct fwnode_handle *ep = NULL, *best_ep = NULL;
> > > +       unsigned int best_ep_id = 0;
> > > +       bool endpoint_next = flags & FWNODE_GRAPH_ENDPOINT_NEXT;
> >
> > I tend to apply !! to things like the right-hand side of the above to
> > get a proper bool value.
>
> It's not necessary: casting any non-zero value to bool is true.

Every nonzero value is regarded as "true" in C because of the lack of
a bool type in the language, but since we pretend to have one ...

> I couldn't find an authoritative reference tut it's not hard to find examples around
> the kernel, including arch/x86.
>
> >
> > > +       bool disabled = flags & FWNODE_GRAPH_DEVICE_DISABLED;
> >
> > I would call this "enabled_only" and reverse its meaning.
>
> Makes sense, that makes the code below easier to follow.
>
> >
> > > +
> > > +       while ((ep = fwnode_graph_get_next_endpoint(fwnode, ep))) {
> > > +               struct fwnode_endpoint fwnode_ep = { 0 };
> > > +               int ret;
> > > +
> > > +               /*
> > > +                * Check the device is available unless we're explicitly told
> > > +                * not to.
> > > +                */
> > > +               if (!disabled) {
> > > +                       struct fwnode_handle *dev;
> >
> > s/dev/dev_node/
> >
> > bool available;
> >
> > > +
> > > +                       dev = fwnode_graph_get_remote_port_parent(ep);
> >
> > available = fwnode_device_is_available(dev_node);
> > fwnode_handle_put(dev_node);
> > if (!available)
> >         continue;
>
> Yes, makes sense.
>
> >
> > > +
> > > +                       if (!fwnode_device_is_available(dev)) {
> > > +                               fwnode_handle_put(dev);
> > > +                               continue;
> > > +                       }
> > > +
> > > +                       fwnode_handle_put(dev);
> > > +               }
> > > +
> > > +               ret = fwnode_graph_parse_endpoint(ep, &fwnode_ep);
> > > +               if (ret < 0)
> > > +                       continue;
> > > +
> > > +               /* Check we have the right port. */
> > > +               if (fwnode_ep.port != port)
> > > +                       continue;
> > > +
> > > +               /* Is this an exact match? If so, return it immediately. */
> > > +               if (fwnode_ep.id == endpoint)
> > > +                       return ep;
> >
> > This appears to mean that the endpoint has been reference-counted, but
> > then the reference should be dropped before the "continue" above,
> > shouldn't it?
>
> This is handled by fwnode_graph_get_next_endpoint() which puts the previous
> endpoint on every iteration.

OK

> >
> > > +
> > > +               /* Is an exact match needed? If so, skip this one. */
> > > +               if (!endpoint_next)
> > > +                       continue;
> >
> > And here?
> >
> > Besides, the three comments above are redundant IMO (they don't
> > explain anything, but just repeat what the code does).
>
> Well, true; I thought they might be useful to understand what the function
> does. I have no problem removing them.

Yes, please drop them.

> >
> > > +
> > > +               /*
> > > +                * Is this endpoint better than we already had?
> > > +                */
> >
> > I would say in this comment "If the endpoint that has just been found
> > is not the first matching one and the ID of the one found previously
> > is closer to the requested endpoint ID, skip it."
>
> Yes.
>
> >
> > > +               if (fwnode_ep.id < endpoint ||
> > > +                   (best_ep && best_ep_id < fwnode_ep.id))
> >
> > Drop the fwnode_ep reference?
>
> fwnode_graph_parse_endpoint() takes no reference.

OK

> >
> > > +                       continue;
> > > +
> > > +               /* Replace the one we had with the newly found one. */
> >
> > Redundant comment.
>
> Removed.
>
> >
> > > +               fwnode_handle_put(best_ep);
> >
> > Does this always work if best_ep is NULL?
>
> Yes, the fwnode API functions (mostly?) are safe to call with NULL fwnode;
> at least this one is.

OK

> >
> > > +               best_ep = fwnode_handle_get(ep);
> > > +               best_ep_id = fwnode_ep.id;
> > > +       }
> > > +
> > > +       return best_ep;
> > > +}
> > > +EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);
> > > +
> > > +/**
> > >   * fwnode_graph_parse_endpoint - parse common endpoint node properties
> > >   * @fwnode: pointer to endpoint fwnode_handle
> > >   * @endpoint: pointer to the fwnode endpoint data structure
> > > diff --git a/include/linux/property.h b/include/linux/property.h
> > > index 3789ec755fb6..f3d924092890 100644
> > > --- a/include/linux/property.h
> > > +++ b/include/linux/property.h
> > > @@ -304,6 +304,25 @@ struct fwnode_handle *
> > >  fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
> > >                              u32 endpoint);
> > >
> > > +/**
> > > + * enum fwnode_graph_get_endpoint_flags - Flags for finding an endpoint
> > > + *
> > > + * @FWNODE_GRAPH_ENDPOINT_NEXT: if no specified endpoint is found, obtain the
> > > + *                             smallest endpoint number greater than specified
> >
> > "In the no exact match case, look for the closest endpoint ID greater
> > than the specified one."
>
> How about: "In the case of no exact match, ..."?

Sure.

> >
> > > + * @FWNODE_GRAPH_DEVICE_DISABLED that the device to which the remote
> >
> > Missing colon.
>
> Fixed.
>
> >
> > > + *                              endpoint of the given endpoint belongs to,
> > > + *                              may be disabled
> >
> > "Also return endpoints that belong to disabled devices."
> >
> > > + */
> > > +enum fwnode_graph_get_endpoint_flags {
> > > +       FWNODE_GRAPH_ENDPOINT_NEXT      = 0x00000001,
> >
> > BIT(1) ?
>
> BIT(0), BIT(1) below.

Right, sorry.
