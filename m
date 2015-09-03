From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone: use one to one address translations
 under netcp
Date: Thu, 3 Sep 2015 07:26:46 -0700
Message-ID: <20150903142645.GS4215@atomide.com>
References: <1441139324-29296-1-git-send-email-w-kwok2@ti.com>
 <55E61658.9010207@oracle.com>
 <230CBA6E4B6B6B418E8730AC28E6FC7E04221776@DFLE11.ent.ti.com>
 <55E71AB3.7070406@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55E71AB3.7070406-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "Kwok, WingMan" <w-kwok2-l0cyMroinI0@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> [150902 08:55]:
>
> I suspected the same. I know back then we started with SERDES code
> with NETCP but as you already know, its a separate block which
> is needed for NIC card to work. Its more of phy and hence its
> having different address space is not surprising.

The point Santosh is making here though is that any drivers
tinkering with registers belonging to a separate hardware block
is a recipe for a long term maintenance nightmare with mysterious
bugs popping up as things are not clocked or powered properly
or become racy with other drivers.

Each hardware block needs to have it's own driver and then the
drivers can communicate using some Linux generic APIs like clock,
regulator, phy, or mailbox frameworks.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
