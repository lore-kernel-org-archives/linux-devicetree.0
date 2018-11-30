From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 5/7] ARM: dts: pxa3xx: order timer and gcu nodes under /pxabus
Date: Fri, 30 Nov 2018 18:55:41 +0100
Message-ID: <20181130175543.32628-6-daniel@zonque.org>
References: <20181130175543.32628-1-daniel@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181130175543.32628-1-daniel@zonque.org>
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

These are devices on the PXA bus, so make the device tree structure
reflect that.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index eb9443208578..de49e7f666c0 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -265,6 +265,22 @@
 			clocks = <&clks CLK_SSP4>;
 			status = "disabled";
 		};
+
+		timer@40a00000 {
+			compatible = "marvell,pxa-timer";
+			reg = <0x40a00000 0x20>;
+			interrupts = <26>;
+			clocks = <&clks CLK_OSTIMER>;
+			status = "okay";
+		};
+
+		gcu: display-controller@54000000 {
+			compatible = "marvell,pxa300-gcu";
+			reg = <0x54000000 0x1000>;
+			interrupts = <39>;
+			clocks = <&clks CLK_PXA300_GCU>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
@@ -282,20 +298,4 @@
 			status = "okay";
 		};
 	};
-
-	timer@40a00000 {
-		compatible = "marvell,pxa-timer";
-		reg = <0x40a00000 0x20>;
-		interrupts = <26>;
-		clocks = <&clks CLK_OSTIMER>;
-		status = "okay";
-	};
-
-	gcu: display-controller@54000000 {
-		compatible = "marvell,pxa300-gcu";
-		reg = <0x54000000 0x1000>;
-		interrupts = <39>;
-		clocks = <&clks CLK_PXA300_GCU>;
-		status = "disabled";
-	};
 };
-- 
2.19.2
