From: Nishanth Menon <nm@ti.com>
Subject: [PATCH] ARM: dts: keystone-k2g: Add Message Manager node
Date: Fri, 19 Aug 2016 15:47:48 -0500
Message-ID: <20160819204748.21529-1-nm@ti.com>
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
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Introduce the message manager node for the A15 queues on which Linux
runs. The Message Manager is primarily used for communication with
Power Management controller on K2G.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
based on: v4.8-rc1
Bootlog: http://pastebin.ubuntu.com/23071446/ (with CONFIG_MAILBOX,
   CONFIG_TI_MESSAGE_MANAGER enabled on top of keystone_defconfig)
Binding: Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
SoC Datasheet and relevant documentation: http://www.ti.com/product/66ak2g02
Communication Protocol: http://processors.wiki.ti.com/index.php/TISCI

 arch/arm/boot/dts/keystone-k2g.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 3372615b885c..25f5aaa05197 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -93,5 +93,17 @@
 			clock-frequency = <200000000>;
 			status = "disabled";
 		};
+
+		msgmgr: msgmgr@02a00000 {
+			compatible = "ti,k2g-message-manager";
+			#mbox-cells = <2>;
+			reg-names = "queue_proxy_region",
+				    "queue_state_debug_region";
+			reg = <0x02a00000 0x400000>, <0x028c3400 0x400>;
+			interrupt-names = "rx_005",
+					  "rx_057";
+			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.9.1.200.gb1ec08f
