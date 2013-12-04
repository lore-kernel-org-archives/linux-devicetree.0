From: Feng Kan <fkan@apm.com>
Subject: [PATCH 1/4] Documentation: add dts binding for X-Gene reboot dts node.
Date: Wed,  4 Dec 2013 10:33:20 -0800
Message-ID: <1386182000-26607-1-git-send-email-fkan@apm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: patches@apm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Add dts documentation for X-Gene reboot driver.

Signed-off-by: Feng Kan <fkan@apm.com>
---
 .../devicetree/bindings/arm64/xgene/reboot.txt     |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm64/xgene/reboot.txt

diff --git a/Documentation/devicetree/bindings/arm64/xgene/reboot.txt b/Documentation/devicetree/bindings/arm64/xgene/reboot.txt
new file mode 100644
index 0000000..70aabf7
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm64/xgene/reboot.txt
@@ -0,0 +1,11 @@
+Reboot property to control system reboot on storm platforms:
+
+The register attribute contain the address of the reset 
+register.
+
+Example:
+
+	reboot@17000014 {
+		compatible = "apm,xgene-reboot";
+		reg = <0x0 0x17000014 0x0 0x4>;
+	};
-- 
1.7.6.1
