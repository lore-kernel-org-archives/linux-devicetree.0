From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 09/15] dt-bindings: sram: sunxi: Add compatible for the A64
 SRAM C1
Date: Wed,  5 Dec 2018 10:24:38 +0100
Message-ID: <20181205092444.29497-10-paul.kocialkowski@bootlin.com>
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

This introduces a new compatible for the A64 SRAM C1 section, that is
compatible with the SRAM C1 section as found on the A10.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sram/sunxi-sram.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
index 5c9a54ad3b53..ab5a70bb9a64 100644
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -56,6 +56,7 @@ The valid sections compatible for H3 are:
 
 The valid sections compatible for A64 are:
     - allwinner,sun50i-a64-sram-c
+    - allwinner,sun50i-a64-sram-c1, allwinner,sun4i-a10-sram-c1
 
 The valid sections compatible for H5 are:
     - allwinner,sun50i-h5-sram-c1, allwinner,sun4i-a10-sram-c1
-- 
2.19.2
