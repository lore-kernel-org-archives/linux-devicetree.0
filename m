From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v5 1/3] clk: bcm2835: Add binding docs for the Raspberry Pi clock provider
Date: Mon, 24 Aug 2015 17:31:38 -0700
Message-ID: <87vbc4us2d.fsf@eliezer.anholt.net>
References: <1439507142-2965-1-git-send-email-eric@anholt.net> <1439507142-2965-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439507142-2965-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> writes:

> The hardware clocks are not controllable by the ARM, so we have to
> make requests to the firmware to do so from the VPU side.  This will
> let us replace fixed clocks in our DT with actual clock control (and
> correct frequency information).

Gordon from the Raspberry Pi Foundation just asked me "what do you mean,
you can't access the clocks from the ARM?"  I'd been assured I couldn't
by another developer (who was originally going to write a Linux driver
for this), and my own testing had also indicated I couldn't, but after a
new round of hacking together some tests, I see things that look a lot
like clockman registers.

Looks like we're going to get a native driver, instead.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV27dqAAoJELXWKTbR/J7o7VsQALY59uxzOW5gYQJjog9oPwyO
r8KMrsWen3hdhgbvzwSVnmMAJn/OFfPDE8t9x9YhTF1qVDMaSw5lQmmsWDLlidIk
JeymNirtPw8H7nrvzoZXF5k4JgU+Zt5QaRhM+D1nifKb2puRoKJ9QDPYWwVVFCdd
K+zTSCGGPWmHCduiMSQpEpjxYeZa6n6St1w4L8xbj73we845AK03JHzkj5kXQUZ9
iFcK1Gj1antCDzjkqpgel1Ih0Pn4FnLtLcsMtZ0vSwDHb1Ej2tVzlwrfWOG2C1I/
LvvGyv/2WLmgVh9g9k5OZUHeFZhyRxOz80NM8D85IIkoNn/4qpDzri3N/047wZ++
zTn46uu5wV7a7O3ywc3nDYbwwnsiioE1JkyJAXxWFJblRahraS7KFdOcpLrQ5jK+
jVUJysmA+T0WH//fAvtf0u+htqukxbnxRMUOVdOzifW2trDtsdnXDa6yfmNyd7Hh
BleMYFZJKDM45i4dl0zi5OICud14ahB0MN9TuczKdglQzl3wjUuHq6zLunMBv9yl
DqNN1ukSfdZsxoli8XQ85Zzb23cbcEQjWox/JkKNQGSCxSWHLebA8y+kY3e7QY1U
mfQkV07BpCEEjIhR/I2TEnaXjdmPoXzol/ApEiNiUhtDtGcwpY7m/2Tl+1Lc5A1p
OTfI0WyhcDb0DwehRvFQ
=FyqC
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
