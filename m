From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] simplefb: Change simplefb_init from
 module_init to fs_initcall
Date: Thu, 13 Nov 2014 11:42:03 +0100
Message-ID: <20141113104203.GF20972@lukather>
References: <1415830124-28787-1-git-send-email-hdegoede@redhat.com>
 <1415830124-28787-3-git-send-email-hdegoede@redhat.com>
 <20141113085238.GE20972@lukather>
 <546478B5.2040002@redhat.com>
 <CACxGe6u8B854PEWw8XzwhyX8joMWwOsHOOXtmBmC1TgCGjGtdg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yRA+Bmk8aPhU85Qt"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBL4XSKRQKGQE2O4C5HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6u8B854PEWw8XzwhyX8joMWwOsHOOXtmBmC1TgCGjGtdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yRA+Bmk8aPhU85Qt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2014 at 10:29:52AM +0000, Grant Likely wrote:
> On Thu, Nov 13, 2014 at 9:24 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrot=
e:
> > On 11/13/2014 09:52 AM, Maxime Ripard wrote:
> >>> +/*
> >>> + * While this can be a module, if builtin it's most likely the conso=
le
> >>> + * So let's leave module_exit but move module_init to an earlier pla=
ce
> >>> + */
> >>
> >> Not really related to this patch itself, but do we want to support
> >> simplefb as a module? It seems like it's going to be most of the time
> >> broken.
> >
> > A valid point, my mean reasoning here is that some may see not being ab=
le to
> > use it as a module as a regression, so I just kept things as is, but I =
do
> > agree that it is advisable to just build it in.
>=20
> Like a lot of things, if it is made a modules, and it breaks for the
> user, the user gets to keep the pieces. There are potentially some
> valid scenarios where it is fine to have it as a module. I don't
> recommend changing this unless is actually starts causing problems.

I don't really agree here. If it's broken because the clocks, reset,
memory, or whatever resource has been reclaimed by the kernel before
the module even had a chance to probe, the only thing that the user
will get is that there's no chance it's ever going to work, and that
it's just unreliable.

If we know that it's going to break, and that there's no way it can be
reliable (as in on all the SoCs reliable), keeping it as a module is
just asking for trouble.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yRA+Bmk8aPhU85Qt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZIr7AAoJEBx+YmzsjxAgSccP/RI59EUGactEAMDhskesOqwa
psXnHuoo/zBauzyWFJUXD1Jv9SglUghzjkDj5Hy+iaxt6VTZr1iMVHZTfm3o1gE3
lBH97NFLk5S4MzCOTb7hI2lCXtFLd88Jq8BblL356HFjGC9k9+ofTSXYrGAhayNy
3zKmRA2mfsA1VWo+8W6EFwU7VpQoR64s1T2Cx79GHPGFIvfixZKclDwKPc2Jv4FE
9bE95nQxet/8gaG20e58uttyi7rheXahj76hvd7JANvONrbaFYE/AqLV8VzCd+gP
7HcKtSpF1QB88vCYDvuMZiz1JvZRlf+x/CZdfMV55ev3DbYrClVwQ/YK5cG/9nMr
Wojv5BIIX26c7epl8vLytUrCWnuQblUG9Kit+Ud2TLiiRJuxFG/+GUNCM56avleO
5XtFZ96w0OKhXqAUzbP3/GDmhlTgNYB1JXX/yCZlWrpcZC9ZYu8eXkow5NCQT/E5
NkMhW8wrpchhFrRf+J5qT8+NPgawe684RAM7giVYnoJ7Tg/ITQiSJoDTemEJ9fAz
hUAtAshtYjVN02/UdGCfoIonmSd4drw/5lCHRhB2DAhAQHCryyRFUrg63F+7ZWi6
NXCyvBT5ODlkGk0iktXyB7DkhWc1vX+Qi6ofCj3YTyfLLQZ/X9NethT5FvG9S2cS
yqSMACWqhQuySMRtlxDk
=LOgH
-----END PGP SIGNATURE-----

--yRA+Bmk8aPhU85Qt--
