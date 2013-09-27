From: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 15:16:48 -0500
Message-ID: <CAHCPf3t=rG-sV-kNe5mQjSvs8k0rddv9=tgh+ub=Tt1xObYxVw@mail.gmail.com>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
	<CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
	<20130926205906.GT12758@n2100.arm.linux.org.uk>
	<CAHCPf3u9KyoJiAPv6oc_ZdVBqgix41__RAGRXh8z+d5bXO8fQw@mail.gmail.com>
	<20130926232907.GV12758@n2100.arm.linux.org.uk>
	<20130927131554.GB31178@titan.lakedaemon.net>
	<20130927170552.GC12758@n2100.arm.linux.org.uk>
	<20130927183101.GE12758@n2100.arm.linux.org.uk>
	<CAOMZO5Csr-vgsKHahnTcMKu1DfgSToYnoVncAfhYFJid-bwviQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Csr-vgsKHahnTcMKu1DfgSToYnoVncAfhYFJid-bwviQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 1:52 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Sep 27, 2013 at 3:31 PM, Russell King - ARM Linux
> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
>> On Fri, Sep 27, 2013 at 06:05:52PM +0100, Russell King - ARM Linux wrote:
>
>> An interesting data point.  Connect it to a 100mbit switch and it works.
>> gigabit and it behaves as above.
>>
>> So, the question is: does anyone have gigabit networking working on imx6
>> with recent DT based kernels?
>
> Yes, we have Gigabit ethernet working on mx6sabrelite, wandboard,
> sabresd boards.
>
> Does the 3.0.35 kernel work with gigabit on cubox-i? Could this issue
> be related to the ar8035 phy fixup code?

The AR8035 has a PHY ID of 0x004dd072 and the code in the i.MX6
platform stuff specifies 0x004dd074 - so if it's really an 8035 then
it's not being run..

That said... it would still need to be set up the same way if it was
supplying a 125MHz clock.

Why isn't this in some PHY driver code and why isn't this being marked
as required by some kind of PHY node property anyway? Platform init
code is NOT the place to screw with this stuff... it wouldn't work if
phylib & drivers were modules anyway, right?

-- 
Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
