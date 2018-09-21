From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: amlogic: Add Meson G12A binding
Date: Fri, 21 Sep 2018 16:34:40 +0800
Message-ID: <1537518881-53137-2-git-send-email-jianxin.pan@amlogic.com>
References: <1537518881-53137-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537518881-53137-1-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Jian Hu <jian.hu@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Introduce new bindings for the Meson G12A SoC

Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index b5c2b5c..cf4bbc7 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -57,6 +57,10 @@ Boards with the Amlogic Meson AXG A113D SoC shall have the following properties:
   Required root node property:
     compatible: "amlogic,a113d", "amlogic,meson-axg";
 
+Boards with the Amlogic Meson G12A S905D2 SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,g12a";
+
 Board compatible values (alphabetically, grouped by SoC):
 
   - "geniatech,atv1200" (Meson6)
@@ -101,6 +105,8 @@ Board compatible values (alphabetically, grouped by SoC):
 
   - "amlogic,s400" (Meson axg a113d)
 
+  - "amlogic,u200" (Meson g12a s905d2)
+
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
 
-- 
1.9.1
