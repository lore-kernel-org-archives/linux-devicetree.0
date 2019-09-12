From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
Date: Wed, 11 Sep 2019 19:40:36 -0700
Message-ID: <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1568255903.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "To : Lucas Stach" <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org, dri-devel@
List-Id: devicetree@vger.kernel.org

Add #cooling-cells for when the gpu acts as a cooling device.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 .../devicetree/bindings/display/etnaviv/etnaviv-drm.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
index 8def11b16a24..640592e8ab2e 100644
--- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
@@ -21,6 +21,7 @@ Required properties:
 Optional properties:
 - power-domains: a power domain consumer specifier according to
   Documentation/devicetree/bindings/power/power_domain.txt
+- #cooling-cells: : If used as a cooling device, must be <2>
 
 example:
 
-- 
2.23.0.rc1
