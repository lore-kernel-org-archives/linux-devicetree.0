From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: property-units: Sanitize unit naming
Date: Tue, 14 May 2019 10:50:24 +0200
Message-ID: <20190514085024.17587-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Make the naming of units consistent with common practices:
  - Do not capitalize the first character of units ("Celsius" is
    special, as it is not the unit name, but a reference to its
    proposer),
  - Do not use plural for units,
  - Do not abbreviate "ampere",
  - Concatenate prefixes and units (no spaces or hyphens),
  - Separate units by spaces not hyphens,
  - "milli" applies to "degree", not to "Celsius".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/property-units.txt    | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/property-units.txt b/Documentation/devicetree/bindings/property-units.txt
index bfd33734facaba73..e9b8360b32880f12 100644
--- a/Documentation/devicetree/bindings/property-units.txt
+++ b/Documentation/devicetree/bindings/property-units.txt
@@ -12,32 +12,32 @@ unit prefixes.
 Time/Frequency
 ----------------------------------------
 -mhz		: megahertz
--hz		: Hertz (preferred)
--sec		: seconds
--ms		: milliseconds
--us		: microseconds
--ns		: nanoseconds
+-hz		: hertz (preferred)
+-sec		: second
+-ms		: millisecond
+-us		: microsecond
+-ns		: nanosecond
 
 Distance
 ----------------------------------------
--mm		: millimeters
+-mm		: millimeter
 
 Electricity
 ----------------------------------------
--microamp	: micro amps
--microamp-hours : micro amp-hours
--ohms		: Ohms
--micro-ohms	: micro Ohms
--microwatt-hours: micro Watt-hours
--microvolt	: micro volts
--picofarads	: picofarads
--femtofarads	: femtofarads
+-microamp	: microampere
+-microamp-hours : microampere hour
+-ohms		: ohm
+-micro-ohms	: microohm
+-microwatt-hours: microwatt hour
+-microvolt	: microvolt
+-picofarads	: picofarad
+-femtofarads	: femtofarad
 
 Temperature
 ----------------------------------------
--celsius	: Degrees Celsius
--millicelsius	: Degreee milli-Celsius
+-celsius	: degree Celsius
+-millicelsius	: millidegree Celsius
 
 Pressure
 ----------------------------------------
--kpascal	: kiloPascal
+-kpascal	: kilopascal
-- 
2.17.1
