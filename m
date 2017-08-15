From: <sean.wang@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: regulator: add fixes with MT6311 dt-bindings shouldn't reference driver
Date: Tue, 15 Aug 2017 17:46:26 +0800
Message-ID: <8b3da7d4b5aefa34b5c330bae4582c2b44df8a72.1502790160.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

DT bindings shouldn't reference drivers and they should be OS-agnostic.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
index 02649d8..84d544d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
@@ -1,4 +1,4 @@
-Mediatek MT6311 Regulator Driver
+Mediatek MT6311 Regulator
 
 Required properties:
 - compatible: "mediatek,mt6311-regulator"
-- 
2.7.4
