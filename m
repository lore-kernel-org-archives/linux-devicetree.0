From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/2] dt-bindings: drm/panel: simple: add lg,acx467akm-7 panel
Date: Sat, 24 Nov 2018 15:06:27 -0500
Message-ID: <20181124200628.24393-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonathan@marek.ca
List-Id: devicetree@vger.kernel.org

Add binding for the LG ACX467AKM-7 4.95" 1080×1920 LCD panel that is
found on the LG Nexus 5 (hammerhead) phone. This appears to be a JDI
panel based on some Internet searches, however a specific model number
could not be found. I disassembled an old Nexus 5 with a broken
screen and the LG part number is the only model number present on the
back of the panel, so I think that is probably the best ID to use.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../devicetree/bindings/display/panel/lg,acx467akm-7.txt   | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt

diff --git a/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt b/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
new file mode 100644
index 000000000000..fc1e1b325e49
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
@@ -0,0 +1,7 @@
+LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
+
+Required properties:
+- compatible: must be "lg,acx467akm-7"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.17.2
