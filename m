From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/3] dt-bindings: net: Add bindings for Realtek PHYs
Date: Mon,  1 Jul 2019 12:52:23 -0700
Message-ID: <20190701195225.120808-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add the 'realtek,enable-ssc' property to enable Spread Spectrum
Clocking (SSC) on Realtek PHYs that support it.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 .../devicetree/bindings/net/realtek.txt       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek.txt

diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
new file mode 100644
index 000000000000..9fad97e7404f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek.txt
@@ -0,0 +1,21 @@
+Realtek PHY properties.
+
+This document describes properties of Realtek PHYs.
+
+Optional properties:
+- realtek,enable-ssc	Enable Spread Spectrum Clocking (SSC) on this port.
+			SSC is only available on some Realtek PHYs (e.g.
+			RTL8211E).
+
+Example:
+
+mdio0 {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy: ethernet-phy@1 {
+		reg = <1>;
+		realtek,enable-ssc;
+	};
+};
-- 
2.22.0.410.gd8fdbe21b5-goog
