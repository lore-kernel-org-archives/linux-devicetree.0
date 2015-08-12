From: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: ls1021a: add crypto node
Date: Wed, 12 Aug 2015 10:42:41 +0300
Message-ID: <1439365361-24129-1-git-send-email-horia.geanta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Horia Geant=C4=83 <horia.geanta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/ls1021a.dtsi | 40 ++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a=
=2Edtsi
index 973a496207fc..5bd64a4df4d3 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -63,6 +63,7 @@
 		serial4 =3D &lpuart4;
 		serial5 =3D &lpuart5;
 		sysclk =3D &sysclk;
+		crypto =3D &crypto;
 	};
=20
 	cpus {
@@ -148,6 +149,45 @@
 			big-endian;
 		};
=20
+		crypto: crypto@1700000 {
+			compatible =3D "fsl,sec-v5.0", "fsl,sec-v4.0";
+			fsl,sec-era =3D <7>;
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			reg		 =3D <0x0 0x1700000 0x0 0x100000>;
+			ranges		 =3D <0x0 0x0 0x1700000 0x100000>;
+			interrupts	 =3D <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+
+			sec_jr0: jr@10000 {
+				compatible =3D "fsl,sec-v5.0-job-ring",
+				     "fsl,sec-v4.0-job-ring";
+				reg =3D <0x10000 0x10000>;
+				interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			sec_jr1: jr@20000 {
+				compatible =3D "fsl,sec-v5.0-job-ring",
+				     "fsl,sec-v4.0-job-ring";
+				reg =3D <0x20000 0x10000>;
+				interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			sec_jr2: jr@30000 {
+				compatible =3D "fsl,sec-v5.0-job-ring",
+				     "fsl,sec-v4.0-job-ring";
+				reg =3D <0x30000 0x10000>;
+				interrupts =3D <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			sec_jr3: jr@40000 {
+				compatible =3D "fsl,sec-v5.0-job-ring",
+				     "fsl,sec-v4.0-job-ring";
+				reg =3D <0x40000 0x10000>;
+				interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+		};
+
 		clockgen: clocking@1ee1000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
--=20
2.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
