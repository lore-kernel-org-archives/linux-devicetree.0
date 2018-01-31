From: maxime ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sunxi: h3/h5: Add DAI node for
 HDMI
Date: Wed, 31 Jan 2018 08:16:16 +0100
Message-ID: <20180131071616.jrkd465cq4mgyyvm@flea.lan>
References: <20180129092223.12423-1-codekipper@gmail.com>
 <20180129102227.ejmbifzjqmba3yja@flea.lan>
 <27087126.4975652.1517222127863.JavaMail.zimbra@musers.siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qjsu5dnb7uricuka"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <27087126.4975652.1517222127863.JavaMail.zimbra-uhf9zSJETnQdlpnTk8+5LA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qjsu5dnb7uricuka
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2018 at 11:35:27AM +0100, Jernej =C5=A0krabec wrote:
> Hi Maxime,
>=20
> (previously I respond only to linux-sunxi mailing list)
>=20
> >On Mon, Jan 29, 2018 at 10:22:23AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>=20
> >> Add the new DAI block for I2S2 which is used for HDMI audio.
> >>=20
> >> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> >queued for 4.17, thanks!
> >Maxime
>=20
> Please note that HDMI I2S has usable 4 I2S lanes, since HDMI
> supports 8 channel audio. As Marcus said, other blocks probably
> support them too, they are just not wired out on pins.

I've dropped those patches for now.

> Should we change compatible for HDMI?

I guess, another way of doing things if they are strictly identical
but for the number of lanes they support would be to add a DT property
for that number of lanes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qjsu5dnb7uricuka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpxbTAACgkQ0rTAlCFN
r3SGAA/9E0dZ2M5IGRwiQPqbt1ilsKHYRw4d6C+4jfW4ZWW+OPYvZZebevx3aUri
3G7LVNG43PBkNGcq8roM2GAC/Q72d4I6ZoWVbu7aKVVzhHZut22ggGIJdkAXW2h8
R7GBPBJW4NDt1JwQGaPxPSyYHQcEjDfDhTLCaef7PbiQABOdGpeBeT1rTip7FjUo
REWV6HZP6nYaER2ATPhVhca+hwno5fBBpY33hBLABhNMOOXhLV5r+hS9E/7unnGT
aZO10jKP9ERK4WfLITzvR2e9f14y342gFE8rSleKPUDYhsoi7fm2fmlXdN9bbxaE
sWhwzbjQhebZEUBJmEUz9hDz448T4M4xRsgW6B7aG2oBSzOdt7r1g5hq1Vf0h/k7
qpwgRBP0EMxfIxdAPD9cS3bz2K2MbqrkyEDUAmVK4u7bzI4mFrX7ZBwp5IX7gB3m
JLwy9W6a5iru05UhoEx+uUUGzTYJU09FX7qIi29vaSJ8DTMQjQaSjjt9Auy8SR0M
LwA7laXrTDGBmOMcoQMZcgc3aBnpiFCYh8a3jCqV+whGNVOsRmKF+JD0jdmmY0zm
2trTIyelZfGwdOA1vr5lM7aOpY3TJM+CHUverCJNcF6GunBI42oZOJNlVahRtfAm
J6ySAaiZqtVgdvr256kcKn3rLwsgPuBY2IsOcjevSk260TiU1XU=
=bAz4
-----END PGP SIGNATURE-----

--qjsu5dnb7uricuka--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
