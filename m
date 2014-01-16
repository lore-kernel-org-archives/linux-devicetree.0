From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Parse missing regulator constraints from device tree blob
Date: Thu, 16 Jan 2014 14:07:12 +0000
Message-ID: <20140116140712.GE17314@sirena.org.uk>
References: <27224826.584141389879802275.JavaMail.weblogic@epml20>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <27224826.584141389879802275.JavaMail.weblogic@epml20>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Saurabh Singh <saurabh1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org" <celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org>, SREEVATSA D B <srevatsa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Praveen BP <bp.praveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2014 at 01:43:23PM +0000, Saurabh Singh wrote:
> Hi Mark,
>=20
> New patch incorporating your suggestions is given below.
>=20
> > * None of these properties are documented. Documentation is required so
> >   that the contract is defined. That allows people to learn how to use
> >   the properties, and makes clear what we can and cannot change
> >   kernel-side.
> Done.  The documentation is in the patch below.

Please send patches using the process in SubmittingPatches, the
formatting of the submission is very important for tools like git am
which people use to work with patches.

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS1+eNAAoJELSic+t+oim9jNMP/ig9ppqMxc0cg2tfMODfcKwc
m/iBW1Ty0SNTuX+VOXnXAQG6YGRT31A3I+V0ANuaeMQ3yXtiSeO7btqrEn22qrTA
0NwGDSazDJiPz2/M/g370H7ky+avRK8WpLVtmClsKGFTJ5Shor86HJZTYv37DPO5
3ybKHfkKcjICpUpNOVn1A0b964lPRGVSkgdheda8J4GOuQbEa2rjnbx//HLHtIe/
NmJYFyvF3DDS9e9boauQySV8Yy9kOGORXreEe2bs9SUsvPlVKSC4Pah+DE9WHy9e
OgvNiwCVwFhH1DI2Jv65IZknm+vVkEoW4D6KXrYHhXr8xMtUQTWRUo2jLu5ylHBk
k+2y0EkJzVoEmh3JQEU3OTEwqnEFi8eI7+P3BR+VdUAMGY8MVIDnVjLzbt7gHstw
o5vLgrvX5h4blIx7fcdOwZTDmbfhyGJO8+Vb24lQ/ltLwuQrFpVUW9TNtzV5AFls
RgfGhOTzp1kD1ykGWlcLG1jMzgmf3GN0bhSkBpeIYPfXAK0u4bBT54rSiUyEX4cg
JpxSVCJeI55Kt+f60Y2cb4woLcJCWwRx6iqEehIrfnSTBtCEWUa0XsyxwXaQ311e
RKLku/VS47OBw4HsOrMzvaZGjVsQoppMadZBudpgBOvpR/zW04xqswtsQMJ+yxol
6V3R1CrISUTa1iFMStF2
=KFxQ
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
