From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun6i: Add
 sun6i-a31-reference-design-tablet.dtsi
Date: Mon, 22 Aug 2016 21:03:57 +0200
Message-ID: <20160822190357.GE7104@lukather>
References: <1471533095-13432-1-git-send-email-hdegoede@redhat.com>
 <20160822183915.GA7104@lukather>
 <c7d7dab8-ee30-8e71-c3b4-16ff1edfe134@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Iy2CUD6FdotTkhwY"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c7d7dab8-ee30-8e71-c3b4-16ff1edfe134-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Iy2CUD6FdotTkhwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 08:55:52PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 22-08-16 20:39, Maxime Ripard wrote:
> >Hi,
> >
> >On Thu, Aug 18, 2016 at 05:11:34PM +0200, Hans de Goede wrote:
> >>Just like with a13/a23/a33 most a31 tablets are derived from the same
> >>reference design. Add a .dtsi file with all the common bits to avoid
> >>endless copy and pasting of these.
> >>
> >>The sun6i-a31-reference-design-tablet.dtsi this commit adds is a copy
> >>of sun6i-a31s-colorfly-e708-q1.dts with a few tablet specific bits
> >>removed / left in sun6i-a31s-colorfly-e708-q1.dts.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >The patch looks ok, but doesn't apply.
>=20
> Right, I forgot an earlier patch in the series, which is why I send a v2.

Yeah, I just saw the v2 and applied it, -ETOOMANYMAILS.

Sorry for the noise :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Iy2CUD6FdotTkhwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0ydAAoJEBx+YmzsjxAgiL8P/0WVGOBzBSbQoYZy7vT1JGfS
J4EzKkeSaqjmHxCf5ioCaLaS5shc5YkdTuSkBuU7DIs9uG2PAqc2hoAGO3w27aTr
NpzPC/AuSm4ad36sKzAHAKCsT/wsk7baAumO+p6NPiNsTMjx/WfadGUMgvM/HxlO
qOQJFf7SnC47v0VYSRiGN1dKVkY15br57dQSaewE7UvnrMowYGHxySAyvsfNIjnE
x5O4lgOY9tlVl7yshoIDsX4J/mAkWW8K8W9ORlMJnnFEKVU+HocQWSkh6HBZeH4o
meCu4rVor034VWrnPUjPj40Q2yNx10nXstXorRKXOlITXiOcZI4S3tbr1OoIvffI
hzNx9Ge68XBbIo3ceMPZRrdKCAEl38NPaDA/26iGWPLTDG9mEMbc6fzXIswFo2KJ
wVhFugo3aQp352d9Zq9rSDjn5NCYB8RO2uE+ET+OGAqp719vC5dfXTw3IRsj2vhc
1TKCP46gAKZCl/AOhkavOFbjdgD+i6NP8F0DGSBn7OmqbWw79lhSAQWjXQttPlQI
KYTIRiLjMAf6oRjOHZo23Rkeq+saME1UFV/8Q2uxBiSvur17F5X6gUxYE7OZnkq0
fcFTg+uPsVWpxFEQtP8ULBBr+zg7RMMGyj2Th1c5r0CvNmLUoLZy+qvXY89pmYyk
8FpK1QXD7sc6IzCmptY+
=jx6i
-----END PGP SIGNATURE-----

--Iy2CUD6FdotTkhwY--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
