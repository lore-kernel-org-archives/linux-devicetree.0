From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings: watchdog: meson-gxbb-wdt: Include generic watchdog bindings
Date: Fri, 20 Sep 2019 18:21:24 +0200
Message-ID: <20190920162124.7036-3-krzk@kernel.org>
References: <20190920162124.7036-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Include generic watchdog DT schema bindings in Amlogic GXBB Watchdog
bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index d7352f709b37..4ddae6feef3b 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -10,6 +10,9 @@ title: Meson GXBB SoCs Watchdog timer
 maintainers:
   - Neil Armstrong <narmstrong@baylibre.com>
 
+allOf:
+  - $ref: watchdog.yaml#
+
 properties:
   compatible:
     enum:
-- 
2.17.1
