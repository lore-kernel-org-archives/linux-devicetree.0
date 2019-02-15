From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 3/4] dt-bindings: display: Add bindings for OSD101T2587-53TS panel
Date: Fri, 15 Feb 2019 16:03:14 +0200
Message-ID: <20190215140315.18046-4-peter.ujfalusi@ti.com>
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

This adds the device-tree bindings for the OSD101T2587-53TS 10.1"
1920x1200 panel from One Stop Displays.

Note: the panel is similar to OSD101T2045-53TS, but it needs additional
MIPI_DSI_TURN_ON_PERIPHERAL message from the host.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../display/panel/osd,osd101t2587-53ts.txt         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/osd,osd101t2587-53ts.txt

diff --git a/Documentation/devicetree/bindings/display/panel/osd,osd101t2587-53ts.txt b/Documentation/devicetree/bindings/display/panel/osd,osd101t2587-53ts.txt
new file mode 100644
index 000000000000..2082cae1a0e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/osd,osd101t2587-53ts.txt
@@ -0,0 +1,14 @@
+One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
+
+The panel is similar to OSD101T2045-53TS, but it needs additional
+MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
+
+Required properties:
+- compatible: should be "osd,osd101t2587-53ts"
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
