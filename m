From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 1/5] nvmem: sunxi-sid: fix wrong description in kernel doc
Date: Tue,  2 Apr 2019 11:45:10 -0400
Message-ID: <20190402154514.11284-2-tiny.windzz@gmail.com>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402154514.11284-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

qfprom->sunxi-sid

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
index 99c4ba6a3f61..d37017e343b1 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
@@ -12,7 +12,7 @@ Required properties:
 - reg: Should contain registers location and length
 
 = Data cells =
-Are child nodes of qfprom, bindings of which as described in
+Are child nodes of sunxi-sid, bindings of which as described in
 bindings/nvmem/nvmem.txt
 
 Example for sun4i:
-- 
2.17.0
