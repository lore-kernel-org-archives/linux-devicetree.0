From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: shmobile: koelsch: enable HS-USB
Date: Wed, 8 Oct 2014 13:05:13 -0500
Message-ID: <20141008180513.GJ22688@saruman>
References: <1511869.4ca9KHmSFr@wasted.cogentembedded.com>
 <8674731.7YYzQeH0h1@wasted.cogentembedded.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I/5syFLg1Ed7r+1G"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8674731.7YYzQeH0h1-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2014 at 10:02:44PM +0400, Sergei Shtylyov wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>=20
> Enable HS-USB device for the Koelsch board, defining the GPIO that the dr=
iver
> should check when probing (which is the ID output from MAX3355 OTG chip).
>=20
> Note that there will be pinctrl-related error messages if both internal P=
CI
> and HS-USB drivers are enabled but they should be just ignored.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> [Sergei: added pin function/group and prop, moved device node, fixed summ=
ary,
> added changelog]
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>=20
> ---
> Changes in version 3:
> - added pinctrl-related properties;

did you miss pinctrl here ?

--=20
balbi

--I/5syFLg1Ed7r+1G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUNXzZAAoJEIaOsuA1yqREpwYP/jIuyFmwo+mS0VUDwsEqRfTm
icWV9Ul9xuSeE2JxUceo9UyITWxCtPzcLImptfTRQqSBVngnw2xo3dRewvE94TEt
j2Ck5/mVzOxdqUKLI+0CDfpC4O2ID7nz7RjGlaTg3Gc8hdKxyN2qgxwjWbaJ0cfW
j/uvk5i10+XO0QXPf3/D3J3OvMNjlgxHK+A1W/d+AeE/fk90qWvS8m6WCb+xIRv3
dyAOkqOB3TTAKIBLTjPF3QJ0UcCAP47VstGv27q0SCS8ABYrfo71tqCHjceP3/e/
2OBszAuYJl20H/ICqf/7z6DdnnVPvOHL7zNorKXAFDalHFOTiCkjzkez6/g8tGMZ
nkINt852ZmXPNfNVYh60IPmOn+BHUqsvQkuZbN6DtG8drFXDBqpqEXG5npRvPGyY
pD+1QENSLO78hU+Mta9OrtL25aMFXhqYL8SkKKZTxZnUaEvBjjny6opD52NqHwDJ
VxstqMWc8cB+PX/8mzB4gQ/wyD26xWWFl/JMNUuNdTOccAjqCT7IAmMufrUF6oMs
txJkeKMnYVx9M91Hh+mbn+yj36B2h+flpo9jwQe6qx1a9O9ORAQ5U4dGDt7m0eTD
Ll1HK98GOYnY2s2FvbU/5gAbZLtXs/NvmM7RFhZ/g+vF32LiwKRen45IkILH8bnJ
r9CfGvwcy9jdpyx1/33E
=tl/+
-----END PGP SIGNATURE-----

--I/5syFLg1Ed7r+1G--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
