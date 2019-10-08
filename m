From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v11 3/6] of: property: Add functional dependency link from
 DT bindings
Date: Tue, 8 Oct 2019 11:57:49 -0700
Message-ID: <CAGETcx-FjF+bktBgL6h0ORH3MU4vMM9JNC2oB8Myn8KqvnmhDg@mail.gmail.com>
References: <20190904211126.47518-1-saravanak@google.com> <20190904211126.47518-4-saravanak@google.com>
 <20190911102926.A9F8D2082C@mail.kernel.org> <20191004153750.GB823823@kroah.com>
 <20191008145304.2BD54205F4@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008145304.2BD54205F4@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-acpi@vger.kernel.org, clang-built-linux <clang-built-linux@googlegroups.com>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>, kbuild test robot <lkp@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 8, 2019 at 7:53 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Greg Kroah-Hartman (2019-10-04 08:37:50)
> > On Wed, Sep 11, 2019 at 03:29:25AM -0700, Stephen Boyd wrote:
> > > Quoting Saravana Kannan (2019-09-04 14:11:22)
> > > > +       int ret = 0;
> > > > +       struct device_node *tmp_np = sup_np;
> > > > +
> > > > +       of_node_get(sup_np);
> > > > +       /*
> > > > +        * Find the device node that contains the supplier phandle.  It may be
> > > > +        * @sup_np or it may be an ancestor of @sup_np.
> > > > +        */
> > > > +       while (sup_np && !of_find_property(sup_np, "compatible", NULL))
> > > > +               sup_np = of_get_next_parent(sup_np);
> > >
> > > I don't get this. This is assuming that drivers are only probed for
> > > device nodes that have a compatible string? What about drivers that make
> > > sub-devices for clk support that have drivers in drivers/clk/ that then
> > > attach at runtime later? This happens sometimes for MFDs that want to
> > > split the functionality across the driver tree to the respective
> > > subsystems.
> >
> > For that, the link would not be there, correct?
>
> The parent device (MFD) would have the links because that is the device
> node with the provider property like '#clock-cells'. The child clk
> device that's populated by the MFD would be the one actually providing
> the clk via a driver that may probe any time later, or never, depending
> on if the clk driver is configured as a module or not. I fail to see how
> this will work for these cases.
>
> Is this logic there to find the parent of a regulator phandle and match
> that to some driver? It looks like it.

In the case of an MFD creating "fake" children devices, the parent MFD
device's driver is responsible for handling the sync state callback.
It'll get the sync_state callback after all the child devices'
consumers have probed. The MFD driver will need to do the sync state
clean up for the children devices or pass it on to the child devices'
drivers (whatever makes sense for that specific MFD) by whatever means
those specific drivers talk to each other (direct calls, registering
callbacks, etc).

If they are real sub-devices, then they should really be captured in
DT as child devices and then the child device's drivers will get the
sync state callback directly.

> >
> > > > +static int of_link_property(struct device *dev, struct device_node *con_np,
> > > > +                            const char *prop_name)
> > > > +{
> > > > +       struct device_node *phandle;
> > > > +       const struct supplier_bindings *s = bindings;
> > > > +       unsigned int i = 0;
> > > > +       bool matched = false;
> > > > +       int ret = 0;
> > > > +
> > > > +       /* Do not stop at first failed link, link all available suppliers. */
> > > > +       while (!matched && s->parse_prop) {
> > > > +               while ((phandle = s->parse_prop(con_np, prop_name, i))) {
> > > > +                       matched = true;
> > > > +                       i++;
> > > > +                       if (of_link_to_phandle(dev, phandle) == -EAGAIN)
> > > > +                               ret = -EAGAIN;
> > >
> > > And don't break?
> >
> > There was comments before about how this is not needed.  Frank asked
> > that the comment be removed.  And now you point it out again :)
> >
> > Look at the comment a few lines up, we have to go through all of the
> > suppliers.
> >
>
> Ok. The comment tells me what is happening but it misses the essential
> part which is _why_ we must make links to each supplier and return
> -EAGAIN.

To be clear the -EAGAIN is only if any of the linking fails.

The reason was already discussion in the email thread [1] but I agree
it needs to be documented.

I thought I had documented the _why_ in the documentation for
fwnode.add_links(), but it's not there. I'll check to make sure I
didn't capture it elsewhere and if not, I'll update fwnode.add_links
documentation.

To copy-paste the discussion from the earlier thread:

"Actually, there is a point for this. Say Device-C depends on suppliers
Device-S1 and Device-S2 and they are listed in DT in that order.

Say, S1 gets populated after late_initcall_sync but S2 is probes way
before that. If I don't continue past a "failed linking" to S1 and
also link up to S2, then S2 will get a sync_state() callback before C
is probed. So I have to go through all possible suppliers and [link] as many
as possible."

-Saravana

[1] - https://lore.kernel.org/lkml/CAGETcx-hCrUvY5whZBihueqqCxmF3oDjFybjmoo3JUu87iiiEw@mail.gmail.com/
