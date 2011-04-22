From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Fri, 22 Apr 2011 08:07:28 +0200
Message-ID: <20110422060728.GC24653@pengutronix.de>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
 <20110418160658.GD23814@pengutronix.de>
 <BANLkTimFnfgiQ5aMq_KwqHP8p92pjOJJwg@mail.gmail.com>
 <20110421120855.GC2135@pengutronix.de>
 <BANLkTinBZxBcc3fRo_jc4=VuY3D2pbaAzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTinBZxBcc3fRo_jc4=VuY3D2pbaAzg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Williams <john.williams@petalogix.com>
Cc: Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org


--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The difference between what you are doing for these multifunction
> devices, versus the generic-uio approach, is surely only a matter of
> degree rather than fundamentals?

I don't think so.

If you write "uio-generic", then you explicitly specify uio which is linux
specific and not hardware related. There is no uio-hardware :)

If you write "fsl,mpc5200b-psc-uart" then you describe that in your hardware
the psc is used as an UART (and not SPI) and every OS can make its assumpti=
on
about it.

So, you could have "company, super-fpga64-uart" which would bind to the
corresponding UART driver. And "company, super-fpga64-encryptor" would be
handled in Linux by the uio-driver if you setup this way, for example. If y=
ou
later have a seperate driver for it, then it will match against this
compatible-entry instead of uio. No change of the devicetree, the hardware =
did
not change.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2xGyAACgkQD27XaX1/VRsuKwCaA4fXlV4YyAvZoeN8BIXEd3Ig
WuMAoMUiW72a5vfVvaq5LSfKI8abs8Vv
=+a14
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--
