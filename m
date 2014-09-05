From: Jingchang Lu <jingchang.lu@freescale.com>
Subject: [PATCH] doc: dt-binding: of-serial: add Freescale 64-byte FIFO mode
 uart binding
Date: Fri, 5 Sep 2014 10:35:14 +0800
Message-ID: <1409884514-24705-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jingchang Lu <jingchang.lu@freescale.com>
List-Id: devicetree@vger.kernel.org

This add the 64-byte FIFO mode device tree binding for Freescale DUART.

Signed-off-by: Jingchang Lu <jingchang.lu@freescale.com>
---
 Documentation/devicetree/bindings/serial/of-serial.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/of-serial.txt b/Documentation/devicetree/bindings/serial/of-serial.txt
index 7705477..7b132eb 100644
--- a/Documentation/devicetree/bindings/serial/of-serial.txt
+++ b/Documentation/devicetree/bindings/serial/of-serial.txt
@@ -14,6 +14,7 @@ Required properties:
 	- "altr,16550-FIFO32"
 	- "altr,16550-FIFO64"
 	- "altr,16550-FIFO128"
+	- "fsl,16550-FIFO64"
 	- "serial" if the port type is unknown.
 - reg : offset and length of the register set for the device.
 - interrupts : should contain uart interrupt.
-- 
1.8.0
