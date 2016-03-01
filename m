From: <tthayer@opensource.altera.com>
Subject: [PATCH 5/5] ARM: dts: Add Altera Arria10 L2 Cache EDAC devicetree entry
Date: Tue, 1 Mar 2016 10:38:21 -0600
Message-ID: <1456850301-22066-5-git-send-email-tthayer@opensource.altera.com>
References: <1456850301-22066-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456850301-22066-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the device tree entries needed to support the Altera L2
cache EDAC on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index cce9e50..e83e973 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -599,6 +599,20 @@
 			reg = <0xffe00000 0x40000>;
 		};
 
+		eccmgr: eccmgr@ffd06090 {
+			compatible = "altr,socfpga-ecc-manager";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			l2-ecc@ffd06000 {
+				compatible = "altr,socfpga-a10-l2-ecc";
+				reg = <0xffd06010 0x4>;
+				interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>,
+					     <0 0 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rst: rstmgr@ffd05000 {
 			#reset-cells = <1>;
 			compatible = "altr,rst-mgr";
-- 
1.7.9.5
