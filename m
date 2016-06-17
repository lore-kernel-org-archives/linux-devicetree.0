From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Add dts file for inet86dz board
Date: Fri, 17 Jun 2016 07:46:07 +0200
Message-ID: <20160617054607.GN5144@lukather>
References: <1465754150-16753-1-git-send-email-hdegoede@redhat.com>
 <CAGb2v66cbx0jta1unrKeYm1t9JKO9Unw8z75rXbW3JSi2=NuMw@mail.gmail.com>
 <f080dda9-6410-ec79-f083-29a20d147d61@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K4LMwn8CgX2KMboP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f080dda9-6410-ec79-f083-29a20d147d61-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--K4LMwn8CgX2KMboP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 11:35:15AM +0200, Hans de Goede wrote:
> Hi
>=20
> On 13-06-16 05:16, Chen-Yu Tsai wrote:
> >Hi,
> >
> >On Mon, Jun 13, 2016 at 1:55 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
> >>The inet86dz board is a board used in 7" tablets from various oems.
> >>
> >>These tablets are a23 based 7" tablets featuring a 1024x600 LCD,
> >>512MB RAM, 4G NAND, rtl8188etv usb wifi, gsl1680 touchschreen,
> >>micro-sd slot, 3.5mm headphone jack and a micro-usb otg connector
> >>which doubles as charging port.
> >
> >This seems awfully similar to the sun8i-a23-q8-tablet, any reason
> >not to include that or sun8i-q8-common.dtsi?
>=20
> So to answer this both for this board and for the Polaroid MID2407PXE03
> one, these are not q8 tablets, they are not using the standard q8 casing
> at least. So using q8 for them would seem to be a bit confusing to users
> and figuring out how to do proper autodetect is already hard enough witho=
ut
> throwing these into the mix too.
>=20
> OTOH you are right that there is a lot of code duplication here. Since I
> plan to start working on touchscreen autodetect soon-ish, let me see how
> that goes first.

For reference, I'm not really against having similar boards having
similar-yet-duplicated DT. This is just data, and sometimes trying to
factorise things also make it less trivial and easy to understand.

> Maxime can you drop the Polaroid MID2407PXE03 patch for now ?

Done.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--K4LMwn8CgX2KMboP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXY46fAAoJEBx+YmzsjxAgcesP/3z+tK3cvP1IFmhqnrjfBhZh
TkgQGyK4Bsmx3LENIJTduZqj5uT2HRqQvXlNS5whohlwUvIlw8IMWdl655B0C34v
2HdIo8v8svVI1uZbxdNLhkDSzGBOCPs38Cb7eEEIx/6NTXw+RWsU+naf7kDTDxxO
yLYxm5Xk5XX+UNj3eVm3fOc51aHyBB02uYAydxe175eCURseciekKEWESpwPGuXe
1AniktIFFGOjoxCTHefRst0Im0lEGwu5nLeNUuMHaLw3GrG7pskuuN8YkIQeAYof
kLud4WOk5ge1G6aL4ToYeOjKFG9iP0wKwP2pDYhQR7H/J96W/jYo1nYsAR+HPP0w
iCJo1pZRq5qUUsEfhbRxbKTbTpcQETwCYz9sGiFK6ho55EEpqrV4ZJ6r38cP1uI8
6zskBzNDAnmvb2hPO/rco5qqjUaKfylmTj/EBDmGUGb4ww8L0InYwzZ228b+V+vI
FFGNYa8wJWzHH861g5ioykTaFHhx9Ep+l5/OloUQOPtu23Fxe+Tbam5+S4nRNZYz
Nx7gVAiRE/VV96OBxL9BEq7Z8wBHzbIlq3HzcUg9G7Gm53yaMdf3bxYZQObbZBF/
1u3S3xPzewRzfN+7vy5Lt1WU00vLlwqfTL4OLTe03J2yA3SdMNMZ2ZDlH8YAPqRT
EDMxCjTEvcyEPx1oW5Qm
=jXZ9
-----END PGP SIGNATURE-----

--K4LMwn8CgX2KMboP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
