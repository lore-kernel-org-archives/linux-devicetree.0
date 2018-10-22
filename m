From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/6] dt-bindings: drm/panel: simple: Add no-hpd property
Date: Mon, 22 Oct 2018 13:46:34 -0700
Message-ID: <20181022204639.8558-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Sandeep Panda <spanda@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jsanka@codeaurora.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Some eDP panels that are designed to be always connected to a board
use their HPD signal to signal that they've finished powering on and
they're ready to be talked to.

However, for various reasons it's possible that the HPD signal from
the panel isn't actually hooked up.  In the case where the HPD isn't
hooked up you can look at the timing diagram on the panel datasheet
and insert a delay for the maximum amount of time that the HPD might
take to come up.

Let's add a property in the device tree for this concept.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/simple-panel.txt         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
index 45a457ad38f0..b2b872c710f2 100644
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
@@ -11,6 +11,9 @@ Optional properties:
 - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
 - enable-gpios: GPIO pin to enable or disable the panel
 - backlight: phandle of the backlight device attached to the panel
+- no-hpd: This panel is supposed to communicate that it's ready via HPD
+  (hot plug detect) signal, but the signal isn't hooked up so we should
+  hardcode the max delay from the panel spec when powering up the panel.
 
 Example:
 
-- 
2.19.1.568.g152ad8e336-goog
