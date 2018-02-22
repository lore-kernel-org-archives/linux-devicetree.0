Return-Path: <SRS0=VmpS=FQ=ettus.com=moritz.fischer@kernel.org>
From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: power: reset: gpio-poweroff: Add 'timeout-ms' property
Date: Thu, 22 Feb 2018 15:17:13 -0800
Message-Id: <20180222231714.11843-1-mdf@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, sre@kernel.org, robh+dt@kernel.org, andy.shevchenko@gmail.com, Moritz Fischer <mdf@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add 'timeout-ms' property to support boards where the 3s timeout that the
current driver defaults to is too short.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Changes from v2:
- Addressed Rob's feedback (timeout_ms -> timeout-ms)

Changes from v1:
- Addressed Rob's feedback (timeout -> timeout_ms)
- Added to old example rather than creating separate one

---

 Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt b/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
index e62d53d844cc..6d8980c18c34 100644
--- a/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
+++ b/Documentation/devicetree/bindings/power/reset/gpio-poweroff.txt
@@ -27,10 +27,13 @@ Optional properties:
   it to an output when the power-off handler is called. If this optional
   property is not specified, the GPIO is initialized as an output in its
   inactive state.
+- timeout-ms: Time to wait before asserting a WARN_ON(1). If nothing is
+              specified, 3000 ms is used.
 
 Examples:
 
 gpio-poweroff {
 	compatible = "gpio-poweroff";
 	gpios = <&gpio 4 0>;
+	timeout-ms = <3000>;
 };
-- 
2.16.1
