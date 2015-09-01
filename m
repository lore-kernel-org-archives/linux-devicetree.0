From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/4] devicetree: Add bindings for the ATH79 USB phy
Date: Tue,  1 Sep 2015 17:23:11 +0200
Message-ID: <1441120994-31476-2-git-send-email-albeu@free.fr>
References: <1441120994-31476-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441120994-31476-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 .../devicetree/bindings/phy/phy-ath79-usb.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
new file mode 100644
index 0000000..cafe219
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
@@ -0,0 +1,18 @@
+* Atheros AR71XX/9XXX USB PHY
+
+Required properties:
+- compatible: "qca,ar7100-usb-phy"
+- #phys-cells: should be 0
+- reset-names: "usb-phy"[, "usb-suspend-override"]
+- resets: references to the reset controllers
+
+Example:
+
+	usb-phy {
+		compatible = "qca,ar7100-usb-phy";
+
+		reset-names = "usb-phy", "usb-suspend-override";
+		resets = <&rst 4>, <&rst 3>;
+
+		#phy-cells = <0>;
+	};
-- 
2.0.0
