From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/8] drm/sun4i: Add compatible strings for the A80 display
 pipeline
Date: Thu, 15 Mar 2018 19:41:32 +0800
Message-ID: <20180315114136.24747-5-wens@csie.org>
References: <20180315114136.24747-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180315114136.24747-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds compatible strings for the remaining documented
components of the Allwinner A80 display pipeline.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 671d75c76ad0..3346c1e2a7a0 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -191,7 +191,7 @@ DRC
 ---
 
 The DRC (Dynamic Range Controller), found in the latest Allwinner SoCs
-(A31, A23, A33), allows to dynamically adjust pixel
+(A31, A23, A33, A80), allows to dynamically adjust pixel
 brightness/contrast based on histogram measurements for LCD content
 adaptive backlight control.
 
@@ -201,6 +201,7 @@ Required properties:
     * allwinner,sun6i-a31-drc
     * allwinner,sun6i-a31s-drc
     * allwinner,sun8i-a33-drc
+    * allwinner,sun9i-a80-drc
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the DRC
@@ -227,6 +228,7 @@ Required properties:
     * allwinner,sun6i-a31-display-backend
     * allwinner,sun7i-a20-display-backend
     * allwinner,sun8i-a33-display-backend
+    * allwinner,sun9i-a80-display-backend
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the frontend and backend
@@ -283,6 +285,7 @@ Required properties:
     * allwinner,sun6i-a31-display-frontend
     * allwinner,sun7i-a20-display-frontend
     * allwinner,sun8i-a33-display-frontend
+    * allwinner,sun9i-a80-display-frontend
   - reg: base address and size of the memory-mapped region.
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the frontend and backend
@@ -339,6 +342,7 @@ Required properties:
     * allwinner,sun8i-a83t-display-engine
     * allwinner,sun8i-h3-display-engine
     * allwinner,sun8i-v3s-display-engine
+    * allwinner,sun9i-a80-display-engine
 
   - allwinner,pipelines: list of phandle to the display engine
     frontends (DE 1.0) or mixers (DE 2.0) available.
-- 
2.16.2
