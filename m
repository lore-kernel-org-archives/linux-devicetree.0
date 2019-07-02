From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 4/4] driver core: Add edit_links() callback for drivers
Date: Mon, 1 Jul 2019 19:46:22 -0600
Message-ID: <CAL_JsqKAn2uD4DC2wqJtkqLTFJ54yG_qaQjgfg=YrQfSEhJw+g@mail.gmail.com>
References: <20190702004811.136450-1-saravanak@google.com> <20190702004811.136450-5-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702004811.136450-5-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 1, 2019 at 6:48 PM Saravana Kannan <saravanak@google.com> wrote:
>
> The driver core/bus adding dependencies by default makes sure that
> suppliers don't sync the hardware state with software state before all the
> consumers have their drivers loaded (if they are modules) and are probed.
>
> However, when the bus incorrectly adds dependencies that it shouldn't have
> added, the devices might never probe.
>
> For example, if device-C is a consumer of device-S and they have phandles
> to each other in DT, the following could happen:
>
> 1.  Device-S get added first.
> 2.  The bus add_links() callback will (incorrectly) try to link it as
>     a consumer of device-C.
> 3.  Since device-C isn't present, device-S will be put in
>     "waiting-for-supplier" list.
> 4.  Device-C gets added next.
> 5.  All devices in "waiting-for-supplier" list are retried for linking.
> 6.  Device-S gets linked as consumer to Device-C.
> 7.  The bus add_links() callback will (correctly) try to link it as
>     a consumer of device-S.
> 8.  This isn't allowed because it would create a cyclic device links.
>
> So neither devices will get probed since the supplier is dependent on a
> consumer that'll never probe (because it can't get resources from the
> supplier).
>
> Without this patch, things stay in this broken state. However, with this
> patch, the execution will continue like this:
>
> 9.  Device-C's driver is loaded.
> 10. Device-C's driver removes Device-S as a consumer of Device-C.
> 11. Device-C's driver adds Device-C as a consumer of Device-S.
> 12. Device-S probes.
> 13. Device-S sync_state() isn't called because Device-C hasn't probed yet.
> 14. Device-C probes.
> 15. Device-S's sync_state() callback is called.

We already have some DT unittests around platform devices. It would be
nice to extend them to demonstrate this problem. Could be a follow-up
patch though.

In the case a driver hasn't been updated, couldn't the driver core
just remove all the links of C to S and S to C so that progress can be
made and we retain the status quo of what we have today? That would
lessen the chances of breaking platforms and reduce the immediate need
to fix them.

Rob
