From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 7 May 2014 22:25:13 -0500
Message-ID: <20140508032513.GR7047@lukather>
References: <536A697D.3020002@boundarydevices.com>
 <CAOesGMiHRQV+XngH4ABSeT8KDeP=iKn1ogvTA0j1BdyBwAaWSA@mail.gmail.com>
 <536A71AF.1010907@boundarydevices.com>
 <CAOesGMhMeLkzEeVKHM2G9Vqth6qypURN6mxbNdySVvKhQBCs5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X35wERi4JU/f1kly"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhMeLkzEeVKHM2G9Vqth6qypURN6mxbNdySVvKhQBCs5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--X35wERi4JU/f1kly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 10:55:27AM -0700, Olof Johansson wrote:
> It is really annoying that you can't include a DTS in another DTS
> (only DTSIs). This is a major shortcoming of the tools, as far as I am
> concerned.
>=20
> So, the best way we've found to do this is to create a shared dtsi
> that has practically everything in it, then a skeleton DTS for the
> "full" product, and a separate DTS for the cost-reduced version. The
> cost-reduced DTS would insert a status =3D "disabled"; for the sdio
> controller. That's a solution that scales very poorly as well, though.
>=20
> Best would be if a DTS could just include another DTS for minor
> updates, such as disabling the sdio controller in this case. I'm sure
> there were some language-puritan reasons for not allowing that though.
> Someone care to fill in the history?

I don't know wether it's actually good or not, but we're using just
this for the imx28-cfa* boards, and it works quite well.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--X35wERi4JU/f1kly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTavkYAAoJEBx+YmzsjxAg42UP+wXrOOICpfDGFPhg7ZhuJDSv
Ainei0mYUv5j/tYJCtuY36uE2Y6Szgjwv9+nliK2l26Hfsm55rMm4OWcmtdPXOQl
RAjlyg0/BW/kLKfv2pXeIM3fD7aQ7/Cx+gJWqmkuUreNEbiyJzwMvP3yZBl+xlQ3
KpK1qD5yJVjqdbXS9eRrWT+6ONFcf8O+t5/IRqHpwed1ZTlcBlpmUmMK0UtBduAp
6Y2/qQ/h+sVAuurtzSNV906fnZG2jfEuVUJPRuk/u0DKvavqsL9JUM8F17sWsmNe
v1iI2U22qbO4MkN0vSvNJEp//DR78yThWn78jB40NkJoNDyYeRzO2kE4gyBI/Ool
ntr1Fp+/2nMnBPqZWStknPo+O27BAjmliR7CLtzofCBQhkH5wNoqDM2FwPJu3lwa
VeDzq9Dv/hs/ywcfM6LlSRMhfRnsM4UEFgbiRDjXOJOlxRpbcygddoSF5wc7eS4L
AnOIkCiCUGwt87hzZapKfRBye+/BQDMSUW8ZGip/x8yvgjdNi84Gz3DS14oXzX27
Fr2WXZhp1fFGdOtBfhdn1ZGu2ysysRd5q4IIS+IOElj9Aq/DIaZFQMZWxvZ551zn
Hnml82FHPtskyDu5rOEwhiJSy9FCf/MUgPgcT6AhBKXOk8Gf7hq0YEzDSkdJPwHG
S3bL/KBodF5KdD/Wllll
=ucCQ
-----END PGP SIGNATURE-----

--X35wERi4JU/f1kly--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
