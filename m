From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 2/5] nvmem: sunxi-sid: add binding for H6's SID controller
Date: Tue,  2 Apr 2019 11:45:11 -0400
Message-ID: <20190402154514.11284-3-tiny.windzz@gmail.com>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402154514.11284-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add a binding for H6's SID controller.

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
index d37017e343b1..cfb18b4ef8f7 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
@@ -8,6 +8,7 @@ Required properties:
   "allwinner,sun8i-h3-sid"
   "allwinner,sun50i-a64-sid"
   "allwinner,sun50i-h5-sid"
+  "allwinner,sun50i-h6-sid"
 
 - reg: Should contain registers location and length
 
-- 
2.17.0
