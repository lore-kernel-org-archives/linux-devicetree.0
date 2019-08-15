From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 01/11] dt-bindings: drm/bridge: analogix-anx78xx: add new variants
Date: Wed, 14 Aug 2019 20:48:44 -0400
Message-ID: <20190815004854.19860-2-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com, sean@poorly.run
Cc: airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, linus.walleij@linaro.org, enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Add support for the analogix,anx7808, analogix,anx7812, and
analogix,anx7818 variants.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../devicetree/bindings/display/bridge/anx7814.txt          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
index dbd7c84ee584..17258747fff6 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx7814.txt
+++ b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
@@ -6,7 +6,11 @@ designed for portable devices.
 
 Required properties:
 
- - compatible		: "analogix,anx7814"
+ - compatible		: Must be one of:
+			  "analogix,anx7808"
+			  "analogix,anx7812"
+			  "analogix,anx7814"
+			  "analogix,anx7818"
  - reg			: I2C address of the device
  - interrupts		: Should contain the INTP interrupt
  - hpd-gpios		: Which GPIO to use for hpd
-- 
2.21.0
