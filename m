From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 4/4] driver core: Add edit_links() callback for drivers
Date: Mon, 1 Jul 2019 20:40:50 -0700
Message-ID: <CAGETcx8_rXX+PJUq6JqMVquejg_T9rrbCCCP62p4XtSbV2EUYw@mail.gmail.com>
References: <20190702004811.136450-1-saravanak@google.com> <20190702004811.136450-5-saravanak@google.com>
 <CAL_JsqKAn2uD4DC2wqJtkqLTFJ54yG_qaQjgfg=YrQfSEhJw+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKAn2uD4DC2wqJtkqLTFJ54yG_qaQjgfg=YrQfSEhJw+g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 1, 2019 at 6:46 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Jul 1, 2019 at 6:48 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > The driver core/bus adding dependencies by default makes sure that
> > suppliers don't sync the hardware state with software state before all the
> > consumers have their drivers loaded (if they are modules) and are probed.
> >
> > However, when the bus incorrectly adds dependencies that it shouldn't have
> > added, the devices might never probe.
> >
> > For example, if device-C is a consumer of device-S and they have phandles
> > to each other in DT, the following could happen:
> >
> > 1.  Device-S get added first.
> > 2.  The bus add_links() callback will (incorrectly) try to link it as
> >     a consumer of device-C.
> > 3.  Since device-C isn't present, device-S will be put in
> >     "waiting-for-supplier" list.
> > 4.  Device-C gets added next.
> > 5.  All devices in "waiting-for-supplier" list are retried for linking.
> > 6.  Device-S gets linked as consumer to Device-C.
> > 7.  The bus add_links() callback will (correctly) try to link it as
> >     a consumer of device-S.
> > 8.  This isn't allowed because it would create a cyclic device links.
> >
> > So neither devices will get probed since the supplier is dependent on a
> > consumer that'll never probe (because it can't get resources from the
> > supplier).
> >
> > Without this patch, things stay in this broken state. However, with this
> > patch, the execution will continue like this:
> >
> > 9.  Device-C's driver is loaded.
> > 10. Device-C's driver removes Device-S as a consumer of Device-C.
> > 11. Device-C's driver adds Device-C as a consumer of Device-S.
> > 12. Device-S probes.
> > 13. Device-S sync_state() isn't called because Device-C hasn't probed yet.
> > 14. Device-C probes.
> > 15. Device-S's sync_state() callback is called.
>
> We already have some DT unittests around platform devices. It would be
> nice to extend them to demonstrate this problem. Could be a follow-up
> patch though.
>
> In the case a driver hasn't been updated, couldn't the driver core
> just remove all the links of C to S and S to C so that progress can be
> made and we retain the status quo of what we have today?

The problem is knowing which of those links to delete and when.

If a link between S and C fails, how do we know and keep track of
which of the other 100 links in the system are causing a cycle? It can
get unwieldy real quick. We could delete all the links to fall back to
status quo, but how do we tell at what point in time we can delete
them all?

> That would
> lessen the chances of breaking platforms and reduce the immediate need
> to fix them.

Which is why I think we need to have a commandline/config option to
turn this series on. Keep in mind that once this patch is merged, the
API for the supplier drivers would be the same whether the feature is
enabled or not. They just fallback to status quo behavior (do their
stuff in late_initcall_sync() like they do today).

This patch series has a huge impact on the behavior and I don't think
there's a sound reason to force it on everyone right away. This is
something that needs incremental changes to bring in more and more
platforms/drivers into the new scheme. At a minimum Qualcomm seems
pretty interested in using this to solve their "when do I change/turn
off this clock/interconnect after boot?" question.

-Saravana
