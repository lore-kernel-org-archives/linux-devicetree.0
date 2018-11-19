From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add and enable
 CAN,FD device nodes
Date: Mon, 19 Nov 2018 11:55:08 +0100
Message-ID: <20181119105508.GC932@kunai>
References: <20181118173424.4807-1-marek.vasut+renesas@gmail.com>
 <20181118230313.GB2553@kunai>
 <63e27a31-d599-4672-87b9-48b0f542313d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5247331652403139844=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <63e27a31-d599-4672-87b9-48b0f542313d@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============5247331652403139844==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Same here, what was tested?
>=20
> I connected the CN10 to Peak CANFD, brought both interfaces up at
> 125kBd/250kBd for FD
> $ ip link set canX up type can bitrate 125000 dbitrate 250000 fd on
>=20
> And ran on either side:
> $ cangen -m canX
> and
> $ candump -t d -dex canX
> This should give a good mix of CAN messages.

Perfect, thanks!


--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvylowACgkQFA3kzBSg
KbbOCw/5Aci9Eca2FgVDCAhBYBFYYmMvATDf1/2t+CTBrY4UaqOA7PW5CH2hhzHK
ayqzP5WkKahb4ZGJRvZMWuRx1Dew+g1Hk4+r9v7lnwpmE8/G/+h9eaekGIrB7xd5
DAvXgrGqEkX/NE9lFWkU4BtihbRF/deuk3i8YFTJK03QLRwSdJjoCh/vY2NeAvH8
M6Uw/skuVAlSnopmRw1oAykg+ftYcYtxM3Fc51II99QeotQ7nFD/KrGx66wy/NcK
dNmkgMZf1BSqt2oBPlHlUJorIO7Ksiw3tlBwG1Pv4yPXz7JCwAejl1GJeGEjAvW7
HA2ACNC7Ttf+k/2Y+QxoLbYkGybHsR2NtkZqIhgjYZqvohRp/ARfBCjxFj8Aawyh
TptawEwYWaMag6BX/vi3na7xf/JsbvemmR8kkO9vCzMKGfGzckI5JCP+UZvg2/sN
7TdhT5SaMGvruha13FK+cFfO0aQXHRqzo8JGHQCjXRV/17eWN+E3scVUUAhbZQnX
/1crOPvTozw4N8tkyP+FB1TBF1rWwrGya72JxVc/eTOkdT84NdzJbH5cOpMWMrL7
LvhPbWR4drPElYdWwEk5fEb2XLYoqOwXgaOLLV3bY2mnKTQM24m8L35yM8+Q/D9H
kSH48fYB8fGxrRF6SR1KzllI7YTOiQyqMfGUu+2FLezHHutbBfs=
=c0SH
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--


--===============5247331652403139844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5247331652403139844==--
