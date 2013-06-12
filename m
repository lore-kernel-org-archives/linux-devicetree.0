From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] pwm: add pca9685 driver
Date: Wed, 12 Jun 2013 13:30:30 +0200
Message-ID: <20130612113029.GC1940@manwe>
References: <1369900212-14368-1-git-send-email-s.trumtrar@pengutronix.de>
 <20130606080300.GG21522@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130606080300.GG21522@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2013 at 10:03:00AM +0200, Steffen Trumtrar wrote:
> On Thu, May 30, 2013 at 09:50:12AM +0200, Steffen Trumtrar wrote:
> > Add pwm driver for the NXP pca9685 16 channel pwm-led controller.
> >=20
> > The driver is really barebones at this stage. E.g. the OE' pin and
> > therefore the corresponding registers are not supported.
> > The driver was tested on a HW where this pin is tied to GND.
> >=20
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> > Changes since v2:
> > 	- s/pwm-pca9685-led/pwm-pca9685/g
> > 	- replace DT properties with booleans
> > 	- whitespace/blank line cleanup
> > 	- add "depends on REGMAP_I2C" in Kconfig
> > 	- rework code readability
> > 	- add pwm_ops.free function
> > 	- set SLEEP bit on request/free/remove
> >=20
> > Changes since v1:
> > 	- fix typo in documentation example
> >=20
> >  .../devicetree/bindings/pwm/nxp,pca9685-pwm.txt    |  27 ++
> >  drivers/pwm/Kconfig                                |   9 +
> >  drivers/pwm/Makefile                               |   1 +
> >  drivers/pwm/pwm-pca9685.c                          | 291 +++++++++++++=
++++++++
> >  4 files changed, 328 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/nxp,pca9685-p=
wm.txt
> >  create mode 100644 drivers/pwm/pwm-pca9685.c
> >=20
>=20
> Ping ?!

Applied with some small fixups, thanks.

Thierry

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRuFvVAAoJEN0jrNd/PrOhyYoP/0Lk5JcEetVEhP5iNDqJAw4x
ueKtcVRcrThE5U6mDm1Azi6VNKVcJy2Bwms2GTrdX8sCg3kuGEer8Xr3z5yiD1zH
vkkOBwOY5h/yke158PFsWEstugLnGazP3y9hz+ljHd5rtxiQHMGiU/wSKHFYTbk3
4hd6beDnAPYuucn5DEeNzZP0rehIp9mO7GWRVpZPZ6hFeDR1C3Cunwpyur3hNMc/
ejebJGWrZ0yNawm2Tdu1lvkDRO2Ka3JHat8G03x+7l817G5aZP3/6d/7DmBgQB6N
W0hRW6lR5eHqvD7CTCXWNwFmVCBcO6hTuldKVIE+MWbkY0m6QezpsKJacZBYmKi5
ctSRgkUg3xYshV0Tp++q8XV8hPdw2KwJzCv7gDIs0sVsKpTnc+LytyvEd16yvYaY
f050dwrUh77VLWnhSdqBakwlb3bSQG357/sErtO0rlE6bq8cu3m2FXE7P24zcCa5
SEL8i7fReXWUSv8HWHyq7uk3t8eWQuZUtnX4hF3DXF9+sn4H585N5zBS/+ZPk4ij
dts1JZh1qHGWRj98S5dkQZaMbiw8eQXIeZcJGNuV0v/+urPPCKDYlPdYTx0MqtPO
/JvtCjTi6l1+Gw6gh/RbeQCzkX6N5Av5qxPG1BXFkH7yU6zfS2Syq4/mG0cNqrd6
BPToQjg5+AD7ikzM0ZRm
=vlOx
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
