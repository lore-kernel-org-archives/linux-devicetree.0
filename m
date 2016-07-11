From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/15] ARM: dts: sunxi: Add reference-design-tablet.dtsi
 files + 2 new tablets
Date: Mon, 11 Jul 2016 08:39:59 +0200
Message-ID: <20160711063959.GB4589@lukather>
References: <1467993956-19535-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467993956-19535-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2016 at 06:05:41PM +0200, Hans de Goede wrote:
> Hi Maxime, Chen-Yu,
>=20
> Here is a series based on Chen-Yu's suggestion to add a
> reference-design-tablet.dtsi file. This works out quite
> nicely, resulting in much simpler tablet .dts files, as
> well as enabling a bunch of extra features on some tablets,
> showing that having to add the same dts bits over and over
> again for all model tablets is not a good idea.
>=20
> This also includes a v2 submission of the new tablet dts
> files which sparked the reference-design-tablet.dtsi
> discussion.

Beside the minor comment on patch 13, applied everything.

Thanks, this is a very nice cleanup.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgz8/AAoJEBx+YmzsjxAgZWQQALOxG0iDKNDCT1PKBzn/A7OM
OQPIQp107l6RvKZH1sQF7T4WkRCIYw9aAPa6MoIDePjCGci6QIbiD3nO8wD21lqf
lkUAU25ldnkZUip17rfSPTj8cmOiLOSBUfiS247A0EMscFbCS1jHbMYhE88QeRAP
wQeuJ6h9paoMk8VkGwbZl9F0cZALbc3vfF5fQXb0w6PfDn7IMxnQhDMwZ/x4KQ7B
qsOwLdNPD0jskqTZn70EDbqpGEGyfmFco8t9Yn6S0OzOIS6EshxiOiguMssWoCF9
/HHA/+RJJeTS9uGVu1tX88fbFK51dp95okCSWM5Xaw0x4ZPcT/eGU3EUhrroLWHq
p1RitZ2J/4dx4lhJJvFkMIL9r2SfzWogy2Q92hNMfw2hM535i9Fg964FSEJPEDVr
eq7kGEjycmZr9/kOuW3A5NlgXuiKY6SqkRhxQS3nGHD7sToKlksncnPKUlgC9Yh8
lHwwzxccvBe1Z8mOCMOZrlLNSU4ihmV8xqakFeokU3FikSjyR76ggJAbIshFNx9f
fFQxT1BhhHRHp10MypnTP00E/Q8UoJZBh62TlUT4AMjkzb0dtva7zEXncQ8xrxkj
+np+6j6FEX6SoHtFsiWKcJBAbcCg62Xe6JUXy5WUedtD2cSPdzH/x3TdCbCjnbnD
QKK3yOCaKZtFPa5og1rS
=Qm5L
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
