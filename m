From: Michael Heimpold <michael.heimpold@i2se.com>
Subject: [PATCH v4 5/9] dt-bindings: arm: add entries for I2SE boards
Date: Thu,  9 Feb 2017 08:42:45 +0100
Message-ID: <1486626169-20022-6-git-send-email-michael.heimpold@i2se.com>
References: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486626169-20022-1-git-send-email-michael.heimpold@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fabio.estevam@nxp.com, frowand.list@gmail.com, Michael Heimpold <mhei@heimpold.de>
List-Id: devicetree@vger.kernel.org

From: Michael Heimpold <mhei@heimpold.de>

This patch adds the missing devicetree binding documentation for I2SE's
Duckbill and Duckbill 2 series boards.

Signed-off-by: Michael Heimpold <mhei@heimpold.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/arm/i2se.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/i2se.txt

diff --git a/Documentation/devicetree/bindings/arm/i2se.txt b/Documentation/devicetree/bindings/arm/i2se.txt
new file mode 100644
index 0000000..dbd54a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/i2se.txt
@@ -0,0 +1,22 @@
+I2SE Device Tree Bindings
+-------------------------
+
+Duckbill Board
+Required root node properties:
+    - compatible = "i2se,duckbill", "fsl,imx28";
+
+Duckbill 2 Board
+Required root node properties:
+    - compatible = "i2se,duckbill-2", "fsl,imx28";
+
+Duckbill 2 485 Board
+Required root node properties:
+    - compatible = "i2se,duckbill-2-485", "i2se,duckbill-2", "fsl,imx28";
+
+Duckbill 2 EnOcean Board
+Required root node properties:
+    - compatible = "i2se,duckbill-2-enocean", "i2se,duckbill-2", "fsl,imx28";
+
+Duckbill 2 SPI Board
+Required root node properties:
+    - compatible = "i2se,duckbill-2-spi", "i2se,duckbill-2", "fsl,imx28";
-- 
2.6.1
