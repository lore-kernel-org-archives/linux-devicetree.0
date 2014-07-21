From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH] wlcore: add basic device-tree support
Date: Mon, 21 Jul 2014 12:45:05 -0400
Message-ID: <20140721164505.GD9026@tuxdriver.com>
References: <1404898305-15588-1-git-send-email-eliad@wizery.com>
 <CAGm1_kvTYiDZDuFrB9X1ZOCxrhPC_NE_UzzY8PoBpdZHrQgv_A@mail.gmail.com>
 <CAB3XZEeC8AeAw03Va6WZ_WHwy6YABkSjg0BMdf=6gGu1UyncSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAB3XZEeC8AeAw03Va6WZ_WHwy6YABkSjg0BMdf=6gGu1UyncSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 09, 2014 at 02:45:33PM +0300, Eliad Peller wrote:
> On Wed, Jul 9, 2014 at 2:00 PM, Yegor Yefremov
> <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> > On Wed, Jul 9, 2014 at 11:31 AM, Eliad Peller <eliad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org> wrote:
> >> When running with device-tree, we no longer have a board file
> >> that can set up the platform data for wlcore.
> >> Allow this data to be passed from DT.
> >>
> >> For now, parse only the irq used. Other (optional) properties
> >> can be added later on.
> >
> > What about adding support for "mac-address"
> > (Documentation/devicetree/bindings/net/ethernet.txt) node or will it
> > be automatically available?
> >
> the mac address is currently either read from the device itself or
> from the nvs (calibration) file.
> i guess additional support for such dt properties can be added later
> on, if needed.

Ok with the device tree folks?

-- 
John W. Linville		Someday the world will need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org			might be all we have.  Be ready.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
