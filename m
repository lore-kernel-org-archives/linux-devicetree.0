From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 1/2] dt-bindings: rtc: Add on-chip ASPEED RTC documentation
Date: Tue, 26 Mar 2019 00:01:58 +1030
Message-ID: <20190325133159.10653-2-joel@jms.id.au>
References: <20190325133159.10653-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325133159.10653-1-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Describe the RTC as used in the ASPEED BMC SoCs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/rtc/rtc-aspeed.txt    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-aspeed.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt b/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
new file mode 100644
index 000000000000..f9f7defd557e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
@@ -0,0 +1,19 @@
+ASPEED BMC RTC
+==============
+
+Required properties:
+ - compatible: should be one of the following
+   * aspeed,ast2400-rtc for the ast2400
+   * aspeed,ast2500-rtc for the ast2500
+   * aspeed,ast2600-rtc for the ast2600
+
+ - reg: physical base address of the controller and length of memory mapped
+   region
+
+Example:
+
+   rtc@1e781000 {
+           compatible = "aspeed,ast2400-rtc";
+           reg = <0x1e781000 0x18>;
+           status = "disabled";
+   };
-- 
2.20.1
