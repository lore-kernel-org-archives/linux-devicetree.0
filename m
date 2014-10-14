From: Romain Perier <romain.perier@gmail.com>
Subject: [RFC PATCH v3 4/5] dt-bindings: Document the standard property "poweroff-source"
Date: Tue, 14 Oct 2014 06:31:12 +0000
Message-ID: <1413268273-15151-4-git-send-email-romain.perier@gmail.com>
References: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413268273-15151-1-git-send-email-romain.perier@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, heiko@sntech.de, grant.likely@linaro.org, robh@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 Documentation/devicetree/bindings/power/poweroff.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/poweroff.txt

diff --git a/Documentation/devicetree/bindings/power/poweroff.txt b/Documentation/devicetree/bindings/power/poweroff.txt
new file mode 100644
index 0000000..845868b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/poweroff.txt
@@ -0,0 +1,18 @@
+* Generic Poweroff capability
+
+Power-management integrated circuits or miscellaneous harware components are
+sometimes able to control the system power. The device driver associated to these
+components might needs to define poweroff capability, which tells to the kernel
+how to switch off the system. The corresponding driver must have the standard
+property "poweroff-source" in its device node. This property marks the device as
+able to shutdown the system. In order to test if this property is found
+programmatically, use the helper function "of_system_has_poweroff_source" from
+of.h .
+
+Example:
+
+act8846: act8846@5 {
+	 compatible = "active-semi,act8846";
+	 status = "okay";
+	 poweroff-source;
+}
-- 
1.9.1
