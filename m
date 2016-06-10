From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 1/2] dt-bindings: add Starry KR122EA0SRA panel binding
Date: Fri, 10 Jun 2016 10:02:06 -0700
Message-ID: <1465578127-30330-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: airlied@linux.ie, robh+dt@kernel.org, Douglas Anderson <dianders@chromium.org>, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Starry KR122EA0SRA is a 12.2", 1920x1200 TFT-LCD panel connected
using eDP interfaces.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Changes in v2:
- Proper title (sorry!)

 .../devicetree/bindings/display/panel/starry,kr122ea0sra.txt       | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt

diff --git a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
new file mode 100644
index 000000000000..1e87fe6078af
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
@@ -0,0 +1,7 @@
+Starry 12.2" (1920x1200 pixels) TFT LCD panel
+
+Required properties:
+- compatible: should be "starry,kr122ea0sra"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.8.0.rc3.226.g39d4020
