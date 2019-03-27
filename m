Return-Path: <SRS0=o39O=R6=gmail.com=rjwysocki@kernel.org>
MIME-Version: 1.0
References: <20190316113605.12928-1-sakari.ailus@linux.intel.com> <CAJZ5v0iNA3VVV_W+wSSJ0wzuByNUwpiEcMatuOT+f7dvQtPBkw@mail.gmail.com>
In-Reply-To: <CAJZ5v0iNA3VVV_W+wSSJ0wzuByNUwpiEcMatuOT+f7dvQtPBkw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Mar 2019 10:42:23 +0100
Message-ID: <CAJZ5v0hqzBiLWLCPa5tnTzbayNZ5HOy=gxt_VU_0QQFjHbt6hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Content-Type: text/plain; charset="UTF-8"
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

 On Tue, Mar 26, 2019 at 11:53 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sat, Mar 16, 2019 at 12:36 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > fwnode_graph_get_endpoint_by_id() is intended for obtaining local
> > endpoints by a given local port. fwnode_graph_get_endpoint_by_id() is
> > slightly different from its OF counterpart is
> > of_graph_get_endpoint_by_regs(): instead of using -1 as a value to signify
> > that a port or an endpoint number does not matter, it uses flags to look
> > for equal or greater endpoint. The port number is always fixed. It also
> > returns only remote endpoints that belong to an available device, a
> > behaviour that can be turned off with a flag.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> >
> > - Remove the PORT_NEXT flag.
> >
> > - Replace the ENDPOINT_AVAILABLE flag with DEVICE_DISABLED flag and
> >   so effectively inverting its functionality.
> >
> > - Rework the loop iterating over endpoint to find the best one. It's more
> >   simple and better commented now.
> >
> > - Fixes in indentation and documentation (e.g. fwnode_node_put ->
> >   fwnode_handle_put).
> >
> >  drivers/base/property.c  | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/property.h | 19 ++++++++++++
> >  2 files changed, 100 insertions(+)
> >
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 8b91ab380d14..7b908cadbdd5 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -984,6 +984,87 @@ fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port_id,
> >  EXPORT_SYMBOL_GPL(fwnode_graph_get_remote_node);
> >
> >  /**
> > + * fwnode_graph_get_endpoint_by_id - get endpoint node by port and endpoint
> > + *                                  numbers
>
> IMO you can drop "node" from the description line and then it will fit
> under 80 chars.
>
> > + * @fwnode: pointer to parent fwnode_handle containing the graph
>
> "pointer to" is redundant here IMO.
>
> > + * @port: identifier of the port node
> > + * @endpoint: identifier of the endpoint node under the port node
> > + * @flags: fwnode graph flags
>
> s/graph/lookup/ ?
>
> > + *
> > + * Returns the fwnode handle to the local endpoint corresponding the port and
>
> s/to/of/ ?
>
> Also there should be "corresponding to the port ..."
>
> And I would say "Return ..."
>
> > + * endpoint IDs or NULL if not found.
>
> I would say here "If FWNODE_GRAPH_ENDPOINT_NEXT is passed in @flags
> and the specified endpoint has not been found, look for the closest
> endpoint ID greater than the specified one and return the endpoint
> that corresponds to it, if present".
>
> Also "Do not return endpoints that belong to disabled devices, unless
> FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags".
>
> > + *
> > + * Flags may be set in order to obtain the endpoint instead of just returning
> > + * the specified one or none at all, or to only return endpoints that belong to
> > + * a device that is available.
> > + *
> > + * Use fwnode_handle_put() on the endpoint fwnode handle when done using it.
>
> I would say "The returned endpoint needs to be released by calling
> fwnode_handle_put() on it when it is not necessary any more."
>
> > + */
> > +struct fwnode_handle *
> > +fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
> > +                               u32 port, u32 endpoint,
> > +                               enum fwnode_graph_get_endpoint_flags flags)
> > +{
> > +       struct fwnode_handle *ep = NULL, *best_ep = NULL;
> > +       unsigned int best_ep_id = 0;
> > +       bool endpoint_next = flags & FWNODE_GRAPH_ENDPOINT_NEXT;
>
> I tend to apply !! to things like the right-hand side of the above to
> get a proper bool value.
>
> > +       bool disabled = flags & FWNODE_GRAPH_DEVICE_DISABLED;
>
> I would call this "enabled_only" and reverse its meaning.
>
> > +
> > +       while ((ep = fwnode_graph_get_next_endpoint(fwnode, ep))) {
> > +               struct fwnode_endpoint fwnode_ep = { 0 };
> > +               int ret;
> > +
> > +               /*
> > +                * Check the device is available unless we're explicitly told
> > +                * not to.
> > +                */
> > +               if (!disabled) {
> > +                       struct fwnode_handle *dev;
>
> s/dev/dev_node/
>
> bool available;
>
> > +
> > +                       dev = fwnode_graph_get_remote_port_parent(ep);
>
> available = fwnode_device_is_available(dev_node);
> fwnode_handle_put(dev_node);
> if (!available)
>         continue;
>
> > +
> > +                       if (!fwnode_device_is_available(dev)) {
> > +                               fwnode_handle_put(dev);
> > +                               continue;
> > +                       }
> > +
> > +                       fwnode_handle_put(dev);
> > +               }
> > +
> > +               ret = fwnode_graph_parse_endpoint(ep, &fwnode_ep);
> > +               if (ret < 0)
> > +                       continue;
> > +
> > +               /* Check we have the right port. */
> > +               if (fwnode_ep.port != port)
> > +                       continue;
> > +
> > +               /* Is this an exact match? If so, return it immediately. */
> > +               if (fwnode_ep.id == endpoint)
> > +                       return ep;
>
> This appears to mean that the endpoint has been reference-counted, but
> then the reference should be dropped before the "continue" above,
> shouldn't it?
>
> > +
> > +               /* Is an exact match needed? If so, skip this one. */
> > +               if (!endpoint_next)
> > +                       continue;
>
> And here?
>
> Besides, the three comments above are redundant IMO (they don't
> explain anything, but just repeat what the code does).
>
> > +
> > +               /*
> > +                * Is this endpoint better than we already had?
> > +                */
>
> I would say in this comment "If the endpoint that has just been found
> is not the first matching one and the ID of the one found previously
> is closer to the requested endpoint ID, skip it."
>
> > +               if (fwnode_ep.id < endpoint ||
> > +                   (best_ep && best_ep_id < fwnode_ep.id))
>
> Drop the fwnode_ep reference?
>
> > +                       continue;
> > +
> > +               /* Replace the one we had with the newly found one. */
>
> Redundant comment.
>
> > +               fwnode_handle_put(best_ep);
>
> Does this always work if best_ep is NULL?
>
> > +               best_ep = fwnode_handle_get(ep);
> > +               best_ep_id = fwnode_ep.id;
> > +       }
> > +
> > +       return best_ep;
> > +}
> > +EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);
> > +
> > +/**
> >   * fwnode_graph_parse_endpoint - parse common endpoint node properties
> >   * @fwnode: pointer to endpoint fwnode_handle
> >   * @endpoint: pointer to the fwnode endpoint data structure
> > diff --git a/include/linux/property.h b/include/linux/property.h
> > index 3789ec755fb6..f3d924092890 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -304,6 +304,25 @@ struct fwnode_handle *
> >  fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
> >                              u32 endpoint);
> >
> > +/**
> > + * enum fwnode_graph_get_endpoint_flags - Flags for finding an endpoint
> > + *
> > + * @FWNODE_GRAPH_ENDPOINT_NEXT: if no specified endpoint is found, obtain the
> > + *                             smallest endpoint number greater than specified
>
> "In the no exact match case, look for the closest endpoint ID greater
> than the specified one."
>
> > + * @FWNODE_GRAPH_DEVICE_DISABLED that the device to which the remote
>
> Missing colon.
>
> > + *                              endpoint of the given endpoint belongs to,
> > + *                              may be disabled
>
> "Also return endpoints that belong to disabled devices."
>
> > + */
> > +enum fwnode_graph_get_endpoint_flags {
> > +       FWNODE_GRAPH_ENDPOINT_NEXT      = 0x00000001,
>
> BIT(1) ?
>
> > +       FWNODE_GRAPH_DEVICE_DISABLED    = 0x00000002,
>
> BIT(2) ?
>
> > +};

Actually, enum types are not particularly suitable for flags in my
view, because something like

FWNODE_GRAPH_ENDPOINT_NEXT | FWNODE_GRAPH_DEVICE_DISABLED

is not really defined within the enum type, for example.

It's better to #define the flags IMO and use unsigned int as the type.
