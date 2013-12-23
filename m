From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v7 00/14] Add power management support for mxs phy
Date: Mon, 23 Dec 2013 10:58:51 -0600
Message-ID: <20131223165851.GG28679@saruman.home>
References: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4814975706115222253=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@freescale.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rob.herring@calxeda.com, balbi@ti.com, kernel@pengutronix.de, grant.likely@linaro.org, shawn.guo@linaro.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4814975706115222253==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Content-Disposition: inline

--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 20, 2013 at 03:51:56PM +0800, Peter Chen wrote:
> Hi Felipe & Shawn,
>=20
> The serial adds power management support for MXS PHY, it includes:
>=20
> - Add one PHY API .set_wakeup, and related API implementation at mxs phy =
driver
> - misc changes and bug fixes for mxs phy to support low power mode and wa=
keup.
>=20
> It is based on Greg's usb-next, 3.13-rc1.

I can't take all patches through my tree because it lacks acked-by's.
But I'm afraid there are dependencies with your patches.

> Peter Chen (14):
>   usb: doc: phy-mxs: Add more compatible strings

ok

>   usb: phy-mxs: Add platform judgement code

ok

>   usb: phy-mxs: Add auto clock and power setting

ok

>   usb: doc: phy-mxs: update binding for adding anatop phandle

ok

>   ARM: dts: imx6: add anatop phandle for usbphy

misses Ack

>   usb: phy-mxs: Add anatop regmap

depends on previous

>   usb: phy-mxs: change description of usb device speed

ok

>   usb: phy-mxs: Enable IC fixes for related SoCs

ok

>   ARM: dts: imx: add mxs phy controller id

misses Ack

>   usb: phy-mxs: add controller id

depends on previous

>   usb: phy: Add set_wakeup API

ok

>   usb: phy-mxs: Add implementation of set_wakeup

ok

>   usb: phy-mxs: Add system suspend/resume API

ok

>   usb: phy-mxs: Add sync time after controller clear phcd

ok

Considering the dependencies, I think it's safer to defer this patchset
until next merge window.

cheers

--=20
balbi

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSuGvLAAoJEIaOsuA1yqRETGIQAIqAe+ZGq0M9jSkJANdGFX6t
FDy3BB1FpnoYe4WRkfqHRaZPbi1/7P5Oa1DgyRAB7pfO2f/di1XqIsIjzspjt/Yc
u/lwQv88rVhorxxuU+eFmaaH3pY/fKjQi5Bmqc3guqEV8AIlHTnnvN+g3yGqDJ9G
Dy8+0IQuAh/xJZzxTltz6cCSHfOFP1iL5I7fY+S2e06JiwplpZJGfkMuDB5sJqgc
oQIysrKKb5O5+Ujpf4HG8BwDkw/In+5IpllkGpuD+X1EullkLga1YNYU4FqZ4Esx
e8IkrDA91Equcxr/YLygmd01hjBG7pC7aL+GOPLfcPOc/ynxoPM0v/5OAbQ9HoSb
/Kl+VEsK1yIrdus1c8Z/b5mcocQpV+YoGwi8QmHtwDwQXcIYlVTTWOiAeviIaIw8
qzi+eiKA2rI9R6hEkyDMkuFeANAJpYnrqyWD0DFy6exiYMNZI4P5aW33ea1TKvz/
FfQohv36Mda7y3n4jE/3P6CMppzm8uTkmUGbO56dEbSOi9IEz0q2mMXnVnu/d8Pz
V8ZHJzhaENVBMnTUhXRypA7BPH703aMx5CyGa+091AgwfGJPJ6bnpxOS02h0twRy
9UIBpXjm51RIKfERrRV4It7EqdHQ4hfe3WBmc0GUKUXEZqKeOiTRScYgkO5aAuH3
PPRqbmfytZomshy9n57m
=K/yJ
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--


--===============4814975706115222253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4814975706115222253==--
