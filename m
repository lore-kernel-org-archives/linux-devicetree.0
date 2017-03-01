From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH] ARM: dts: NSP: GPIO reboot open-source
Date: Wed,  1 Mar 2017 18:02:28 -0500
Message-ID: <1488409348-6371-1-git-send-email-jon.mason@broadcom.com>
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
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The libgpio code pre-sets the GPIO values for the gpio-reset in the
device tree.  This results in the device being reset during bringup.
To prevent this pre-setting, use the "open-source" flag in the device
tree.

Signed-off-by: Jon Mason <jon.mason@broadcom.com>
Fixes: b1aaf88 ("ARM: dts: NSP: Add GPIO reboot method to bcm958625hr DTS file")
Fixes: 10baed1 ("ARM: dts: NSP: Add GPIO reboot method to bcm958625xmc DTS file")
Fixes: 088e3148 ("ARM: dts: NSP: Add new DT file for bcm958522er")
Fixes: e3227c1 ("ARM: dts: NSP: Add new DT file for bcm958525er")
Fixes: 2f8bc00 ("ARM: dts: NSP: Add new DT file for bcm958622hr")
Fixes: d454c37 ("ARM: dts: NSP: Add new DT file for bcm958623hr")
Fixes: f27eacf ("ARM: dts: NSP: Add new DT file for bcm988312hr")
---
 arch/arm/boot/dts/bcm958522er.dts  | 1 +
 arch/arm/boot/dts/bcm958525er.dts  | 1 +
 arch/arm/boot/dts/bcm958525xmc.dts | 1 +
 arch/arm/boot/dts/bcm958622hr.dts  | 1 +
 arch/arm/boot/dts/bcm958623hr.dts  | 1 +
 arch/arm/boot/dts/bcm958625hr.dts  | 1 +
 arch/arm/boot/dts/bcm988312hr.dts  | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm958522er.dts b/arch/arm/boot/dts/bcm958522er.dts
index 3f04a40..df05e7f 100644
--- a/arch/arm/boot/dts/bcm958522er.dts
+++ b/arch/arm/boot/dts/bcm958522er.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm958525er.dts b/arch/arm/boot/dts/bcm958525er.dts
index 9fd5422..4a3ab19 100644
--- a/arch/arm/boot/dts/bcm958525er.dts
+++ b/arch/arm/boot/dts/bcm958525er.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index 41e7fd3..81f7843 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 31 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm958622hr.dts b/arch/arm/boot/dts/bcm958622hr.dts
index 477c486..c88b8fe 100644
--- a/arch/arm/boot/dts/bcm958622hr.dts
+++ b/arch/arm/boot/dts/bcm958622hr.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm958623hr.dts b/arch/arm/boot/dts/bcm958623hr.dts
index c0a499d..d503fa0 100644
--- a/arch/arm/boot/dts/bcm958623hr.dts
+++ b/arch/arm/boot/dts/bcm958623hr.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
index f7eb585..cc0363b 100644
--- a/arch/arm/boot/dts/bcm958625hr.dts
+++ b/arch/arm/boot/dts/bcm958625hr.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm988312hr.dts b/arch/arm/boot/dts/bcm988312hr.dts
index 16666324..74e15a3 100644
--- a/arch/arm/boot/dts/bcm988312hr.dts
+++ b/arch/arm/boot/dts/bcm988312hr.dts
@@ -55,6 +55,7 @@
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		open-source;
 		priority = <200>;
 	};
 };
-- 
2.7.4
