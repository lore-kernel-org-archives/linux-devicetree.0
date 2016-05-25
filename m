From: <tthayer@opensource.altera.com>
Subject: [PATCH 4/5] ARM: dts: Arria10 ECC Manager IRQ controller changes
Date: Wed, 25 May 2016 11:29:42 -0500
Message-ID: <1464193783-5071-5-git-send-email-tthayer@opensource.altera.com>
References: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464193783-5071-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Changes to support IRQ controller implementation including adding
new property irq-controller to eccmgr and adding IRQ property
to children.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 27cc497..0901090 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -606,16 +606,22 @@
 			#size-cells = <1>;
 			interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>,
 				     <0 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			ranges;
 
 			l2-ecc@ffd06010 {
 				compatible = "altr,socfpga-a10-l2-ecc";
 				reg = <0xffd06010 0x4>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+					     <32 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
 			ocram-ecc@ff8c3000 {
 				compatible = "altr,socfpga-a10-ocram-ecc";
 				reg = <0xff8c3000 0x400>;
+				interrupts = <1 IRQ_TYPE_LEVEL_HIGH>,
+					     <33 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
-- 
1.7.9.5
