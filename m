From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 1/4] ARM: dts: clps711x: Remove skeleton.dtsi
Date: Fri, 21 Dec 2018 13:30:16 +0300
Message-ID: <20181221103019.15374-1-shc_work@mail.ru>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

As explained by commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark
skeleton.dtsi as deprecated"), including skeleton.dtsi is deprecated.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/boot/dts/ep7209.dtsi        | 11 +++++++++--
 arch/arm/boot/dts/ep7211-edb7211.dts |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ep7209.dtsi b/arch/arm/boot/dts/ep7209.dtsi
index aaf1261d2ee4..bcaf54221145 100644
--- a/arch/arm/boot/dts/ep7209.dtsi
+++ b/arch/arm/boot/dts/ep7209.dtsi
@@ -6,14 +6,17 @@
 
 /dts-v1/;
 
-#include "skeleton.dtsi"
-
 #include <dt-bindings/clock/clps711x-clock.h>
 
 / {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
 	model = "Cirrus Logic EP7209";
 	compatible = "cirrus,ep7209";
 
+	chosen {};
+
 	aliases {
 		gpio0 = &porta;
 		gpio1 = &portb;
@@ -26,6 +29,10 @@
 		timer1 = &timer2;
 	};
 
+	memory {
+		device_type = "memory";
+	};
+
 	cpus {
 		#address-cells = <0>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/ep7211-edb7211.dts b/arch/arm/boot/dts/ep7211-edb7211.dts
index bc9d5b697452..3475c7777cbc 100644
--- a/arch/arm/boot/dts/ep7211-edb7211.dts
+++ b/arch/arm/boot/dts/ep7211-edb7211.dts
@@ -12,6 +12,7 @@
 	compatible = "cirrus,edb7211", "cirrus,ep7211", "cirrus,ep7209";
 
 	memory {
+		device_type = "memory";
 		reg = <0xc0000000 0x02000000>;
 	};
 
-- 
2.13.0
