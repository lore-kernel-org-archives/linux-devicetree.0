From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/1] ARM: dts: sunxi: Fix simplefb not working in 4.7-rc1
Date: Mon, 20 Jun 2016 09:46:10 +0200
Message-ID: <20160620074610.GH26668@lukather>
References: <1465063524-4925-1-git-send-email-hdegoede@redhat.com>
 <20160609074643.GA5242@lukather>
 <21258fc0-0250-951b-2ee7-d022fb3c09ac@redhat.com>
 <20160613080124.GA4481@lukather>
 <1a9a0d76-5bbf-4b79-abee-1c9dd0436567@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X+8siUETKMkW99st"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1a9a0d76-5bbf-4b79-abee-1c9dd0436567-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--X+8siUETKMkW99st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 10:30:57AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 13-06-16 10:01, Maxime Ripard wrote:
> >On Thu, Jun 09, 2016 at 12:47:36PM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 09-06-16 09:46, Maxime Ripard wrote:
> >>>Hi Hans,
> >>>
> >>>On Sat, Jun 04, 2016 at 08:05:23PM +0200, Hans de Goede wrote:
> >>>>Hi Maxime,
> >>>>
> >>>>While testing 4.7-rc1 / linux-sunxi/sunxi-next on a A10s I noticed th=
at
> >>>>hdmi out is no longer working (screen goes black when the kernel turns
> >>>>of unused clocks).
> >>>>
> >>>>This is caused by the dtsi for sun4i / sun5i / sun7i based boards now
> >>>>listing pll3, without pll3 being added to the clocks list for the
> >>>>simplefb nodes.
> >>>
> >>>Why not do just that then? It's more appropriate for a fix imho.
> >>
> >>You mean just for sun5i-a10s, or for all of sun4i / sun5i-a10s and
> >>sun7i ?
> >>
> >>For sun4i and sun7i things are already fixed in next:
> >>
> >>https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?=
id=3D5a7f2310cc847a73852e70bc720a61ca9bf986a6
> >>https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?=
id=3Dc79255ca4d7b67cce4eac4dd532e097ce49f3679
> >>
> >>It seems best to use those fixes, rather then come up with a separate
> >>fix for 4.7.
> >>
> >>My patch for fixing sun5i-a10s is inline with the 2 above patches,
> >>which seems best, rather then doing something special for just sun5i-a1=
0s.
> >
> >Well, you are doing something special for just the A10s: the patches
> >quoted above just add a bunch of clocks and add the handles to the
> >list of clocks managed by simplefb.
> >
> >For the A10s, you also declare the whole display engine block without
> >anyone having tested that it was actually working.
>=20
> A10s is the same SoC as A13 / R8, just in a different package / with
> different pins routed to the outside and it features a parallel LCD
> interface just like the A13 / R8. We've had this confirmed by
> Allwinner multiple times now, A13 / A10s / R8 literary are the same
> chip, there simply is no way the displayblock on the A10s somehow
> is magically different.
>=20
> Given all this, clearly having this identical displayblock in the
> shared sun5i.dtsi is the right thing to do.

Maybe, but this is not a patch for an 4.7-rc* release, but for the
next merge window.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--X+8siUETKMkW99st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXZ59CAAoJEBx+YmzsjxAgm44QAI48tn1GG71g4v/YZgfhq4Mh
BNRc/ix09icyGi6/K/yZrwdFMrHGa/NmHfSGCSMykQUPZMAbrA3WbISGpToiMvjY
tDTnuHPkwIAmLQLW6i+2N1AvUpS+AGYVvqFI2+UTv2mhS83dGmWzVAJTNOebyDL8
U8Xyv1ty+YiJGLfTkeJXIyPA4y9TzQztiaN1MteOGDfX8KM9ggHZKITbLxvCtn84
NA0dyCeF/IH2Fi2620qu76i868CjwvnbPiQP2OhHd06WMxP4EaODQRirQwUtshsN
u8UNlS9AYwe8uevTGQDeFnaDcOkGpiw41WG8dUpOYktWdh8UWKXxWza+VoUuXwFp
QqmU5Nx2UhpRQ/4Y82b/Y7i/BltSKgKpYjVUhtMynjf1v+KQNcmMx+RgmnE+dWpS
cVK91ZuKVn/X4VXg+w3uXXniMBcAqqmYrK9LSKxGXZAkqit5m9JOQEeeiI/waB3S
p4Dxp2b4Nro2brb7rtz0ZW/nxIDRnYHMtQXHgw4cM1CM0DAGlhTu6VuoRHno2NGc
sBiTaBHaFemdqLelWwEztdSxrxG2Y/jzBZOUcA0mZRjEqOAghzfW8yJg8AwERLUL
pN4PU8pZ5H3zb3PvvO14MWYkHrN6axjgejjB9OE/SaEbt8LznHxghKSE17XzoQGV
wXFsF2rrRlnprTbMWXbB
=pkDM
-----END PGP SIGNATURE-----

--X+8siUETKMkW99st--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
