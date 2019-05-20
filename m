From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 2/2] dt-bindings: power: supply: Add documentation for the VINDPM properties
Date: Mon, 20 May 2019 11:07:12 -0700
Message-ID: <20190520180712.32405-3-angus@akkea.ca>
References: <20190520180712.32405-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520180712.32405-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Angus Ainslie (Purism)" <angus@akkea.ca>
List-Id: devicetree@vger.kernel.org

Add documentation on how to control VINDPM from the devicetree.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 .../devicetree/bindings/power/supply/bq25890.txt          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq25890.txt b/Documentation/devicetree/bindings/power/supply/bq25890.txt
index dc0568933359..fe8b709dd666 100644
--- a/Documentation/devicetree/bindings/power/supply/bq25890.txt
+++ b/Documentation/devicetree/bindings/power/supply/bq25890.txt
@@ -26,9 +26,15 @@ Optional properties:
 - ti,use-ilim-pin: boolean, if present the ILIM resistor will be used and the
     input current will be the lower between the resistor setting and the IINLIM
     register setting;
+- ti,use-vinmin-threshold: boolean, if present the FORCE_VINDPM bit will be set
+    and the input voltage limit will be configured based on "ti,vinmin-threshold"
 - ti,thermal-regulation-threshold: integer, temperature above which the charge
     current is lowered, to avoid overheating (in degrees Celsius). If omitted,
     the default setting will be used (120 degrees);
+- ti,vinmin-threshold: integer, lower absolute threshold for VINDPM. If the
+    voltage falls below this threshold the charge current is reduced until the
+    input voltage rises above the input voltage limit. If omitted, the default
+    setting will be used (4.4V);
 
 Example:
 
@@ -46,4 +52,6 @@ bq25890 {
 
         ti,use-ilim-pin;
         ti,thermal-regulation-threshold = <120>;
+        ti,use-vinmin-threshold;
+        ti,vinmin-threshold = <3900000>;
 };
-- 
2.17.1
