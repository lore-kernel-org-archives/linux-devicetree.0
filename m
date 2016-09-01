From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 01/26] dt-bindings: display: display-timing: Add property to configure sync drive edge
Date: Thu, 1 Sep 2016 14:22:55 +0300
Message-ID: <20160901112320.15246-2-peter.ujfalusi@ti.com>
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, tomi.valkeinen@ti.com
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There are display panels which demands that the sync signal is driven on
different edge than the pixel data.
With the syncclk-active property we can specify the clk edge to be used to
drive the sync signal. When the property is missing it indicates that the
sync is driven on the same edge as the pixel data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/display/panel/display-timing.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
index e1d4a0b59612..1436292e7a56 100644
--- a/Documentation/devicetree/bindings/display/panel/display-timing.txt
+++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt
@@ -32,6 +32,12 @@ optional properties:
 			- active low  = drive pixel data on falling edge/
 					sample data on rising edge
 			- ignored     = ignored
+ - syncclk-active: with
+			- active high = drive sync on rising edge/
+					sample sync on falling edge
+			- active low  = drive sync on falling edge/
+					sample sync on rising edge
+			- omitted     = same configuration as pixelclk-active
  - interlaced (bool): boolean to enable interlaced mode
  - doublescan (bool): boolean to enable doublescan mode
  - doubleclk (bool): boolean to enable doubleclock mode
-- 
2.9.3
