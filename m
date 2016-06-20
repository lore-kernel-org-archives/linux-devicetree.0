From: <tthayer@opensource.altera.com>
Subject: [PATCHv4 7/7] ARM: dts: Add Arria10 Ethernet EDAC devicetree entry
Date: Mon, 20 Jun 2016 09:50:52 -0500
Message-ID: <1466434252-26107-8-git-send-email-tthayer@opensource.altera.com>
References: <1466434252-26107-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1466434252-26107-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the device tree entries needed to support the Altera Ethernet
FIFO buffer EDAC on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  No change
v3  Add interrupts for SBERR and DBERR.
v4  No change
---
 arch/arm/boot/dts/socfpga_arria10.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 21f6c3c..5cf4dc5 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -628,6 +628,22 @@
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH>,
 					     <33 IRQ_TYPE_LEVEL_HIGH>;
 			};
+
+			emac0-rx-ecc@ff8c0800 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0xff8c0800 0x400>;
+				parent = <&gmac0>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>,
+					     <36 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac0-tx-ecc@ff8c0c00 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0xff8c0c00 0x400>;
+				parent = <&gmac0>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>,
+					     <37 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		rst: rstmgr@ffd05000 {
-- 
1.7.9.5

