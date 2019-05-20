From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/5] dt-bindings: soc: amlogic: canvas: document support for Meson8/8b/8m2
Date: Mon, 20 May 2019 21:43:49 +0200
Message-ID: <20190520194353.24445-2-martin.blumenstingl@googlemail.com>
References: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520194353.24445-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, mjourdan@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The canvas IP on Meson8, Meson8b and Meson8m2 is similar to the one
found on GXBB and newer. The only known difference is that the older
SoCs cannot configure the "endianness".

Add a compatible string for each of the older SoCs to make sure we won't
be using unsupported features on these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/soc/amlogic/amlogic,canvas.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
index 436d2106e80d..e876f3ce54f6 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.txt
@@ -2,8 +2,8 @@ Amlogic Canvas
 ================================
 
 A canvas is a collection of metadata that describes a pixel buffer.
-Those metadata include: width, height, phyaddr, wrapping, block mode
-and endianness.
+Those metadata include: width, height, phyaddr, wrapping and block mode.
+Starting with GXBB the endianness can also be described.
 
 Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
 rather than use the phy addresses directly. For instance, this is the case for
@@ -18,7 +18,11 @@ Video Lookup Table
 --------------------------
 
 Required properties:
-- compatible: "amlogic,canvas"
+- compatible: has to be one of:
+		- "amlogic,meson8-canvas", "amlogic,canvas" on Meson8
+		- "amlogic,meson8b-canvas", "amlogic,canvas" on Meson8b
+		- "amlogic,meson8m2-canvas", "amlogic,canvas" on Meson8m2
+		- "amlogic,canvas" on GXBB and newer
 - reg: Base physical address and size of the canvas registers.
 
 Example:
-- 
2.21.0
