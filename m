From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 16:21:45 +0800
Message-ID: <CAN1soZymEsMiivL_76o_g+-P1HhLx72Z2vbV3HBDs0x+oeWn+w@mail.gmail.com>
References: <20120312214325.GD5050@titan.lakedaemon.net>
	<201203202057.38365.arnd@arndb.de>
	<20120320220156.GI2484@titan.lakedaemon.net>
	<201203202215.09227.arnd@arndb.de>
	<alpine.LFD.2.02.1203202348150.24151@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1203202348150.24151-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 21, 2012 at 11:54 AM, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org> wrot=
e:
> On Tue, 20 Mar 2012, Arnd Bergmann wrote:
>
>> ehci-orion only makes sense on PLAT_ORION, and they never have any
>> other platform ehci driver.
>>
>> ehci-mv only makese sense on PLAT_PXA, and they =A0also don't have a=
ny
>> other platform ehci driver.
>
> BTW, as someone who once was the active maintainer for PXA, and later
> the active maintainer for Orion, I should say that ehci-mv is a terri=
bly
> bad name (as demonstrated, not all Marvell SOCs use ehci-mv) and
> confusion would be much reduced if it was renamed to ehci-pxa.
>
>
OK. We could try to rename ehci-mv to ehci-pxa.

By the way, we aren't allowed to append "depends on PLAT_PXA" in Kconfi=
g.

=46eliple,

Is it ok for appending "depends on PLAT_PXA" into Kconfig now?

Best Regards
Haojian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
