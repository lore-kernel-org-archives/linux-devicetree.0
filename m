From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v1 2/6] dt-bindings: soc: add document for rockchip reboot-mode driver
Date: Tue, 22 Dec 2015 17:08:14 +0800
Message-ID: <1450775294-24028-1-git-send-email-andy.yan@rock-chips.com>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, heiko@sntech.de, arnd@arndb.de, john.stultz@linaro.org
Cc: sjg@chromium.org, alexandre.belloni@free-electrons.com, treding@nvidia.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, wxt@rock-chips.com, catalin.marinas@arm.com, olof@lixom.net, geert+renesas@glider.be, linux-rockchip@lists.infradead.org, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, pawel.moll@arm.com, will.deacon@arm.com, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, khilman@linaro.org, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add device tree binding document for rockchip reboot-mode driver

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v1: None

 .../bindings/soc/rockchip/rockchip,reboot-mode.txt | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,reboot-mode.txt

diff --git a/Documentation/devicetree/bindings/soc/rockchip/rockchip,reboot-mode.txt b/Documentation/devicetree/bindings/soc/rockchip/rockchip,reboot-mode.txt
new file mode 100644
index 0000000..cdb5093
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/rockchip,reboot-mode.txt
@@ -0,0 +1,39 @@
+Rockchip reboot mode driver
+
+This driver get reboot mode arguments from userspace
+and stores it in special register. Then the bootloader
+will read it and take different action according the
+argument stored.
+
+Required properties:
+- compatible: should be "rockchip,reboot-mode"
+- regmap: this is phandle to the register map node
+- offset: offset in the register map for the storage register (in bytes)
+The rest of the properties should follow the generic reboot-mode discription
+found in ../../misc/reboot-mode.txt
+
+Examples:
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmu>;
+		offset = <0x40>;
+		loader {
+			linux,mode = "loader";
+			linux,magic = <BOOT_LOADER>;
+		};
+
+		maskrom {
+			linux,mode = "maskrom";
+			linux,magic = <BOOT_MASKROM>;
+		};
+
+		recovery {
+			linux,mode = "recovery";
+			linux,magic = <BOOT_RECOVERY>;
+		};
+
+		fastboot {
+			linux,mode = "fastboot";
+			linux,magic = <BOOT_FASTBOOT>;
+		};
+	};
-- 
1.9.1
