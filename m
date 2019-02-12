From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] dt-bindings: Add vendor prefix for feiyang
Date: Tue, 12 Feb 2019 17:22:32 +0530
Message-ID: <20190212115232.4532-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for feiyang, known as
Shenzhen Fly Young Technology Co.,LTD. a known producer for LCD modules.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note: notation about using 'feiyang' is based on the datasheet 
http://files.pine64.org/doc/datasheet/pine64/FY07024DI26A30-D_feiyang_LCD_panel.pdf

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index a5ad57eaee20..f42e12eb9d64 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -140,6 +140,7 @@ fairphone	Fairphone B.V.
 faraday	Faraday Technology Corporation
 fastrax	Fastrax Oy
 fcs	Fairchild Semiconductor
+feiyang	Shenzhen Fly Young Technology Co.,LTD.
 firefly	Firefly
 focaltech	FocalTech Systems Co.,Ltd
 friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
-- 
2.18.0.321.gffc6fa0e3
