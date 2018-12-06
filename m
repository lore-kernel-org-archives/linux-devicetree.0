From: Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] dsa device tree bindings: fix typo and wrong example
Date: Thu, 6 Dec 2018 14:05:13 +0100
Message-ID: <20181206130513.GE22343@amd>
References: <20181115195111.GA9946@amd>
 <20181206130051.GA22343@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206130051.GA22343@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, f.fainelli@gmail.com
Cc: buytenh@marvell.com, buytenh@wantstofly.org, nico@marvell.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

   =20
Fix typo and fix compatible value that is not actually permitted by the
description in the example.
  =20
Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Docume=
ntation/devicetree/bindings/net/dsa/marvell.txt
index feb007af13cb..abf1be036ac5 100644
--- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
+++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
@@ -41,7 +41,7 @@ Optional properties:
 - mdio			: Container of PHY and devices on the switches MDIO
 			  bus.
 - mdio?		: Container of PHYs and devices on the external MDIO
-			  bus. The node must contains a compatible string of
+			  bus. The node must contain a compatible string of
 			  "marvell,mv88e6xxx-mdio-external"
=20
 Example:
@@ -80,7 +80,7 @@ Example:
 		#interrupt-cells =3D <2>;
=20
 		switch0: switch@0 {
-			compatible =3D "marvell,mv88e6390";
+			compatible =3D "marvell,mv88e6190";
 			reg =3D <0>;
 			reset-gpios =3D <&gpio5 1 GPIO_ACTIVE_LOW>;
=20


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwJHokACgkQMOfwapXb+vLyigCeLkj/l6l1yqQPcXbuCB2AXFQ8
upEAoL/9VzntmKoO2Ni1Y+ujCJXloBlo
=L8yU
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
