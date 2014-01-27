From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 04/15] watchdog: orion: Handle IRQ
Date: Mon, 27 Jan 2014 04:18:59 -0300
Message-ID: <20140127071858.GB17506@localhost>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390310774-20781-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <52DE84A6.6090909@roeck-us.net>
 <20140127063040.GA17506@localhost>
 <52E5FFCB.5000802@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E5FFCB.5000802-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 26, 2014 at 10:42:19PM -0800, Guenter Roeck wrote:
> On 01/26/2014 10:30 PM, Ezequiel Garcia wrote:
> > Hi Guenter,
> >
> > On Tue, Jan 21, 2014 at 06:31:02AM -0800, Guenter Roeck wrote:
> > [..]
> >>> @@ -131,6 +138,19 @@ static int orion_wdt_probe(struct platform_d=
evice *pdev)
> >>>    	if (!wdt_reg)
> >>>    		return -ENOMEM;
> >>>
> >>> +	irq =3D platform_get_irq(pdev, 0);
> >>> +	if (irq > 0) {
> >>
> >> 0 is a valid interrupt number, and platform_get_irq returns an err=
or code on errors.
> >> Should be >=3D 0.
> >>
> >
> > I'm revisiting this one. I believe this is not the hardware interru=
pt
> > number, but the one mapped into virq space. So, 0 is not a valid
> > interrupt number.
> >
> > Right?
> >
>=20
> If so, the entire interrupt numbering scheme appears broken. Conceptu=
ally it should
> not make a difference where the interrupt is coming from. If the virq=
 system
> returns 0 for invalid (non-configured) interrupts, and non-configured=
 'real'
> interrupts are reported as -ENXIO, all bets are off. How would a driv=
er know
> what to expect ? And how would one be expected to review such non-det=
erministic
> code ?
>=20

I wouldn't know that much. I'm just pointing out that '0' doesn't seem
to be a valid IRQ number in this context (i.e. virq space).

> FWIW, platform_get_irq() does return -ENXIO for invalid interrupts. I=
f there
> is an independent notion of "0 is an invalid interrupt", it is well h=
idden.
>=20

Yes, AFAICS platform_get_irq() returns a negative error or a positive
irq number. I fail to see how it's able return '0' (of course, I can be
wrong).

> Anyway, if you think the driver should treat 0 as invalid interrupt, =
go ahead.
> Who am I to know. Just please don't use my Reviewed-by in this case.
>=20

Quite frankly not sure how to handle this best. A quick grep through th=
e
code doesn't help either: lots of drivers treat 0 as a valid interrupt
and lots treat it as invalid. So I guess it doesn't really matter...

Can someone shed a light on this?
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
