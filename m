From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 4/7] Documentation: dt: socfpga: Add Arria10 Ethernet binding
Date: Mon, 25 Apr 2016 12:52:45 -0500
Message-ID: <1461606768-14404-5-git-send-email-tthayer@opensource.altera.com>
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

Add the device tree bindings needed to support the Altera Ethernet
FIFO buffers on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  No Change
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index 5a6b160..aa1c593 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -76,6 +76,18 @@ Required Properties:
 - compatible : Should be "altr,socfpga-a10-ocram-ecc"
 - reg        : Address and size for ECC block registers.
 
+Ethernet FIFO ECC
+Required Properties:
+- compatible : Should be "altr,socfpga-a10-emac0-rx-ecc" for the 1st EMAC
+	Receive	buffer
+	or "altr,socfpga-a10-emac0-tx-ecc" for the 1st EMAC Transmit buffer
+	or "altr,socfpga-a10-emac1-rx-ecc" for the 2nd EMAC Receive buffer
+	or "altr,socfpga-a10-emac1-tx-ecc" for the 2nd EMAC Transmit buffer
+	or "altr,socfpga-a10-emac2-rx-ecc" for the 3rd EMAC Receive buffer
+	or "altr,socfpga-a10-emac2-tx-ecc" for the 3rd EMAC Transmit buffer
+- reg        : Address and size for ECC block registers.
+- parent     : phandle to parent Ethernet node.
+
 Example:
 
 	eccmgr: eccmgr@ffd06000 {
@@ -96,4 +108,16 @@ Example:
 			compatible = "altr,socfpga-a10-ocram-ecc";
 			reg = <0xff8c3000 0x90>;
 		};
+
+		emac0-rx-ecc@ff8c0800 {
+			compatible = "altr,socfpga-a10-emac0-rx-ecc";
+			reg = <0xff8c0800 0x400>;
+			parent = <&gmac0>;
+		};
+
+		emac0-tx-ecc@ff8c0c00 {
+			compatible = "altr,socfpga-a10-emac0-tx-ecc";
+			reg = <0xff8c0c00 0x400>;
+			parent = <&gmac0>;
+		};
 	};
-- 
1.7.9.5

