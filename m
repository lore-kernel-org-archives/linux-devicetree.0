From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 3/7] dt-bindings: net: realtek: Add property to enable SSC
Date: Wed,  3 Jul 2019 12:37:20 -0700
Message-ID: <20190703193724.246854-3-mka@chromium.org>
References: <20190703193724.246854-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703193724.246854-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add the 'realtek,enable-ssc' property to enable Spread Spectrum
Clocking (SSC) on Realtek PHYs that support it.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- patch added to the series (kind of, it already existed, but now
  the binding is created by another patch)
---
 Documentation/devicetree/bindings/net/realtek.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
index 63f7002fa704..71d386c78269 100644
--- a/Documentation/devicetree/bindings/net/realtek.txt
+++ b/Documentation/devicetree/bindings/net/realtek.txt
@@ -5,6 +5,10 @@ This document describes properties of Realtek PHYs.
 Optional properties:
 - realtek,eee-led-mode-disable: Disable EEE LED mode on this port.
 
+- realtek,enable-ssc : Enable Spread Spectrum Clocking (SSC) on this port.
+
+	SSC is only available on some Realtek PHYs (e.g. RTL8211E).
+
 Example:
 
 mdio0 {
@@ -15,5 +19,6 @@ mdio0 {
 	ethphy: ethernet-phy@1 {
 		reg = <1>;
 		realtek,eee-led-mode-disable;
+		realtek,enable-ssc;
 	};
 };
-- 
2.22.0.410.gd8fdbe21b5-goog
