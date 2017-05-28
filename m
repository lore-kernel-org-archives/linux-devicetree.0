From: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 6/7] [media] soc_camera: rcar_vin: use proper name for the R-Car SoC
Date: Sun, 28 May 2017 11:30:49 +0200
Message-ID: <20170528093051.11816-7-wsa+renesas@sang-engineering.com>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170528093051.11816-1-wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

It is 'R-Car', not 'RCar'. No code or binding changes, only descriptive text.

Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
I suggest this trivial patch should be picked individually per susbsystem.

 Documentation/devicetree/bindings/media/rcar_vin.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
index 25fc933318483d..4af8760b353339 100644
--- a/Documentation/devicetree/bindings/media/rcar_vin.txt
+++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
@@ -1,5 +1,5 @@
-Renesas RCar Video Input driver (rcar_vin)
-------------------------------------------
+Renesas R-Car Video Input driver (rcar_vin)
+-------------------------------------------
 
 The rcar_vin device provides video input capabilities for the Renesas R-Car
 family of devices.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
