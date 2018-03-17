From: Peter Rosin <peda@axentia.se>
Subject: [RFC PATCH 1/3] dt-bindings: display: bridge: lvds-transmitter: add ti,ds90c185
Date: Sat, 17 Mar 2018 23:15:23 +0100
Message-ID: <20180317221525.18534-2-peda@axentia.se>
References: <20180317221525.18534-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180317221525.18534-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Start list of actual chips compatible with "lvds-encoder".

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 .../devicetree/bindings/display/bridge/lvds-transmitter.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
index fd39ad34c383..9d09190d9210 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -24,6 +24,11 @@ Required properties:
 
 - compatible: Must be "lvds-encoder"
 
+	      Known actual chips (these should still use "lvds-encoder" as a
+	      fallback compatible) include:
+
+	      "ti,ds90c185"
+
 Required nodes:
 
 This device has two video ports. Their connections are modeled using the OF
-- 
2.11.0
