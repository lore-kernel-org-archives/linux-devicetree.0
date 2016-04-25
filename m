From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 7/7] ARM: dts: Add Arria10 Ethernet EDAC devicetree entry
Date: Mon, 25 Apr 2016 12:52:48 -0500
Message-ID: <1461606768-14404-8-git-send-email-tthayer@opensource.altera.com>
References: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
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
---
 arch/arm/boot/dts/socfpga_arria10.dtsi |   36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 27cc497..6195ade 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -617,6 +617,42 @@
 				compatible = "altr,socfpga-a10-ocram-ecc";
 				reg = <0xff8c3000 0x400>;
 			};
+
+			emac0-rx-ecc@ff8c0800 {
+				compatible = "altr,socfpga-a10-emac0-rx-ecc";
+				reg = <0xff8c0800 0x400>;
+				parent = <&gmac0>;
+			};
+
+			emac0-tx-ecc@ff8c0c00 {
+				compatible = "altr,socfpga-a10-emac0-tx-ecc";
+				reg = <0xff8c0c00 0x400>;
+				parent = <&gmac0>;
+			};
+
+			emac1-rx-ecc@ff8c1000 {
+				compatible = "altr,socfpga-a10-emac1-rx-ecc";
+				reg = <0xff8c1000 0x400>;
+				parent = <&gmac1>;
+			};
+
+			emac1-tx-ecc@ff8c1400 {
+				compatible = "altr,socfpga-a10-emac1-tx-ecc";
+				reg = <0xff8c1400 0x400>;
+				parent = <&gmac1>;
+			};
+
+			emac2-rx-ecc@ff8c1800 {
+				compatible = "altr,socfpga-a10-emac2-rx-ecc";
+				reg = <0xff8c1800 0x400>;
+				parent = <&gmac2>;
+			};
+
+			emac2-tx-ecc@ff8c1c00 {
+				compatible = "altr,socfpga-a10-emac2-tx-ecc";
+				reg = <0xff8c1c00 0x400>;
+				parent = <&gmac2>;
+			};
 		};
 
 		rst: rstmgr@ffd05000 {
-- 
1.7.9.5

