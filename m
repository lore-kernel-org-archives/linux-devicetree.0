From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] clk: bindings: Fix assigned-clock-rates property name
Date: Wed, 06 May 2015 15:28:36 +0900
Message-ID: <1430893716-1825-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

In documentation the "assigned-clock-parents" name was used when
describing the "assigned-clock-rates" property.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/clock/clock-bindings.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 06fc6d541c89..bf5b0414dc17 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -138,7 +138,7 @@ Some platforms may require initial configuration of default parent clocks
 and clock frequencies. Such a configuration can be specified in a device tree
 node through assigned-clocks, assigned-clock-parents and assigned-clock-rates
 properties. The assigned-clock-parents property should contain a list of parent
-clocks in form of phandle and clock specifier pairs, the assigned-clock-parents
+clocks in form of phandle and clock specifier pairs, the assigned-clock-rates
 property the list of assigned clock frequency values - corresponding to clocks
 listed in the assigned-clocks property.
 
-- 
1.9.1
