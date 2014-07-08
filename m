From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 09/18] AT91: Call at91_register_devices in the board files
Date: Tue, 8 Jul 2014 10:06:36 +0200
Message-ID: <20140708080636.GK13423@lukather>
References: <1404396906-25194-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404396906-25194-15-git-send-email-maxime.ripard@free-electrons.com>
 <D103F102-4B04-4CC6-8F20-58CEB0EC8E36@jcrosoft.com>
 <20140703145222.GE31996@lukather>
 <20140707184239.GI9558@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1173836386557349783=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140707184239.GI9558@ns203013.ovh.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: devicetree@vger.kernel.org, dbaryshkov@gmail.com, Nicolas FERRE <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas@free-electrons.com>, Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, dwmw2@infradead.org, linux@maxim.org.za, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1173836386557349783==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 07, 2014 at 08:42:39PM +0200, Jean-Christophe PLAGNIOL-VILLARD =
wrote:
> On 16:52 Thu 03 Jul     , Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Jul 03, 2014 at 10:29:58PM +0800, Jean-Christophe PLAGNIOL-VILL=
ARD wrote:
> > > no do this at SoC level
> >=20
> > Since it has to be done at init_machine, I don't see any other easy
> > way to do this at the SoC level.
> >=20
> > What is your suggestion?
>=20
> do it earlier as there is not driver it will not change anything

My question remains. When should I do so?

at91_initialize is too early to register any devices.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTu6aMAAoJEBx+YmzsjxAgXd8P/3/sIr09/dBiiK9YXylAr1Rc
N4FXt3EYOlWoHJfHYELtKyWS8+SCFZD4MWaKwGhSPA5VZB5LlDnrLNE0HrvmvFgC
k0HIb8Qlt0A0tU7WbArMsyYtspRdDTJIxZFp2wxiu8PwazqouDMG29PHpYYbaHw9
JvUKpBh/xCnSL2wAq10UPillTbUuxuFpd8CdFiYmq+/LoFhypDp8q29bBKAvZ0ud
qymON7Xqop0IqGJpL6xFOD/y1qCvuGbYWSHfzNhotPfp5dnrOa1MEnOF6QdPTKS8
4vaLV9umV7o9val0cno1dFrhsH1N1qo52WG07Hm7+fwpMtcgGkNvIToZurwGFheb
yt2sYJx0knVYUAMPa4ome1n2Z8FJgDpBR/4jR+IVfnqU96ArylqsdWW4ZLm95SQL
QSrtPZrvhaPSxdugx0Zdvj4QD/sqpijrpBbYACIwHrjWUHU0S9AhY/T24yd7V5t0
9Cz/73gKGDTfJvIfMvSJ/q2BBMK6Gdtcg7TK5iaMP8cElmdj4NdS0EGaZiYzUB2i
SdFUIthbZA8QzWD5jAgKirZgr4ZZJkQH0B02eVKmFMp5h4ciefTpB3PM2TnZAWlP
BIrJ9lppmvGC9uhLlBjREe5W2FIiFvkNSU7Wz6+E49uv2HW+F8+m7/2momn0//M9
FdDuQ01C59znuiHS+L8h
=+BdI
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--


--===============1173836386557349783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1173836386557349783==--
