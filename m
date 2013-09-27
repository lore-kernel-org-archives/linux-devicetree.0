From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 14:21:07 +0100
Message-ID: <20130927132107.GZ12758@n2100.arm.linux.org.uk>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk> <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com> <CACRpkda9HZ4JKnidnJJh-HkhCgtvJwQPQJnv9CZ4iYcQP36_Nw@mail.gmail.com> <20130927025116.GG25146@S2101-09.ap.freescale.net> <20130927084504.GW12758@n2100.arm.linux.org.uk> <20130927122814.GK25146@S2101-09.ap.freescale.net> <20130927131225.GA31178@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130927131225.GA31178-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 09:12:25AM -0400, Jason Cooper wrote:
> I'm currently slogging through the exact same issues for adding imx50
> (SanDisk Connect Wireless media Drive).  I thought I was just thick.
> It's a relief to know I'm not the only one having trouble with this.

I'm coming to the conclusion that it's almost to the point of "vendor
lockin" - you have to find someone who understands this stuff to take
your hardware description and turn it into a working DT description.

Still slogging away at the nonfunctional ethernet and still have no
idea why it's not working... just going through the pinctrl settings
again, this time decoding them right down to the values on both the
DT and the working code and comparing.

I think I'll be bringing up what a disaster this DT stuff is in
Edinburgh.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
