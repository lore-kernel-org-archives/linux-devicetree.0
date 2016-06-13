From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/1] ARM: dts: sunxi: Fix simplefb not working in 4.7-rc1
Date: Mon, 13 Jun 2016 10:01:24 +0200
Message-ID: <20160613080124.GA4481@lukather>
References: <1465063524-4925-1-git-send-email-hdegoede@redhat.com>
 <20160609074643.GA5242@lukather>
 <21258fc0-0250-951b-2ee7-d022fb3c09ac@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <21258fc0-0250-951b-2ee7-d022fb3c09ac-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2016 at 12:47:36PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 09-06-16 09:46, Maxime Ripard wrote:
> >Hi Hans,
> >
> >On Sat, Jun 04, 2016 at 08:05:23PM +0200, Hans de Goede wrote:
> >>Hi Maxime,
> >>
> >>While testing 4.7-rc1 / linux-sunxi/sunxi-next on a A10s I noticed that
> >>hdmi out is no longer working (screen goes black when the kernel turns
> >>of unused clocks).
> >>
> >>This is caused by the dtsi for sun4i / sun5i / sun7i based boards now
> >>listing pll3, without pll3 being added to the clocks list for the
> >>simplefb nodes.
> >
> >Why not do just that then? It's more appropriate for a fix imho.
>=20
> You mean just for sun5i-a10s, or for all of sun4i / sun5i-a10s and
> sun7i ?
>=20
> For sun4i and sun7i things are already fixed in next:
>=20
> https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?id=
=3D5a7f2310cc847a73852e70bc720a61ca9bf986a6
> https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?id=
=3Dc79255ca4d7b67cce4eac4dd532e097ce49f3679
>=20
> It seems best to use those fixes, rather then come up with a separate
> fix for 4.7.
>=20
> My patch for fixing sun5i-a10s is inline with the 2 above patches,
> which seems best, rather then doing something special for just sun5i-a10s.

Well, you are doing something special for just the A10s: the patches
quoted above just add a bunch of clocks and add the handles to the
list of clocks managed by simplefb.

For the A10s, you also declare the whole display engine block without
anyone having tested that it was actually working.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXmhUAAoJEBx+YmzsjxAgW0sP/j/xev7Z8pdDleEhAzVTDpgZ
DKXVcbb0al9K5nd0bhfEgRV2BJZ1M3LqqcWn6TkiQlRbi2HBJLzF0rXrXewP82LD
yYUBRZ/kJEULGkgVG+bZAzHNaOGfiGdvWGnWFKbFoD8HtcSHrJBJB9/k707skrLX
uHNIGDBucDuG2QWjIU0J9DHmfdtR1PpfoKWM0b/GbTMilMy3+D2cmEBaOZNzEiSd
4iz4bxI3diSAHLmhdteW/DCRwGVear/zjgrYE+qym8+gwdslPUuFuAlIZb4mj+Hi
ASIvV/wQmtpA+Hq+xosdaU72K0tqBvaK7Icb+HvChBUnYcmf/GJmxncZQpMOEJwf
6cklyrIPWaCtfZXMcY8ip67pwvca99M/mFLaIXVoeOoaAQ5ghpel787VQ5DfbC8H
tlN2VWMpxwtNRnU5sbW1sfR0FaEw1D7K9S8fE4kTGuZXV07AM08DfjJ/w0GFk/o1
ZskEmdFzayTAaf4KrPvrDWXqdNCVPyEm62EDNTGcqUyA9HQLphcI6b0dF+BSxG5J
m8Dbl94SUhZhc8g03G9xDNRJxgfS+RBxlw2LSMnbQlaqg/LGhZpkficf1yUfWOzq
kP4PsUOpFLmO7aHwcUfujLNlwDLT+8mY6rLmbWt38yWOOW3/bPAMaZS4tq0pia2t
EduBTTtDj6MqsD6kJ7b/
=RyoS
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
