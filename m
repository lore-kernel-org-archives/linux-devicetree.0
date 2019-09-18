From: Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH] media: dt-bindings: Fix building error for dt_binding_check
Date: Wed, 18 Sep 2019 17:31:00 +0530
Message-ID: <1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mripard@kernel.org
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

$id doesn't match the actual filename, so update the $id

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 27f38ee..5dd1cf49 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
+$id: http://devicetree.org/schemas/media/allwinner,sun4i-a10-csi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
-- 
2.7.4
