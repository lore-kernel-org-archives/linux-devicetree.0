From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/4] Documentation: devicetree: arm: Add Realtek RTD1295 bindings
Date: Tue, 14 Feb 2017 04:34:37 +0100
Message-ID: <20170214033440.18667-3-afaerber@suse.de>
References: <20170214033440.18667-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170214033440.18667-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, service@zidoo.tv, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/arm/realtek.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/realtek.txt

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
new file mode 100644
index 0000000..cfbee58
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -0,0 +1,15 @@
+Realtek platforms device tree bindings
+--------------------------------------
+
+
+RTD1295 SoC
+===========
+
+Required root node properties:
+
+ - compatible :  "realtek,rtd1295"
+
+
+Board compatible strings:
+
+ - Zidoo X9S: "zidoo,x9s"
-- 
2.10.2
