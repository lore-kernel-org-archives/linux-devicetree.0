From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] of: Add vendor prefix for ROHM Semiconductor
Date: Sun, 16 Apr 2017 20:01:11 +0200
Message-ID: <20170416180111.16795-1-marek.vasut+renesas@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

ROHM Semiconductor Co., Ltd. offer PMICs, touchscreen controllers etc.
http://www.rohm.com/web/global/

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c7d1b72ec3c5..de191865d1ed 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -266,6 +266,7 @@ richtek	Richtek Technology Corporation
 ricoh	Ricoh Co. Ltd.
 rikomagic	Rikomagic Tech Corp. Ltd
 rockchip	Fuzhou Rockchip Electronics Co., Ltd
+rohm	ROHM Semiconductor Co., Ltd
 samsung	Samsung Semiconductor
 samtec	Samtec/Softing company
 sandisk	Sandisk Corporation
-- 
2.11.0
