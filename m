From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V3 3/4] dt-bindings: serial: add a new compatible string for
 SC9860
Date: Thu, 2 Mar 2017 14:22:09 +0800
Message-ID: <1488435730-6711-4-git-send-email-chunyan.zhang@spreadtrum.com>
References: <1488435730-6711-1-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488435730-6711-1-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org, sudeep.holla@arm.com, chunyan.zhang@spreadtrum.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SC9860 use the same serial device, so added a new compatible string to
support SC9860 as well, also added an example of how to describe this
serial device in DT.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
 Documentation/devicetree/bindings/serial/sprd-uart.txt | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/sprd-uart.txt b/Documentation/devicetree/bindings/serial/sprd-uart.txt
index 2aff0f2..8bd8144 100644
--- a/Documentation/devicetree/bindings/serial/sprd-uart.txt
+++ b/Documentation/devicetree/bindings/serial/sprd-uart.txt
@@ -1,7 +1,20 @@
 * Spreadtrum serial UART
 
 Required properties:
-- compatible: must be "sprd,sc9836-uart"
+- compatible must contain:
+  * "sprd,sc9836-uart" for SC9836 and all Spreadtrum SoCs
+  This also can be specific with:
+  * "sprd,sc9860-uart" for SC9860
+
 - reg: offset and length of the register set for the device
 - interrupts: exactly one interrupt specifier
 - clocks: phandles to input clocks.
+
+Example:
+	uart0: serial@70000000 {
+		compatible = "sprd,sc9860-uart",
+			     "sprd,sc9836-uart";
+		reg = <0x000000 0x100>;
+		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&ext_26m>;
+	};
-- 
2.7.4
