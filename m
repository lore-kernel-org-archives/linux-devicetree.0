From: Maxime Jourdan <mjourdan@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: display: amlogic, meson-vpu: exclusively use amlogic,canvas
Date: Mon, 11 Mar 2019 11:51:43 +0100
Message-ID: <20190311105144.7276-2-mjourdan@baylibre.com>
References: <20190311105144.7276-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311105144.7276-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

When the DRM driver for the meson platform was created, the bindings
required that the DMC register region was provided.

Through those DMC registers, the display driver could configure an IP
called "canvas", a video lookup table used by the display IP.

It was later discovered that "canvas" is actually an IP shared by other
components than display: video decoder, 2D engine.. and that it wasn't
possible to keep the canvas code in DRM.

Over the past few months, incremental efforts have been deployed to
create a standalone meson-canvas driver [1], and the DRM driver was
patched to optionally use it if present [2].

This is the final step of those efforts where we simply remove any
control over DMC that the meson DRM driver has.

Please note that this breaks compatibility with older DTs that only
provide the DMC register range but not the amlogic,canvas node.

[1] https://patchwork.kernel.org/cover/10573771/
[2] https://patchwork.freedesktop.org/series/52076/

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.txt        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
index c65fd7a7467c..419444e2b4d3 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
@@ -60,15 +60,14 @@ Required properties:
 - reg: base address and size of he following memory-mapped regions :
 	- vpu
 	- hhi
-	- dmc
 - reg-names: should contain the names of the previous memory regions
 - interrupts: should contain the VENC Vsync interrupt number
+- amlogic,canvas: phandle to canvas provider node as described in the file
+	../soc/amlogic/amlogic,canvas.txt
 
 Optional properties:
 - power-domains: Optional phandle to associated power domain as described in
 	the file ../power/power_domain.txt
-- amlogic,canvas: phandle to canvas provider node as described in the file
-	../soc/amlogic/amlogic,canvas.txt
 
 Required nodes:
 
-- 
2.21.0
