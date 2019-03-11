Return-Path: <bunk@kernel.org>
From: Adrian Bunk <bunk@kernel.org>
Subject: [PATCH 1/2] dt-bindings: pps: pps-gpio.txt: Add capture-clear
Date: Mon, 11 Mar 2019 16:59:50 +0200
Message-Id: <20190311145951.847-1-bunk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The code was already there but the device tree wiring was missing.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Cc: stable@vger.kernel.org
---
 Documentation/devicetree/bindings/pps/pps-gpio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
index 3683874832ae..bb69b8dc7a82 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -10,6 +10,7 @@ Required properties:
 Optional properties:
 - assert-falling-edge: when present, assert is indicated by a falling edge
                        (instead of by a rising edge)
+- capture-clear: when present, also capture the clear edge
 
 Example:
 	pps {
-- 
2.20.1
