From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH] ARM: dts: pxa3xx: add gcu node
Date: Mon,  5 Nov 2018 20:18:27 +0100
Message-ID: <20181105191827.3860-1-daniel@zonque.org>
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
To: robert.jarzmik@free.fr, haojian.zhuang@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a device node for hardware graphic acceleration.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 3a8f0edc3af9..264f681bebd9 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -300,4 +300,12 @@
 		clocks = <&clks CLK_OSTIMER>;
 		status = "okay";
 	};
+
+	gcu: display-controller@54000000 {
+		compatible = "marvell,pxa300-gcu";
+		reg = <0x54000000 0x1000>;
+		interrupts = <39>;
+		clocks = <&clks CLK_PXA300_GCU>;
+		status = "disabled";
+	};
 };
-- 
2.17.2
