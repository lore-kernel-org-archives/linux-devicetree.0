From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Tue, 22 Dec 2015 11:01:31 -0800
Message-ID: <87si2uux2s.fsf@eliezer.anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net> <20151218100826.GB1145@omega> <20151220221158.GA6416@omega> <874mfbflj3.fsf@eliezer.anholt.net> <20151222142643.GB29335@omega>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151222142643.GB29335@omega>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Dec 21, 2015 at 03:07:44PM -0800, Eric Anholt wrote:
> ...
>> >
>> > But still getting this panic, your patches does not contain some
>> > defconfig, so I still try to figure out what I need to enable to get it
>> > working. Maybe it is some missing config entry which should be enabled.
>> >
>> > But, for me it looks like some devicetree issue, because of_iomem retu=
rns
>> > NULL, at [0]. Don't know what I am doing wrong.
>>=20
>> My best guess is that since you're not using U-Boot, the firmware's
>> mangling the DT in some way that breaks us.  Notably, in my current
>> firmware checkout, set /soc/ranges to just the first entry that we're
>> using, which would break the mapping.  However,
>> rpi/rpi-4.4.y:arch/arm/boot/dts/bcm2709.dtsi uses the same /soc/ranges
>> setup that we do, so I'm not sure what's going on.  Perhaps
>> bcm2709_io_desc[]'s initialization covers for it?
>
> I boot here with two different bootloaders, both ends in the same panic.
>
> Finally I figured out if I do a user/kernel split (2G/2G) then the
> issue is gone.

Huh.  Not sure what's going on there.

> Later I need to enable "CONFIG_HAVE_ARM_ARCH_TIMER" so the kernel
> doesn't hang forever.

I'll add a dependency for that -- we definitely want the arch timer.  I
would have thought that the 2835 timer would still be able to make
things work, though.

> After finally booting the RPi2 I get several messages of:
>
> unexpected IRQ trap at vector 00
>
> while typing _one_ character over uart.

We were doing some debugging of that recently.  It seems that every once
in a while we get woken up but nothing shows up in the top-level status
register.  We need to just make the irqchip ignore instead of trying to
look up a handler in that case, but I haven't prioritized it because it
makes me worry that I'm just papering over a problem in our IRQ masking
or something.

I haven't seen any problems other than the printk, though.

> Can you provide somehow your RPi2 kernelconfig?

http://people.freedesktop.org/~anholt/dotconfig-bcm2836-2015-12-22.txt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWeZ4LAAoJELXWKTbR/J7og7wQALNWv9kkVIv5y25TGWslbmA6
VWl9M+lAabFL0Et/wcweWs0GuqPOC3T0DIzkLlzYhyetLIEvevXkSVkc/76YjaYc
prvCbAwTsxJxGAK6XnySXkRXHgdvguaZ2EvR9PJT58UWOOeVyC16PcPD80+g+XNI
cRhpFjrRR8T17+W3BzAUp6I1oPo0KKtU6grn9PKqyyN/sQWAfIy4v33lZoTLYEH3
rl8OUiNgqfEHiDX10mWxlzkaqJEaymp33b6CGWYQUF6ax4KiecsD1wGaJdmiOGwL
6e6118Qh1ZB0IjLlZWwJTY+EqqKN0hmjmVlp9A9Zm+4EKKa7eIQNdmXmzPk/YauH
a4RYRe9Y8QavkGc9lhb6xrAVw/xI0c/kjXusJ+TxzYB+oy8INwFhe6OCjYf5pbp+
DnLqvizpeOoa+uH4rhCwdHnREQ/BPQosgAQ+g9izaIEo1CVkA+dFNhz+lQoZgw5D
9PO2L91lC9PLpe2tzDh3IuNU00mJsbIbqt6j1kwpPmH0zc5Bi+lfFzAQAPDcsARl
l2ZGa9JKUFfhWgpKbe8FDnD4+xhROGs1h9CtffF0c8h756T5X1yqeA5zc9BklDwt
VL397W33vh3vaROlEIL1cC3dtx3Cz/jJgaGpvcXqMqZgpKInNZ/ZyEZPOWy36Ghc
DiqPh8HLYcPDcBTE6MEp
=cCbw
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
