From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2 4/5] ARM: berlin: Add AHCI and SATA PHY nodes to BG2
Date: Tue, 21 Oct 2014 11:07:56 +0200
Message-ID: <1413882477-27922-5-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT nodes for the AHCI controller and SATA PHY found on Marvell
Berlin2 SoCs.

Acked-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Changelog:
v1->v2:
- remove status =3D "disabled" from SATA controller node (Suggested by
  Antoine)

Cc: Kishon Vijay Abraham I <kishon@ti.com>=20
Cc: "Antoine T=C3=A9nart" <antoine.tenart@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org=20
---
 arch/arm/boot/dts/berlin2.dtsi | 39 ++++++++++++++++++++++++++++++++++=
+++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2=
=2Edtsi
index 9d7c810ebd0b..f39090491eb2 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -246,6 +246,45 @@
 			};
 		};
=20
+		ahci: sata@e90000 {
+			compatible =3D "marvell,berlin2-ahci", "generic-ahci";
+			reg =3D <0xe90000 0x1000>;
+			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&chip CLKID_SATA>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			sata0: sata-port@0 {
+				reg =3D <0>;
+				phys =3D <&sata_phy 0>;
+				status =3D "disabled";
+			};
+
+			sata1: sata-port@1 {
+				reg =3D <1>;
+				phys =3D <&sata_phy 1>;
+				status =3D "disabled";
+			};
+		};
+
+		sata_phy: phy@e900a0 {
+			compatible =3D "marvell,berlin2-sata-phy";
+			reg =3D <0xe900a0 0x200>;
+			clocks =3D <&chip CLKID_SATA>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			#phy-cells =3D <1>;
+			status =3D "disabled";
+
+			sata-phy@0 {
+				reg =3D <0>;
+			};
+
+			sata-phy@1 {
+				reg =3D <1>;
+			};
+		};
+
 		chip: chip-control@ea0000 {
 			compatible =3D "marvell,berlin2-chip-ctrl";
 			#clock-cells =3D <1>;
--=20
2.1.1
