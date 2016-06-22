From: <tthayer@opensource.altera.com>
Subject: [PATCHv5 5/8] Documentation: dt: socfpga: Add Arria10 Ethernet binding
Date: Wed, 22 Jun 2016 08:58:56 -0500
Message-ID: <1466603939-7526-6-git-send-email-tthayer@opensource.altera.com>
References: <1466603939-7526-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466603939-7526-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the device tree bindings needed to support the Altera Ethernet
FIFO buffers on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  No Change
v3  Change to common compatible string based on maintainer comments
    Add local IRQ values.
v4  Add compatible string for parent node.
v5  Change parent phandle name to altr,ecc-parent
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index 15eb0df..b545856 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -82,6 +82,14 @@ Required Properties:
 - interrupts : Should be single bit error interrupt, then double bit error
 	interrupt, in this order.
 
+Ethernet FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-eth-mac-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent Ethernet node.
+- interrupts      : Should be single bit error interrupt, then double bit error
+	interrupt, in this order.
+
 Example:
 
 	eccmgr: eccmgr@ffd06000 {
@@ -108,4 +116,20 @@ Example:
 			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>,
 				     <33 IRQ_TYPE_LEVEL_HIGH> ;
 		};
+
+		emac0-rx-ecc@ff8c0800 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0xff8c0800 0x400>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>,
+				     <36 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		emac0-tx-ecc@ff8c0c00 {
+			compatible = "altr,socfpga-eth-mac-ecc";
+			reg = <0xff8c0c00 0x400>;
+			altr,ecc-parent = <&gmac0>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>,
+				     <37 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
-- 
1.7.9.5
