From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/4] dt-bindings: display: Add bindings for OSD101T2045-53TS
Date: Fri, 15 Feb 2019 16:03:12 +0200
Message-ID: <20190215140315.18046-2-peter.ujfalusi@ti.com>
References: <20190215140315.18046-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215140315.18046-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com
List-Id: devicetree@vger.kernel.org

This adds the device-tree bindings for the OSD101T2045-53TS 10.1"
1920x1200 panel from One Stop Displays.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../bindings/display/panel/osd,osd101t2045-53ts.txt   | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/osd,osd101t2045-53ts.txt

diff --git a/Documentation/devicetree/bindings/display/panel/osd,osd101t2045-53ts.txt b/Documentation/devicetree/bindings/display/panel/osd,osd101t2045-53ts.txt
new file mode 100644
index 000000000000..b3f6df59f7c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/osd,osd101t2045-53ts.txt
@@ -0,0 +1,11 @@
+One Stop Displays OSD101T2045-53TS 10.1" 1920x1200 panel
+
+Required properties:
+- compatible: should be "osd,osd101t2045-53ts"
+- power-supply: as specified in the base binding
+
+Optional properties:
+- backlight: as specified in the base binding
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
