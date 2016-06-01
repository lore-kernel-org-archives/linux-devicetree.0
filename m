From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2] ARM: BCM5301X: Specify PHY of USB 2.0 in DT
Date: Wed,  1 Jun 2016 22:07:07 +0200
Message-ID: <1464811627-12218-1-git-send-email-zajec5@gmail.com>
References: <1464808585-14996-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464808585-14996-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Driver for Northstar USB 2.0 PHY was added in 4.7-rc1 by:
commit d3feb4067335 ("phy: bcm-ns-usb2: new driver for USB 2.0 PHY on
Northstar").
It should be used to let EHCI platform driver init PHY.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
V2: Add usb2_phy as child of root node instead of adding separated phys
    "simple-bus".
---
 arch/arm/boot/dts/bcm5301x.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm530=
1x.dtsi
index 7d4d29b..142811d 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -140,6 +140,15 @@
 		};
 	};
=20
+	usb2_phy: usb2-phy {
+		compatible =3D "brcm,ns-usb2-phy";
+		reg =3D <0x1800c000 0x1000>;
+		reg-names =3D "dmu";
+		#phy-cells =3D <0>;
+		clocks =3D <&genpll BCM_NSP_GENPLL_USB_PHY_REF_CLK>;
+		clock-names =3D "phy-ref-clk";
+	};
+
 	axi@18000000 {
 		compatible =3D "brcm,bus-axi";
 		reg =3D <0x18000000 0x1000>;
@@ -217,6 +226,8 @@
=20
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
+
+			phys =3D <&usb2_phy>;
 		};
=20
 		usb3: usb3@23000 {
--=20
1.8.4.5
