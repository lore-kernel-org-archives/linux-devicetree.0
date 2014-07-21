From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] wlcore: add basic device-tree support
Date: Mon, 21 Jul 2014 22:19:28 +0200
Message-ID: <4978000.DXO6RXA1rg@wuerfel>
References: <1404898305-15588-1-git-send-email-eliad@wizery.com> <CAB3XZEeC8AeAw03Va6WZ_WHwy6YABkSjg0BMdf=6gGu1UyncSA@mail.gmail.com> <20140721164505.GD9026@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140721164505.GD9026-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 21 July 2014 12:45:05 John W. Linville wrote:
> On Wed, Jul 09, 2014 at 02:45:33PM +0300, Eliad Peller wrote:
> > On Wed, Jul 9, 2014 at 2:00 PM, Yegor Yefremov
> > <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> > > On Wed, Jul 9, 2014 at 11:31 AM, Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org> wrote:
> > >> When running with device-tree, we no longer have a board file
> > >> that can set up the platform data for wlcore.
> > >> Allow this data to be passed from DT.
> > >>
> > >> For now, parse only the irq used. Other (optional) properties
> > >> can be added later on.
> > >
> > > What about adding support for "mac-address"
> > > (Documentation/devicetree/bindings/net/ethernet.txt) node or will it
> > > be automatically available?
> > >
> > the mac address is currently either read from the device itself or
> > from the nvs (calibration) file.
> > i guess additional support for such dt properties can be added later
> > on, if needed.
> 
> Ok with the device tree folks?
> 

Doesn't seem wrong, though it's generally best to allow overriding
the mac address from DT. It's only a one-line addition to call
of_get_mac_address().

Looking at the original patch though, I wonder if this is compatible
with the generic way that SDIO device DT properties are supposed
to work. Ulf Hansson has recently been looking into a related area,
maybe he can comment.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
