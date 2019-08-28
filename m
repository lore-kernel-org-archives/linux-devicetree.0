From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 3/6] ARM: dts: mmp2: rename the USB PHY node
Date: Wed, 28 Aug 2019 09:26:26 +0200
Message-ID: <20190828072629.285760-4-lkundrak@v3.sk>
References: <20190828072629.285760-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828072629.285760-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

This device is not an OTG phy, it's a regular USB HS phy. Follow the
generic node name recommendation, and rename it to "usb-phy".

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/mmp2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index e64639ce57a91..21432cb9143f7 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -117,7 +117,7 @@
 				mrvl,intc-nr-irqs =3D <2>;
 			};
=20
-			usb_otg_phy0: usb-otg-phy@d4207000 {
+			usb_phy0: usb-phy@d4207000 {
 				compatible =3D "marvell,mmp2-usb-phy";
 				reg =3D <0xd4207000 0x40>;
 				#phy-cells =3D <0>;
@@ -130,7 +130,7 @@
 				interrupts =3D <44>;
 				clocks =3D <&soc_clocks MMP2_CLK_USB>;
 				clock-names =3D "USBCLK";
-				phys =3D <&usb_otg_phy0>;
+				phys =3D <&usb_phy0>;
 				phy-names =3D "usb";
 				status =3D "disabled";
 			};
--=20
2.21.0
