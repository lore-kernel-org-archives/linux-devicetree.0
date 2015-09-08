From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone: use one to one address translations
 under netcp
Date: Tue, 8 Sep 2015 08:13:52 -0700
Message-ID: <20150908151351.GE4215@atomide.com>
References: <1441139324-29296-1-git-send-email-w-kwok2@ti.com>
 <55E61658.9010207@oracle.com>
 <230CBA6E4B6B6B418E8730AC28E6FC7E04221776@DFLE11.ent.ti.com>
 <55E71AB3.7070406@oracle.com>
 <20150903142645.GS4215@atomide.com>
 <55E89CF8.4050700@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55E89CF8.4050700-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Cc: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Kwok, WingMan" <w-kwok2-l0cyMroinI0@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org> [150903 12:21]:
> Tony,
> On 09/03/2015 10:26 AM, Tony Lindgren wrote:
> >* santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> [150902 08:55]:
> >>
> >>I suspected the same. I know back then we started with SERDES code
> >>with NETCP but as you already know, its a separate block which
> >>is needed for NIC card to work. Its more of phy and hence its
> >>having different address space is not surprising.
> >
> >The point Santosh is making here though is that any drivers
> >tinkering with registers belonging to a separate hardware block
> >is a recipe for a long term maintenance nightmare with mysterious
> 
> That is what we want to avoid as well. If I interpret your statement
> correctly, you don't want SerDes driver update the register of say SGMII,
> right? But we will have to based on the hardware design. So it can't be a
> standalone device driver IMO and it has to be part of the respective
> peripheral device driver.

If it's a separate target on the interconnect it should be a separate
driver. Depending on the SoC version these targets can move around
as we've seen.

> >bugs popping up as things are not clocked or powered properly
> >or become racy with other drivers.
> >
> >Each hardware block needs to have it's own driver and then the
> >drivers can communicate using some Linux generic APIs like clock,
> >regulator, phy, or mailbox frameworks.
> 
> That depends on what your definition of a hardware block is. Inside NetCP,
> there are many hardware blocks that work together to provide the NIC
> functionality, and SerDes is one of them. Where ever possible, we have
> separate drivers :- knav qmss, knav pkt dma, ethss, mdio etc. Ethss driver
> manages Eth subsystem that includes SGMII and SerDes. Unfortunately SerDes
> is tightly integrated with ethss and taking it out as a separate driver (Say
> Phy) is not a good idea. We will posting an RFC for this soon and probably
> we can discuss it more then.

A separate target on the interconnect is the best criteria to use
here. This is because two targets may or may not share some resources
and can get rearranged depending on the SoC.

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
