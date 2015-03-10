From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/15] musb: Add support for the Allwinner sunxi musb
 controller
Date: Tue, 10 Mar 2015 18:41:16 +0100
Message-ID: <20150310174116.GX5085@lukather>
References: <1425933628-9672-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uN3tURjgVTLfI0kr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425933628-9672-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uN3tURjgVTLfI0kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 09:40:13PM +0100, Hans de Goede wrote:
> Hi All,
>=20
> This patch set has been a while in the making, so I'm very happy to prese=
nt
> the end result here, and I hope everyone likes it.
>=20
> Before talking about merging this there are 2 things which I would like to
> point out:
>=20
> a) The musb controller in the sunxi SoCs uses some SRAM which needs to be
> mapped to the musb controller by poking some bits in the SRAM controller,
> just like the EMAC patches which were send a while back I've chosen to use
> syscon for this, actually 2 of the patches in this set come directly from=
 the
> SRAM mapping patchset for the EMAC.
>=20
> I know that Maxime is not 100% in favor of using syscon:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320221=
=2Ehtml
>=20
> But I disagree with his arguments for writing a special driver for the SR=
AM
> controller:

And I disagree with your disagreement :)

> 1) syscon was specifically designed for global system control registers l=
ike
> this and is fine to use as long as there are no conflicts where 1 bit is =
of
> interest to multiple drivers, and there is no such conflict here

No. Syscon has been designed for being lazy.

This is a huge abstraction non-sense. You have to put all the logic of
dealing with some external register layout in clients drivers,
including dealing with the different revisions/SoC that are different
=66rom that aspect, and duplicating that code across all client drivers.

> 2) Maxime's other arguments seem to boil down to it would be nice / prett=
ier
> to have a specific driver for this, without really proving a hard need for
> such a driver. But writing such a driver is going to be a lot of work, and
> we've a ton of other work to do, and as said there is no real need for a
> separate driver, syscon works fine for this.

Actually, I already wrote some prototype for this. I'll clean this up
and send it tonight/tomorrow.

> 3) I actually believe that having a specific driver for this is a bad ide=
a,
> because that means inventing a whole new cross driver API for this, and
> getting those right is, hard, a lot of work, and even then one is still l=
ikely
> to get it wrong. We can avoid all this by going with the proven syscon so=
lution.

Except that modifying an in-kernel API, especially when we have two
users, is easy. Moving back from syscon is not.

> Maxime, can we please have your ack for moving forward with this using sy=
scon?
> (see above for my arguments why)

If you can address my objections above, sure.

Thanks for your awesome work on this,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uN3tURjgVTLfI0kr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/yy8AAoJEBx+YmzsjxAgdusQAIMcSYEfIyd66P3kI5ABpggk
jjrOSIV2QHnWmHO5ZLLoVoB+2QLUkbVXg4eWKHNK3VTzK0S2fn9WBWtx0ARxugz6
tPPaqD1oFVjfBH9J9YPfR8JOA1dFhgqruqLKxe51KnABTYNQG2RLAfXG+YgdAJfl
qufTnKvqsIPKEcyt7gDDE2GAP/Mt/SQ0F/7na/FiISBXvJZTtR6ayof4ofD9SXW0
LiPKbzBYLUGet4YCzVJRCLN8+0mr5W0CBn0Ero/ABqYgsVqvPQviSsGVjrbCtSpb
l4aHKWvYWJFLEcZ4ZTX+EeSwKgel/phM9DpRZ88JKWbLYQd3ni3bn69a6VJeNzPl
gIUszB6RIxdHjHcAWupvmq7YQu+nsedIap1zUYrfb7IDII3dE71oqayAbrTA914y
qd3VZTudhV/NhPHwe02TSD06nrWfGIhv3YDspmusFslcUnXWztyzvhnlihjE8w/v
fJzhU+PJvVcUdJfHidul8HiFD1gnoIu1/HWfUZeZWklRXLoTOIVJkx7p+KlDy5sX
o1vQ7QgDXE5fK7Qtoah+HDEDxbCGfyPoiZx5sKad/AAnvIJtYBiQ4YR6HzYmZrBC
E8OsBN/azA0aqgBB1Ld5QC6x3goqK7XOMj4RJnaljcVgdrWoXs1sz3NUigp5ocVW
1a3Snmukze1z+2LwEj5n
=ix9G
-----END PGP SIGNATURE-----

--uN3tURjgVTLfI0kr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
