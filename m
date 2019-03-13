Return-Path: <SRS0=DUYD=RQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:31087 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726938AbfCMTGg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 Mar 2019 15:06:36 -0400
Date: Wed, 13 Mar 2019 21:06:27 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Message-ID: <20190313190627.lb3nuy6gkx7b6tvr@kekkonen.localdomain>
References: <20190313164246.23321-1-sakari.ailus@linux.intel.com>
 <CAL_JsqJQYSiUp4U5iVqLiPMdWPRYsec-RpFLwqWChDB45xOu4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJQYSiUp4U5iVqLiPMdWPRYsec-RpFLwqWChDB45xOu4Q@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for the review.

On Wed, Mar 13, 2019 at 01:34:00PM -0500, Rob Herring wrote:
> On Wed, Mar 13, 2019 at 11:51 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > fwnode_graph_get_endpoint_by_id() is intended for obtaining local
> > endpoints by a given port number or both endpoint and port numbers.
> > fwnode_graph_get_endpoint_by_id() is slightly different from its OF
> > counterpart is of_graph_get_endpoint_by_regs(): instead of using -1 as a
> > value to signify that a port or an endpoint number does not matter, it
> > uses flags to look for equal or greater port or endpoint. It also
> > implements a flag to return only endpoints that point to a remote device
> > which is available, i.e. those that a driver generally would be interested
> > in.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Rafael, Rob, others,
> >
> > I'd like to add this in order to move away from iterative graph endpoint
> > parsing in V4L2 drivers. As noted above, the functionality is not an exact
> > match with the OF counterpart, but the OF counterpart provides less
> > functionality than what a driver gets by using the old existing iterative
> > API. If you like, I can add a function that is an exact match, but I'd
> > like to have this one as well.
> 
> I certainly agree with drivers asking for specific port/endpoint
> rather than iterating.
> 
> > Most drivers will in practice just get the first endpoint from ports
> > they're interested in. I'll post the V4L2 patches in the near future.
> >
> >  drivers/base/property.c  | 78 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/property.h | 22 ++++++++++++++
> >  2 files changed, 100 insertions(+)
> >
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 8b91ab380d14..b77bb9cf7d56 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -984,6 +984,84 @@ fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port_id,
> >  EXPORT_SYMBOL_GPL(fwnode_graph_get_remote_node);
> >
> >  /**
> > + * fwnode_graph_get_endpoint_by_id - get endpoint node by port and endpoint
> > + *                                    numbers
> > + * @fwnode: pointer to parent fwnode_handle containing the graph
> > + * @port: identifier of the port node
> > + * @endpoint: identifier of the endpoint node under the port node
> > + * @flags: fwnode graph flags
> > + *
> > + * Returns the fwnode handle to the local endpoint corresponding the port and
> > + * endpoint IDs or NULL if not found.
> > + *
> > + * Flags may be set in order to obtain the next port or endpoint instead of just
> > + * returning the specified one or none at all, or to only return endpoints that
> > + * belong to a device that is available.
> > + *
> > + * Use fwnode_node_put() on the endpoint fwnode handle when done using it.
> > + */
> > +struct fwnode_handle *
> > +fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
> > +                                 u32 port, u32 endpoint,
> > +                                 enum fwnode_graph_get_endpoint_flags flags)
> > +{
> > +       struct fwnode_handle *ep = NULL, *best_ep = NULL;
> > +       unsigned int best_ep_id = 0, best_port_id = 0;
> > +       bool port_next = flags & FWNODE_GRAPH_PORT_NEXT;
> 
> I'm failing to come up with a scenario where just returning the next
> port would be right thing to do.

Right. I haven't used that in the two driver patches I wrote but I added it
for completeness (related endpoint flag). I have no objections to dropping
that.

> 
> > +       bool endpoint_next = flags & FWNODE_GRAPH_ENDPOINT_NEXT;
> 
> This one I can see in cases of where we have fan out or muxed connection.
> 
> > +       bool available = flags & FWNODE_GRAPH_ENDPOINT_AVAILABLE;
> 
> I really think 'available' should be the default. It's a source of
> bugs that we fail to check 'status'. 'disabled' should really be the
> same as the node not present in most cases. There are some exceptions
> like cpus where it is supposed to mean the core is off and needs to be
> onlined (though ARM never followed that).

I agree. How about e.g.
FWNODE_GRAPH_(ENDPOINT,DEVICE)_(UNAVAILABLE,DISABLED)?

> 
> > +
> > +       while ((ep = fwnode_graph_get_next_endpoint(fwnode, ep))) {
> 
> By iterating internally, that doesn't help towards getting rid of the
> OF iterator functions completely. But it is fine as I'm not really
> sure that will ever happen.

Well, the internal implementation here indeed relies on the old API. I
guess you could first find the port --- for which you still need to loop
over the port nodes, and then figure out the right endpoint. That actually
makes sense as this way the entire graph doesn't need to be searched every
time a particular port is accessed.

> 
> > +               struct fwnode_endpoint fwnode_ep = { 0 };
> > +               int ret;
> > +
> > +               if (available) {
> > +                       struct fwnode_handle *dev;
> > +
> > +                       dev = fwnode_graph_get_remote_port_parent(ep);
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
> > +               if (port_next) {
> > +                       if (fwnode_ep.port < port ||
> > +                           (best_ep && best_port_id < fwnode_ep.port))
> > +                               continue;
> > +               } else if (fwnode_ep.port != port) {
> > +                       continue;
> > +               }
> > +
> > +               if (endpoint_next) {
> > +                       if (fwnode_ep.id < endpoint ||
> > +                           (best_ep && best_ep_id < fwnode_ep.id))
> > +                               continue;
> > +               } else if (fwnode_ep.id != endpoint) {
> > +                       continue;
> > +               }
> > +
> > +               if (!port_next && !endpoint_next)
> > +                       return ep;
> > +
> > +               fwnode_handle_put(best_ep);
> > +               best_ep = fwnode_handle_get(ep);
> > +               best_port_id = fwnode_ep.port;
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
> > index 3789ec755fb6..40db39ac1969 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -304,6 +304,28 @@ struct fwnode_handle *
> >  fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
> >                              u32 endpoint);
> >
> > +/**
> > + * enum fwnode_graph_get_endpoint_flags - Flags for finding an endpoint
> > + *
> > + * @FWNODE_GRAPH_PORT_NEXT: if no specified port is found, pick the smallest one
> > + *                         found which is greater than specified
> > + * @FWNODE_GRAPH_ENDPOINT_NEXT: if no specified endpoint is found, obtain the
> > + *                             smallest endpoint number greater than specified
> > + * @FWNODE_GRAPH_ENDPOINT_AVAILABLE: require that the device to which the remote
> > + *                                  endpoint of the given endpoint belongs to,
> > + *                                  is available
> > + */
> > +enum fwnode_graph_get_endpoint_flags {
> > +       FWNODE_GRAPH_PORT_NEXT          = 0x00000001,
> > +       FWNODE_GRAPH_ENDPOINT_NEXT      = 0x00000002,
> > +       FWNODE_GRAPH_ENDPOINT_AVAILABLE = 0x00000004,
> > +};
> > +
> > +struct fwnode_handle *
> > +fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
> > +                                 u32 port, u32 endpoint,
> > +                                 enum fwnode_graph_get_endpoint_flags flags);
> > +
> >  #define fwnode_graph_for_each_endpoint(fwnode, child)                  \
> >         for (child = NULL;                                              \
> >              (child = fwnode_graph_get_next_endpoint(fwnode, child)); )

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
