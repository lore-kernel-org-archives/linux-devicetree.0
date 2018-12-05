From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 05/15] dt-bindings: sram: sunxi: Add bindings for the H5
 with SRAM C1
Date: Wed,  5 Dec 2018 10:24:34 +0100
Message-ID: <20181205092444.29497-6-paul.kocialkowski@bootlin.com>
References: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Cc: Mark Rutland <mark.rutland@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi@googlegroups.com, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-Id: devicetree@vger.kernel.org

This introduces new bindings for the H5 SoC in the SRAM controller.
Because the SRAM layout is different from other SoCs, no backward
compatibility is assumed with any of them.

However, the C1 SRAM section alone looks similar to previous SoCs,
so it is compatible with the initial A10 binding.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sram/sunxi-sram.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
index 5c84850dd0df..5c9a54ad3b53 100644
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -18,6 +18,7 @@ Required properties:
     - "allwinner,sun8i-h3-system-control"
     - "allwinner,sun50i-a64-sram-controller" (deprecated)
     - "allwinner,sun50i-a64-system-control"
+    - "allwinner,sun50i-h5-system-control"
     - "allwinner,sun50i-h6-system-control", "allwinner,sun50i-a64-system-control"
     - "allwinner,suniv-f1c100s-system-control", "allwinner,sun4i-a10-system-control"
 - reg : sram controller register offset + length
@@ -56,6 +57,9 @@ The valid sections compatible for H3 are:
 The valid sections compatible for A64 are:
     - allwinner,sun50i-a64-sram-c
 
+The valid sections compatible for H5 are:
+    - allwinner,sun50i-h5-sram-c1, allwinner,sun4i-a10-sram-c1
+
 The valid sections compatible for H6 are:
     - allwinner,sun50i-h6-sram-c, allwinner,sun50i-a64-sram-c
 
-- 
2.19.2
