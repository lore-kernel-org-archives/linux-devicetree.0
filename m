From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 3/4] ARM: dts: bcm283x: Correct vchiq compatible string
Date: Mon, 17 Sep 2018 09:22:23 +0100
Message-ID: <1537172544-104852-4-git-send-email-phil@raspberrypi.org>
References: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1537172544-104852-1-git-send-email-phil@raspberrypi.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

To allow VCHIQ to determine the correct cache line size, use the new
"brcm,bcm2836-vchiq" compatible string on BCM2836 and BCM2837.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi         | 2 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 2 +-
 arch/arm/boot/dts/bcm2836-rpi.dtsi         | 6 ++++++
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 2 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi     | 2 +-
 6 files changed, 11 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2836-rpi.dtsi

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index cb2d6d7..215d8cc 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -30,7 +30,7 @@
 			#power-domain-cells = <1>;
 		};
 
-		mailbox@7e00b840 {
+		vchiq: mailbox@7e00b840 {
 			compatible = "brcm,bcm2835-vchiq";
 			reg = <0x7e00b840 0xf>;
 			interrupts = <0 2>;
diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
index 2fef70a..ac4408b 100644
--- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 #include "bcm2836.dtsi"
-#include "bcm2835-rpi.dtsi"
+#include "bcm2836-rpi.dtsi"
 #include "bcm283x-rpi-smsc9514.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
diff --git a/arch/arm/boot/dts/bcm2836-rpi.dtsi b/arch/arm/boot/dts/bcm2836-rpi.dtsi
new file mode 100644
index 0000000..c4c858b
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2836-rpi.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "bcm2835-rpi.dtsi"
+
+&vchiq {
+	compatible = "brcm,bcm2836-vchiq", "brcm,bcm2835-vchiq";
+};
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
index 4adb85e..eca36e3 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 #include "bcm2837.dtsi"
-#include "bcm2835-rpi.dtsi"
+#include "bcm2836-rpi.dtsi"
 #include "bcm283x-rpi-lan7515.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index c318bcb..a0ba0f6 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 #include "bcm2837.dtsi"
-#include "bcm2835-rpi.dtsi"
+#include "bcm2836-rpi.dtsi"
 #include "bcm283x-rpi-smsc9514.dtsi"
 #include "bcm283x-rpi-usb-host.dtsi"
 
diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
index 7b7ab6a..4a89a18 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 #include "bcm2837.dtsi"
-#include "bcm2835-rpi.dtsi"
+#include "bcm2836-rpi.dtsi"
 
 / {
 	memory {
-- 
2.7.4
