From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 4/5] dt-bindings: arm: realtek: Document RTD1296 and Synology DS418
Date: Mon, 16 Oct 2017 06:01:49 +0200
Message-ID: <20171016040150.23400-5-afaerber@suse.de>
References: <20171016040150.23400-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016040150.23400-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Bizon <bizongod@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, info@synology.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define compatible strings for Realtek RTD1296 SoC and Synology
DiskStation DS418 NAS.

Cc: info@synology.com
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/arm/realtek.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
index 500e771614c4..d977aa0a0f46 100644
--- a/Documentation/devicetree/bindings/arm/realtek.txt
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -36,3 +36,20 @@ Root node property compatible must contain, depending on board:
 Example:
 
     compatible = "zidoo,x9s", "realtek,rtd1295";
+
+
+RTD1296 SoC
+===========
+
+Required root node properties:
+
+ - compatible :  must contain "realtek,rtd1296"
+
+
+Root node property compatible must contain, depending on board:
+
+ - Synology DiskStation DS418: "synology,ds418"
+
+Example:
+
+    compatible = "synology,ds418", "realtek,rtd1296";
-- 
2.13.6
