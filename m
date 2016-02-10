From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH 5/8] arm: dts: add Artpec-6 development board dts
Date: Wed, 10 Feb 2016 13:41:54 +0100
Message-ID: <a1015afcbd0a726915c674ad58425be951a4158f.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lars Persson <larper@axis.com>
---
 arch/arm/boot/dts/Makefile             |  2 ++
 arch/arm/boot/dts/artpec6-devboard.dts | 57 ++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm/boot/dts/artpec6-devboard.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a4a6d70..2ebe99c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -2,6 +2,8 @@ ifeq ($(CONFIG_OF),y)
 
 dtb-$(CONFIG_ARCH_ALPINE) += \
 	alpine-db.dtb
+dtb-$(CONFIG_MACH_ARTPEC6) += \
+	artpec6-devboard.dtb
 dtb-$(CONFIG_MACH_ASM9260) += \
 	alphascale-asm9260-devkit.dtb
 # Keep at91 dtb files sorted alphabetically for each SoC
diff --git a/arch/arm/boot/dts/artpec6-devboard.dts b/arch/arm/boot/dts/artpec6-devboard.dts
new file mode 100644
index 0000000..f6c5e4f
--- /dev/null
+++ b/arch/arm/boot/dts/artpec6-devboard.dts
@@ -0,0 +1,57 @@
+/*
+ * Axis ARTPEC-6 development board.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "artpec6.dtsi"
+
+/ {
+	model = "ARTPEC-6 development board";
+	compatible = "axis,artpec6-dev-board", "axis,artpec6";
+
+	chosen {
+		stdout-path = "serial3:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&ethernet {
+	status = "okay";
+
+	phy-handle = <&phy1>;
+	phy-mode = "gmii";
+
+	mdio {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		phy1: phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			device_type = "ethernet-phy";
+			reg = <0x0>;
+		};
+	};
+};
-- 
2.1.4
