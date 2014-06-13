From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Fri, 13 Jun 2014 15:20:22 +0200
Message-ID: <20140613132022.GJ3448@lukather>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
 <4285095.l6sVUI20tQ@wuerfel>
 <CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ@mail.gmail.com>
 <5045739.TmqqIG2CDG@wuerfel>
 <CAKON4Ox+tCgiu6N988ds7ED2KbECw=60Y6BRqV_2UcM+vshw4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKON4Ox+tCgiu6N988ds7ED2KbECw=60Y6BRqV_2UcM+vshw4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 09:14:45AM -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On Fri, Jun 13, 2014 at 9:08 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Friday 13 June 2014 09:05:14 jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> I was adding the CPU revision ID to the top level compatible string,
> >> nothing specific to the device.  By knowing the CPU revision I know
> >> which errata to apply.
> >>
> >> If you patch the device strings, then you have to maintain knowledge
> >> of which devices are broken in two places -- the device driver and the
> >> machine file where you are patching the strings.
> >
> > IMHO, the driver only has to know what device versions exist, it
> > shouldn't need to know which soc has which version of the device.
> >
> > Can you describe which kind of quirk you are looking at in the driver,
> > and how common it is?
>=20
> Allwinner wired the volume control for their on-chip codec up
> backwards on the A revsion of the the A10 chip. In later revisions is
> it fixed to work in the right direction.
>=20
> I was wanting to add code like this to the device driver...
>=20
> if (of_machine_is_compatible("allwinner,sun7i-a20a")) {
>       fix bug
> }
>=20
> Another solution would be for me to detect the chip revision in the
> init code of the driver and remember it.

The point is that you don't have that kind of constructs. You can
associate any number of compatibles to your driver, and data to each
of these compatibles. So, with different compatibles, you will be
probed and retrieved these data directly, without even having this in
your driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTmvqWAAoJEBx+YmzsjxAgI+sQAJr9bpJRM79anywcMxancip3
Zw7CvPpL5CQ3y5Vz/ZahzndY0j7EkqA4MFIrTYhdLM6KOYz9vNDA7qpraMmzl9fz
RDpao7TEwWigYUUkko5THjsvF8Ma7VJ1134HLkgkolBFgUgB5a0474XD0vT4zYwz
lcRU2rrkZwKrEKnsUjclOM4ywOdiwupcgpkflCSf7GvMa9ss4Q6yFLjUXgJrZhcT
4NLzDV7qTRq/gqdl9aTTk3iI1hiqO6nR45+0EIPedFGTaWpako8bJc8b+ivoO8vJ
9QMNx/LKygMFX6uCkEvVscJ6637keGywSC39ynb6gEcZnYOkHOMGsEDwbW/re1DF
sxd64A4YzPfuQf2ZZbOLKBqxDawVGP/apEJGCA2WVeZzys/nJRqrhyM/Gv/86Pb4
t/hcD+OZwqiSoXCylLgdpmFEfFomMW72Xf+WOguWjnF0+oPKdVgd3PUIRxqh3khW
/2raP9R/gdriXcBgYjNF5wEspEjWlc/PBuqUYUgn4Qef1SM5ulkx4XCD1Ufewuoy
X7rL70Y2FDEEdc8w2affI+u2jfP6h31LTdc3UikwPSfdBNfehvgGXT/vcCIKwdC4
l70au56vzJoz2v9lGB70ijORuqokOBMRmZEuykRbbx/4E76+MM4XwC5SZjmv09d6
p0biEVbvhPBqNS6s63Fh
=QmTC
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
