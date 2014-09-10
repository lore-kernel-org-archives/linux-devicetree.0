From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] mfd/axp2xx: extend axp20x to support axp288 pmic
Date: Wed, 10 Sep 2014 10:25:37 +0200
Message-ID: <20140910082537.GC31276@lukather>
References: <1410267775-4683-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410267775-4683-3-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410267775-4683-3-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2014 at 06:02:53AM -0700, Jacob Pan wrote:
> XPower AXP288 is a customized PMIC for Intel Baytrail-CR platforms. Simil=
ar
> to AXP202/209, AXP288 comes with USB charger, more LDO and BUCK channels,=
 and
> AD converter. It also provides extended status and interrupt reporting
> capabilities than the devices supported in axp20x.c.
>=20
> In addition to feature extension, this patch also adds ACPI binding for
> enumeration and hooks for ACPI custom operational region handlers.
>=20
> Files and common data structures have been renamed from axp20x to axp2xx
> in order to suit the extended scope of devices.

I still feel like this renaming should be in the first patch that is
already advertised at doing it.

This is quite hard to tell what you are actually doing in this patch,
besides the renaming that is.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEAsBAAoJEBx+YmzsjxAgHg8QALLFLYzyhPCN5S8rUj6NA9ll
9JjSqPmyjAyDZT5PUupjG4hOOiYVEekCxecOmJmmADTtK3BkziCnYNLI8CgjO0GP
yuD2jmOnMEeyjr0Ig+9MVoaI1vC/ouWsY/GDpPXcwbHJLizYoq1xvb4NRT6/Yal8
kr6ISFLqS3SAxIC4HoGRP3LxiZwOXgQavIrJ16fcvlMBbO/WLGZ7Gcl9EKmi4Hlk
tmVIjUaEMEEGbhB0c0/Pp11f/SvLFOf8cSMLlmTGZX96RRCDfrho8wPf7jYPKj6a
fHGxmUe/dlTm34yZ/VgfO7veE2W5E+w2RZIb9KkdmQtQjsCoAPJDaHioeAxOkyUJ
T5X7KuZqaaMieT6hGMvSVaE9ZLdDmxmrhPwqXpYcZGX9WOjZ7vEDAmWK5IYTXtEE
et8etzxA3KpS0ZwZbPtE8WciG9hSpBcXxfrbqRTjKcBD73tTJYl6vgq1N5k3B8dm
NOGn8uY9H205+IpbfCE6ElwqS+TTmwWElAZPOoxh8hIAuP24pKii/S7fkOFPVPA0
UaENXebSANCetlg4qMaYrNvx7PQaTC9BmcTF6IMIvSaMG6tADYgHc24BkTS+HK4W
wDYB0TDFjsJXAw3WtR/4tmfS1Z6/IqfkHUc8LfOKUAZSmeylENuk8BedMr09cFkA
4O6Mj+Zrrz1/hRkf1ORn
=cFLd
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
