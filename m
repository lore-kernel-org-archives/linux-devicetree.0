From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] ARM: zynq: dt: Add GPIO node
Date: Thu, 10 Jul 2014 11:53:38 -0700
Message-ID: <1405018418-23396-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add node describing Zynq's GPIO controller.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
The GPIO driver and binding documentation is staged in Linus' GPIO tree=
=2E

	S=C3=B6ren

 arch/arm/boot/dts/zynq-7000.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
index 760bbc463c5b..504cca338247 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -65,6 +65,16 @@
 		interrupt-parent =3D <&intc>;
 		ranges;
=20
+		gpio0: gpio@e000a000 {
+			compatible =3D "xlnx,zynq-gpio-1.0";
+			#gpio-cells =3D <2>;
+			clocks =3D <&clkc 42>;
+			gpio-controller;
+			interrupt-parent =3D <&intc>;
+			interrupts =3D <0 20 4>;
+			reg =3D <0xe000a000 0x1000>;
+		};
+
 		i2c0: i2c@e0004000 {
 			compatible =3D "cdns,i2c-r1p10";
 			status =3D "disabled";
--=20
2.0.1.1.gfbfc394
