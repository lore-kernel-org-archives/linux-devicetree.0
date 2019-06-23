From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 7/9] dt-bindings: vendor-prefixes: add Sipeed
Date: Sun, 23 Jun 2019 12:37:59 +0800
Message-ID: <20190623043801.14040-8-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Shenzhen Sipeed Technology Co., Ltd. is a company focused on development
kits, which also contains rebranded Lichee Pi series.

Add its vendor prefix binding.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v3:
- Rebased because of the addition of sinlinx and sinovoip.

Patch introduced in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 92f50cac1055..bbbce4c9cc4e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -847,6 +847,8 @@ patternProperties:
     description: Sinlinx Electronics Technology Co., LTD
   "^sinovoip,.*":
     description: SinoVoip Co., Ltd
+  "^sipeed,.*":
+    description: Shenzhen Sipeed Technology Co., Ltd.
   "^sirf,.*":
     description: SiRF Technology, Inc.
   "^sis,.*":
-- 
2.21.0
