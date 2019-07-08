From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 3/7] dt-bindings: net: realtek: Add property to enable SSC
Date: Mon,  8 Jul 2019 12:24:55 -0700
Message-ID: <20190708192459.187984-4-mka@chromium.org>
References: <20190708192459.187984-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190708192459.187984-1-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add the 'realtek,enable-ssc' property to enable Spread Spectrum
Clocking (SSC) on Realtek PHYs that support it.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v3:
- changed wording for supported PHY models

Changes in v2:
- patch added to the series (kind of, it already existed, but now
  the binding is created by another patch)
---
 Documentation/devicetree/bindings/net/realtek.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek.txt b/Documentation/devicetree/bindings/net/realtek.txt
index db0333f23fec..af2824664f08 100644
--- a/Documentation/devicetree/bindings/net/realtek.txt
+++ b/Documentation/devicetree/bindings/net/realtek.txt
@@ -15,6 +15,10 @@ Optional properties:
 
   Only supported for "realtek,rtl8211e".
 
+- realtek,enable-ssc : Enable Spread Spectrum Clocking (SSC) on this port.
+
+  Only supported for "realtek,rtl8211e".
+
 
 Example:
 
@@ -27,5 +31,6 @@ mdio0 {
 		compatible = "realtek,rtl8211e";
 		reg = <1>;
 		realtek,eee-led-mode-disable;
+		realtek,enable-ssc;
 	};
 };
-- 
2.22.0.410.gd8fdbe21b5-goog
