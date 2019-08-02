From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 5/6] ARM: dts: mmp2: specify reg-shift for the UARTs
Date: Fri,  2 Aug 2019 12:33:25 +0200
Message-ID: <20190802103326.531250-6-lkundrak@v3.sk>
References: <20190802103326.531250-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802103326.531250-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

This makes the 8250_of driver happy. There are two more drivers in the
tree that bind to mrvl,mmp-uart compatibles: pxa and 8250_pxa and
neither of them requires the reg-shift property, assuming it's always 2.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Updated the subject to fit the style of the DTS updates
---
 arch/arm/boot/dts/mmp2.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 68b5470773232..6a2f072c1d0a8 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -214,6 +214,7 @@
 				interrupts =3D <27>;
 				clocks =3D <&soc_clocks MMP2_CLK_UART0>;
 				resets =3D <&soc_clocks MMP2_CLK_UART0>;
+				reg-shift =3D <2>;
 				status =3D "disabled";
 			};
=20
@@ -223,6 +224,7 @@
 				interrupts =3D <28>;
 				clocks =3D <&soc_clocks MMP2_CLK_UART1>;
 				resets =3D <&soc_clocks MMP2_CLK_UART1>;
+				reg-shift =3D <2>;
 				status =3D "disabled";
 			};
=20
@@ -232,6 +234,7 @@
 				interrupts =3D <24>;
 				clocks =3D <&soc_clocks MMP2_CLK_UART2>;
 				resets =3D <&soc_clocks MMP2_CLK_UART2>;
+				reg-shift =3D <2>;
 				status =3D "disabled";
 			};
=20
@@ -241,6 +244,7 @@
 				interrupts =3D <46>;
 				clocks =3D <&soc_clocks MMP2_CLK_UART3>;
 				resets =3D <&soc_clocks MMP2_CLK_UART3>;
+				reg-shift =3D <2>;
 				status =3D "disabled";
 			};
=20
--=20
2.21.0
