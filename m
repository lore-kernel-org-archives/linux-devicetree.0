From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH 1/6] arm: mvebu: Add support for USB host controllers in
 Armada 370/XP
Date: Tue, 15 Jan 2013 06:54:25 -0300
Message-ID: <1358243670-11935-1-git-send-email-ezequiel.garcia@free-electrons.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Florian Fainelli <florian@openwrt.org>
List-Id: devicetree@vger.kernel.org

The Armada 370 and Armada XP SoC has an Orion EHCI USB controller.
This patch adds support for this controller in Armada 370
and Armada XP SoC common device tree files.

Cc: Lior Amsalem <alior@marvell.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-xp.dtsi |   15 +++++++++++++++
 arch/arm/boot/dts/armada-370.dtsi    |    9 +++++++++
 arch/arm/boot/dts/armada-xp.dtsi     |   17 +++++++++++++++++
 arch/arm/mach-mvebu/Kconfig          |    1 +
 4 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 28276fe..fa025c4 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -145,6 +145,21 @@
 			clocks = <&gateclk 17>;
 			status = "disabled";
 		};
+
+		usb@d0050000 {
+			compatible = "marvell,orion-ehci";
+			reg = <0xd0050000 0x500>;
+			interrupts = <45>;
+			status = "disabled";
+		};
+
+		usb@d0051000 {
+			compatible = "marvell,orion-ehci";
+			reg = <0xd0051000 0x500>;
+			interrupts = <46>;
+			status = "disabled";
+		};
+
 	};
 };
 
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index 88f9bab..8188d13 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -144,5 +144,14 @@
 				dmacap,memset;
 			};
 		};
+
+		usb@d0050000 {
+			clocks = <&coreclk 0>;
+		};
+
+		usb@d0051000 {
+			clocks = <&coreclk 0>;
+		};
+
 	};
 };
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 390ba98..1443949 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -134,5 +134,22 @@
 				dmacap,memset;
 			};
 		};
+
+		usb@d0050000 {
+			clocks = <&gateclk 18>;
+		};
+
+		usb@d0051000 {
+			clocks = <&gateclk 19>;
+		};
+
+		usb@d0052000 {
+			compatible = "marvell,orion-ehci";
+			reg = <0xd0052000 0x500>;
+			interrupts = <47>;
+			clocks = <&gateclk 20>;
+			status = "disabled";
+		};
+
 	};
 };
diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
index 440b13e..5e4fcde 100644
--- a/arch/arm/mach-mvebu/Kconfig
+++ b/arch/arm/mach-mvebu/Kconfig
@@ -24,6 +24,7 @@ config MACH_ARMADA_370_XP
 	select HAVE_SMP
 	select CACHE_L2X0
 	select CPU_PJ4B
+	select USB_ARCH_HAS_EHCI if USB_SUPPORT
 
 config MACH_ARMADA_370
 	bool "Marvell Armada 370 boards"
-- 
1.7.8.6
