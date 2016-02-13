From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: [PATCH 1/2] dt-bindings: Add URT UMSH-8596MD-xT panel bindings
Date: Sat, 13 Feb 2016 22:50:24 +0100
Message-ID: <56BFA520.3090302@maciej.szmigiero.name>
References: <5615885C.5050505@maciej.szmigiero.name> <20151008082444.GC3820@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151008082444.GC3820@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings for United Radiant Technology
UMSH-8596MD-xT 7.0" WVGA TFT LCD panels.

Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
This replaces "of: add URT UMSH-8596MD-xT panel DT bindings"
submission.

 .../bindings/display/panel/urt,umsh-8596md.txt           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt

diff --git a/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
new file mode 100644
index 000000000000..088a6cea5015
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/urt,umsh-8596md.txt
@@ -0,0 +1,16 @@
+United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
+
+Supported are LVDS versions (-11T, -19T) and parallel ones
+(-T, -1T, -7T, -20T).
+
+Required properties:
+- compatible: should be one of:
+  "urt,umsh-8596md-t",
+  "urt,umsh-8596md-1t",
+  "urt,umsh-8596md-7t",
+  "urt,umsh-8596md-11t",
+  "urt,umsh-8596md-19t",
+  "urt,umsh-8596md-20t".
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
