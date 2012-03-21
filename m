From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Wed, 21 Mar 2012 10:09:40 +0000
Message-ID: <201203211009.40934.arnd@arndb.de>
References: <20120312214325.GD5050@titan.lakedaemon.net> <20120321083428.GA25111@lunn.ch> <CAN1soZyObqAPq=fhn8eB1z0aYqTs87oNBsF_AXbo6kq9fpvhMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1soZyObqAPq=fhn8eB1z0aYqTs87oNBsF_AXbo6kq9fpvhMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 21 March 2012, Haojian Zhuang wrote:
> The driver isn't used by any other platform. It's only used in
> arch-pxa & arch-mmp.
> 
> I can't find the original mail. But I remembered that maintainer said
> the driver should be built with any other platform, even with x86. So
> we aren't allowed to append it in Kconfig.

I generally make the recommendation that any driver should be able to
get built on any system. However, in this particular case, it's clearly
a bug, because you cannot build it together with another platform driver.

That will change when we get to multiplatform builds on ARM that where we
actually need to find a way to make that possible.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
