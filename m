From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] Documentation: devicetree: tilcdc: fix spelling mistake "suppors" -> "supports"
Date: Wed,  6 Jun 2018 17:39:42 +0200
Message-ID: <20180606153942.18839-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: kernel@collabora.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Mark Rutland <mark.rutland@arm.com>, Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

Trivial fix to spelling mistake in tilcdc.txt devicetree documentation.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
index 6fddb4f4f71a..3055d5c2c04e 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
@@ -36,7 +36,7 @@ Optional nodes:
 
  - port/ports: to describe a connection to an external encoder. The
    binding follows Documentation/devicetree/bindings/graph.txt and
-   suppors a single port with a single endpoint.
+   supports a single port with a single endpoint.
 
  - See also Documentation/devicetree/bindings/display/tilcdc/panel.txt and
    Documentation/devicetree/bindings/display/tilcdc/tfp410.txt for connecting
-- 
2.17.1
