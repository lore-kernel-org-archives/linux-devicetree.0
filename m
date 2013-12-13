From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] lis3lv02d: update DT binding for use with Nokia N900
Date: Fri, 13 Dec 2013 23:59:22 +0100
Message-ID: <20131213225920.GA20534@earth.universe>
References: <1386968094-24554-1-git-send-email-sre@debian.org>
 <52AB8ACB.6000101@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52AB8ACB.6000101-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C9ric?= Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Cc: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 11:31:39PM +0100, =C9ric Piel wrote:
> On 13-12-13 21:54, Sebastian Reichel wrote:
> >The lis302 has already a DT binding described in [0],
> >which descibes misc. hardware properties. The current
> >binding does not support all values needed to convert
> >the Nokia N900's platform data to DT.
> >
> >This patchset introduces support for describing inverted
> >axis, configuration of second wakeup unit and wakeup
> >threshold support.
>=20
> All the three patches related to the lis3lv02d driver look fine to me.
> Here is my signed-off for patches 2, 3, and 4:
> Signed-off-by: =C9ric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
>=20
> I've got 2 side questions:
>  * How do you write a negative value in a DTS file? Is this just the
> very standard way (i.e., -), or do you need to use a specific
> technique (such as 2-completemnt on 32 bits)? If it's not the
> standard way, it should probably be documented somewhere.

One can simply use -, but one has to put the value into (). This is
because DT supports simple mathematical operations for the values,
e.g. 5-10 and must have some way to distinguish between (5) (-10)
and (5-10).

Here is an example for N900 axis configuration from DT file:

 st,axis-x =3D <1>;    /* LIS3_DEV_X */
 st,axis-y =3D <(-2)>; /* LIS3_INV_DEV_Y */
 st,axis-z =3D <(-3)>; /* LIS3_INV_DEV_Z */

I had some trouble to find this out myself, so probably its a good
idea to document this somewhere.

>  * Who wants to carry these patches? Can they all go via the
> devicetree branch? Or maybe Arnd or Greg would prefer to pick them
> via the misc driver branch? Both ways are fine for me...

I don't care, but it would be nice to see this in 3.14.

-- Sebastian

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBCAAGBQJSq5FIAAoJENju1/PIO/qatMIP/2mtZr9XZRIXlLJ0CeQfSgld
rKCReUtIJboP65G3T8AyvAEVOpz2qAVKYlmlujplsKEJmz5b6SqcXl0Rz3AwLaB1
CqBkPUqJR6tB/fjMYhFJaiKrqVuW7j1La62jjVckl7lv9ESSq+VDKGchV3efA1a8
iOvoUBx0lwzZE6ArZ5z+piDrOVZNpdGP89IJIANMglPfP3auoCowCMi2X1aJbjUY
C6mh5Uxe4TmN2mswPziLUp/GRoBgriBDyKCttHLhQ2OA5VviEQJCRHCJsba4gEZE
PkCF1y9aiMQOXvuuHRq7pMy5NGP0D5aRB3CNPDBtwbL46XsuAM1k4g9MZQjUT7Sn
A2rJCg4k32SsQJUMrL5tFYOndVEvcHavUh4ccImhl3OyJZTWy0zayiW0RvIzi3VZ
fFeMotJ+04GmzVXGJG6UwxYDtxNVKg5s50EcsFwjdUXiEF0SQ5GGozOd7wRWpRlG
DsBm1VfREvrQcveelGI+SEdjyvRIAEtEFePiwHFOiT1XOh/Ils1eH0OCcPNwHLIV
WnyqvPIPWD2ROvLKLdIt9Mqr0Zr3oFMQaRoNkV+b31kZ4S2MVbjd8po7toy70EdF
dv3AuICQDNUYetCpqF45AWnK8zn/76UUP+/GFuPZB2/gAF0aiAU1gSLK10/kBKhX
RTiLJVOT6yIKurzFDnb1
=GdiH
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
