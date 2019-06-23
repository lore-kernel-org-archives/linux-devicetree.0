From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 5/9] dt-bindings: vendor-prefixes: add SoChip
Date: Sun, 23 Jun 2019 12:37:57 +0800
Message-ID: <20190623043801.14040-6-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Shenzhen SoChip Technology Co., Ltd. is a hardware vendor that produces
EVBs with Allwinner chips. There's also a SoC named S3 that is developed
by Allwinner (based on Allwinner V3/V3s) but branded SoChip.

Add the vendor prefix for SoChip.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No changes in v3.

Changes in v2:
- Add the review tag by Rob.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d14604e58d96..92f50cac1055 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -859,6 +859,8 @@ patternProperties:
     description: Standard Microsystems Corporation
   "^snps,.*":
     description: Synopsys, Inc.
+  "^sochip,.*":
+    description: Shenzhen SoChip Technology Co., Ltd.
   "^socionext,.*":
     description: Socionext Inc.
   "^solidrun,.*":
-- 
2.21.0
