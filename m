From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v1 1/6] dt-bindings: misc: add document for reboot-mode driver
Date: Tue, 22 Dec 2015 17:05:24 +0800
Message-ID: <1450775124-23966-1-git-send-email-andy.yan@rock-chips.com>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, heiko@sntech.de, arnd@arndb.de, john.stultz@linaro.org
Cc: sjg@chromium.org, alexandre.belloni@free-electrons.com, treding@nvidia.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, wxt@rock-chips.com, catalin.marinas@arm.com, olof@lixom.net, geert+renesas@glider.be, linux-rockchip@lists.infradead.org, dbaryshkov@gmail.com, sre@kernel.org, jun.nie@linaro.org, pawel.moll@arm.com, will.deacon@arm.com, akpm@linux-foundation.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk, gregkh@linuxfoundation.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, khilman@linaro.org, moritz.fischer@ettus.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

add device tree bindings document for reboot-mode driver

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v1: None

 .../devicetree/bindings/misc/reboot-mode.txt       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/reboot-mode.txt

diff --git a/Documentation/devicetree/bindings/misc/reboot-mode.txt b/Documentation/devicetree/bindings/misc/reboot-mode.txt
new file mode 100644
index 0000000..082bc0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/reboot-mode.txt
@@ -0,0 +1,41 @@
+Generic reboot mode communication driver
+
+This driver get reboot mode arguments from userspace
+and stores it in special register or ram . Then the
+bootloader will read it and take different action
+according the argument stored.
+
+Required properties:
+        - compatible = "reboot-mode" or other vendor compatible string;
+
+Each mode is represented as a sub-node of reboot_mode:
+
+Subnode required properties:
+        - linux,mode: reboot mode command,such as "loader","recovery", "fastboot".
+        - linux,magic: magic number for the mode, this is vendor specific.
+
+example:
+	reboot_mode {
+		compatible = "rockchip,reboot-mode";
+		rockchip,regmap = <&pmu>;
+		offset = <0x40>;
+		loader {
+			linux,mode = "loader";
+			linux,magic = <0x5242C301>;
+		};
+
+		maskrom {
+			linux,mode = "maskrom";
+			linux,magic = <0x5242C302>;
+		};
+
+		recovery {
+			linux,mode = "recovery";
+			linux,magic = <0x5242C303>;
+		};
+
+		fastboot {
+			linux,mode = "fastboot";
+			linux,magic = <0x5242C309>;
+		};
+        };
-- 
1.9.1
