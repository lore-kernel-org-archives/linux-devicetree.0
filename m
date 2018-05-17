From: Andrea Greco <andrea.greco.gapmilano@gmail.com>
Subject: [PATCH 2/4] arcnet: com20020: bindings for smsc com20020
Date: Thu, 17 May 2018 15:06:26 +0200
Message-ID: <20180517130628.2770-1-andrea.greco.gapmilano@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tobin@apporbit.com
Cc: andrea.greco.gapmilano@gmail.com, Andrea Greco <a.greco@4sigma.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Andrea Greco <a.greco@4sigma.it>

Add devicetree bindings for smsc com20020

Signed-off-by: Andrea Greco <a.greco@4sigma.it>
---
 .../devicetree/bindings/net/smsc-com20020.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/smsc-com20020.txt

diff --git a/Documentation/devicetree/bindings/net/smsc-com20020.txt b/Documentation/devicetree/bindings/net/smsc-com20020.txt
new file mode 100644
index 000000000000..92360b054873
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/smsc-com20020.txt
@@ -0,0 +1,21 @@
+SMSC com20020 Arcnet network controller
+
+Required propelty:
+- timeout-ns: Arcnet bus timeout, Idle Time (328000 - 20500)
+- bus-speed-bps: Arcnet bus speed (10000000 - 156250)
+- smsc,xtal-mhz: External oscillator frequency
+- smsc,backplane-enabled: Controller use backplane mode
+- reset-gpios: Chip reset pin
+- interrupts: Should contain controller interrupt
+
+arcnet@28000000 {
+    compatible = "smsc,com20020";
+
+	timeout-ns = <20500>;
+	bus-speed-bps = <10000000>;
+	smsc,xtal-mhz = <20>;
+	smsc,backplane-enabled;
+
+	reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
+	interrupts = <&gpio2 10 GPIO_ACTIVE_LOW>;
+};
-- 
2.14.3
