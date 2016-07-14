From: <tthayer@opensource.altera.com>
Subject: [PATCH 02/10] Documentation: dt: socfpga: Add Arria10 DMA EDAC binding
Date: Thu, 14 Jul 2016 11:06:40 -0500
Message-ID: <1468512408-5156-3-git-send-email-tthayer@opensource.altera.com>
References: <1468512408-5156-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468512408-5156-1-git-send-email-tthayer@opensource.altera.com>
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

Add the device tree bindings needed to support the Altera DMA
FIFO buffer EDAC on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index 1bcbab2..ad8245b 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -98,6 +98,14 @@ Required Properties:
 - interrupts      : Should be single bit error interrupt, then double bit error
 	interrupt, in this order.
 
+DMA FIFO ECC
+Required Properties:
+- compatible      : Should be "altr,socfpga-dma-ecc"
+- reg             : Address and size for ECC block registers.
+- altr,ecc-parent : phandle to parent DMA node.
+- interrupts      : Should be single bit error interrupt, then double bit error
+	interrupt, in this order.
+
 Example:
 
 	eccmgr: eccmgr@ffd06000 {
@@ -164,4 +172,12 @@ Example:
 			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
 				     <44 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		dma-ecc@ff8c8000 {
+			compatible = "altr,socfpga-dma-ecc";
+			reg = <0xff8c8000 0x400>;
+			altr,ecc-parent = <&pdma>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>,
+				     <42 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
-- 
1.7.9.5
