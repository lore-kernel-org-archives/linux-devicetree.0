From: <tthayer@opensource.altera.com>
Subject: [PATCH 1/3] Documentation: dt: socfpga: Add Arria10 SD-MMC EDAC
 binding
Date: Tue, 2 Aug 2016 10:56:19 -0500
Message-ID: <1470153381-20517-2-git-send-email-tthayer@opensource.altera.com>
References: <1470153381-20517-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470153381-20517-1-git-send-email-tthayer@opensource.altera.com>
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

Add the device tree bindings needed to support the Altera SD-MMC
FIFO buffers EDAC on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index ee66df0..4a1714f 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -122,6 +122,15 @@ Required Properties:
 - interrupts      : Should be single bit error interrupt, then double bit error
 	interrupt, in this order.
 
+SDMMC FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-sdmmc-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent SD/MMC node.
+- interrupts      : Should be single bit error interrupt, then double bit error
+	interrupt, in this order for port A, and then single bit error interrupt,
+	then double bit error interrupt in this order for port B.
+
 Example:
 
 	eccmgr: eccmgr@ffd06000 {
@@ -211,4 +220,14 @@ Example:
 			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
 				     <46 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		sdmmc-ecc@ff8c2c00 {
+			compatible = "altr,socfpga-sdmmc-ecc";
+			reg = <0xff8c2c00 0x400>;
+			altr,ecc-parent = <&mmc>;
+			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
+				     <47 IRQ_TYPE_LEVEL_HIGH>,
+				     <16 IRQ_TYPE_LEVEL_HIGH>,
+				     <48 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
-- 
1.7.9.5
