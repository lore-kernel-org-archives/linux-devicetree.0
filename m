From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something	better?
Date: Tue, 22 Oct 2013 11:45:16 +0200
Message-ID: <20131022094515.GD15640@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <52646AF9.3050309@roeck-us.net>
 <52658918.1060708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52658918.1060708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 09:05:44PM +0100, Stephen Warren wrote:
> On 10/21/2013 12:44 AM, Guenter Roeck wrote:
> > On 10/20/2013 04:11 PM, Russell King - ARM Linux wrote:
> >> On Sun, Oct 20, 2013 at 10:26:54PM +0100, Stephen Warren wrote:
> >>> The only thing we've really moved out of the kernel is the exact IDs =
of
> >>> which GPIOS, interrupts, I2C/SPI ports the devices are connected to; =
the
> >>> simple stuff not the hard stuff. The code hasn't really been simplifi=
ed
> >>> by DT - if anything, it's more complicated since we now have to parse
> >>> those values from DT rather than putting them into simple
> >>> data-structures.
> >>
> >> Here's my random thoughts this evening on DT, orientated mostly on a
> >> problem area I've been paying attention to recently.
> >>
> >> In some ways, DT has made things much harder.  I don't know whether
> >=20
> > On the other side, DT has made some things much simpler.
> >=20
> > Problem case: Chip A's interrupt pin is connected to gpio pin of chip B.
> > Chip B's interrupt pin is connected to a gpio pin on chip C. Chip C's
> > interrupt pin is connected to the interrupt controller. Chips B and C
> > are multi-function FPGAs. Exact gpio pins used vary from board to board.
> >=20
> > With DT, this relationship is easy to describe, and none of the chip
> > drivers
> > really needs to know what is connected to what. Without DT, it would be
> > much more complex.
>=20
> I thought that was very easy with board files. For every chip that gets
> instantiated, you tell it which base IRQ ID to use. For every chip that
> outputs a IRQ, you tell it which IRQ ID that signal is, simply by adding
> the recipient chip's IRQ base and an offset. That seems very simple. If
> you don't want to add the base/offset together, we could always have
> invented some lookup table similar to what regulators had, and pinctrl
> has now, which says for each (device name, IRQ name/number) output,
> here's the (device name, IRQ name/number) of the associated input.

Well, DT has certainly increased the level of dynamicity within the
kernel. I for one consider not having to rely on a fixed IRQ or GPIO
base per-chip a good thing. Deferred probing is a very powerful yet
extremely simple tool that was created as part of the DT conversion
effort. There is obviously much more that can be done, but I think
that we have come a long way.

But as you said, that could all have been done even with board files.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZkkrAAoJEN0jrNd/PrOhGf0P/151c0XyZjFG94lGy8UN/uYC
XwpUk1kWBwnPM2ZXucu0Z/F+tyJDq8gm8779fjcwQZFPNbW/GWt3kSQiheN937zs
IF1QcZcokX7h40r2aiutFgJXnEwyyCZlbTrCh5VFi21MozxauBuC6xFuIb0toiEi
fUNEOmxGtdUGmdMNH4ryUke34EQMblELuypmmMo41fWWVgj8lNzT5VvKQqUlWBpt
DjxToIy3516FGXNmvcsPTEcipjVeKsLTgQIMFu1v8wBi6bJb6UCccazL5kUpHouD
EwGzhfk2w0bSz1eWNEvwQ5nUusfXzfADFlDha0RK085d//DjjbdvPRkLVUy5BZkb
XZorHhRO6emrrVbUbkTkdcxl3crmRLfg9Qwc4CuCgTtRKX1T10rGKx7ctUVxTGJL
p9t1k/41pV009hALOtVGSxDD76wY3SnagsyLQ2qoaJpCb74AdaQAsAir04EKTQWv
32m1fSzc9LcU6+WRguQI5IYl8x6YZgQEz0yE8IXNXbbtvrT9SpfBsiocEN0UWo5s
Mh4cceXQzmc0uPSIcPa5LdnBLaFumFGjJZ+6xv8qukhIKLKjTBD818nHrZ0M2FM+
mBuT1xn1Q7AHPcjmviWxD+ufPD9U2m+NLsDyduEQYIebBpnukFzmHNDVZhHaE/9f
+P81RFyfRbSC5/NOxlMX
=LUwJ
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
