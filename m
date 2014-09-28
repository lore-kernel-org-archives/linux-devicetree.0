From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ASoC: rockchip-max98090: add documentation for
 rockchip-max98090 driver
Date: Sun, 28 Sep 2014 11:48:51 +0100
Message-ID: <20140928104851.GR27755@sirena.org.uk>
References: <1410506806-15327-1-git-send-email-jay.xu@rock-chips.com>
 <1410507036-15442-1-git-send-email-jay.xu@rock-chips.com>
 <20140912134446.GT7960@sirena.org.uk>
 <54275C43.8010205@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rnz0oC2K6vQ5doJs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54275C43.8010205-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianqun <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Rnz0oC2K6vQ5doJs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 28, 2014 at 08:54:27AM +0800, Jianqun wrote:

Please fix your mailer to word wrap within paragraphs.

> =E5=9C=A8 09/12/2014 09:44 PM, Mark Brown =E5=86=99=E9=81=93:
> > On Fri, Sep 12, 2014 at 03:30:36PM +0800, Jianqun wrote:
> >> Add documentation for rockchip-max98090 driver, which is need by rockc=
hip
> >> board using a max98090.

> > Can this use simple-card (perhaps after a bit of extension)?
> I haven't ever try simple-card, is there any sample usage for me from oth=
er vendor ?

$ git grep -l simple-audio-card
Documentation/devicetree/bindings/sound/simple-card.txt
arch/arm/boot/dts/kirkwood-openrd-client.dts
arch/arm/boot/dts/kirkwood-t5325.dts
arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
arch/arm/boot/dts/vf610-twr.dts
sound/soc/generic/simple-card.c

> >> +- rockchip,audio-codec : The phandle of the MAX98090 audio codec.

> > Is the driver really specific to this CODEC?

> I think yes, we need to add two gpio for mic and hp detect, but simple-ca=
rd driver hasn't them

That'd be the "possibly with some extensions" bit then...  if they're
just isolated GPIOs there's not really much board specific about having
them.

--Rnz0oC2K6vQ5doJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUJ+eSAAoJECTWi3JdVIfQprwH/jpU43m2FVwCxdorrZylCftl
kkry0nlH2ddvD2LiQJMZKrfq538rY/2aPLAHzrBGWufyBZ/1BvTWhh5MQV/1/bT3
C0mCniXU1svixSkATR1Zxaz3maUQmRiZvOE8+u4aEQz0kG3IRPOXUPW4suUGdboL
mm/2nmcbgfRyERimwunUrEs6M8OyCfEboPgdTypretGQo75c09gVVQW0oYjPrkx/
o/YPApkuF5OeiiDMYirCfaZ3ASOPpmx8TaInRzIPw07rsFE0K3Ri4OPZGnc+XxOd
aUo9TD09fXUolexFZhzk2pDcF4V/WkfngZTQCEFBHCWwiXDqMf7PwJM4fxiOX8I=
=0XVn
-----END PGP SIGNATURE-----

--Rnz0oC2K6vQ5doJs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
