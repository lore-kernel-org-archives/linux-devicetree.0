From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: rtc: add generic bindings
Date: Sun, 11 Nov 2018 20:31:13 +0100
Message-ID: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add generic binding documentation for the RTC subsystem.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/rtc.txt | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
new file mode 100644
index 000000000000..221b7da50aca
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc.txt
@@ -0,0 +1,30 @@
+Generic device tree bindings for Real Time Clock devices
+========================================================
+
+This document describes generic bindings which can be used to describe Real Time
+Clock devices in a device tree.
+
+Required properties
+-------------------
+
+- compatible : name of RTC device following generic names recommended practice.
+
+For other required properties e.g. to describe register sets,
+clocks, etc. check the binding documentation of the specific driver.
+
+Optional properties
+-------------------
+
+- start-year : if provided, the default hardware range supported by the RTC is
+               shifted so the first usable year is the specified one.
+
+The following properties may not be supported by all drivers. However, if a
+driver wants to support one of the below features, it should adapt the bindings
+below.
+- trickle-resistor-ohms : Selected resistor for trickle charger. Should be given
+                          if trickle charger should be enabled
+- trickle-diode-disable : Do not use internal trickle charger diode Should be
+                          given if internal trickle charger diode should be
+                          disabled
+- wakeup-source :         Enables wake up of host system on alarm
+
-- 
2.19.1
