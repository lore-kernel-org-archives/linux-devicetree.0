From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 15:52:21 -0300
Message-ID: <CAOMZO5Csr-vgsKHahnTcMKu1DfgSToYnoVncAfhYFJid-bwviQ@mail.gmail.com>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
	<CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
	<20130926205906.GT12758@n2100.arm.linux.org.uk>
	<CAHCPf3u9KyoJiAPv6oc_ZdVBqgix41__RAGRXh8z+d5bXO8fQw@mail.gmail.com>
	<20130926232907.GV12758@n2100.arm.linux.org.uk>
	<20130927131554.GB31178@titan.lakedaemon.net>
	<20130927170552.GC12758@n2100.arm.linux.org.uk>
	<20130927183101.GE12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130927183101.GE12758-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 3:31 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Fri, Sep 27, 2013 at 06:05:52PM +0100, Russell King - ARM Linux wrote:

> An interesting data point.  Connect it to a 100mbit switch and it works.
> gigabit and it behaves as above.
>
> So, the question is: does anyone have gigabit networking working on imx6
> with recent DT based kernels?

Yes, we have Gigabit ethernet working on mx6sabrelite, wandboard,
sabresd boards.

Does the 3.0.35 kernel work with gigabit on cubox-i? Could this issue
be related to the ar8035 phy fixup code?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
