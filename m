From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/4] dt-bindings: arm: Add Sierra Wireless modules bindings
Date: Fri, 17 Jun 2016 12:42:10 +0200
Message-ID: <1466160132-24574-3-git-send-email-narmstrong@baylibre.com>
References: <1466160132-24574-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466160132-24574-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, mark.rutland@arm.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/swi.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/swi.txt

diff --git a/Documentation/devicetree/bindings/arm/swi.txt b/Documentation/devicetree/bindings/arm/swi.txt
new file mode 100644
index 0000000..7f36960
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/swi.txt
@@ -0,0 +1,12 @@
+Sierra Wireless Modules device tree bindings
+--------------------------------------------
+
+Supported Modules :
+ - WP8548 : Includes MDM9615 and PM8018 in a module
+
+Sierra Wireless modules shall have the following properties :
+  Required root node property
+   - compatible: "swi,wp8548" for the WP8548 CF3 Module
+
+Board compatible values:
+  - "swi,mangoh-green-wp8548" for the mangOH green board with the WP8548 module
-- 
1.9.1
