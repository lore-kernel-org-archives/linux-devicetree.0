From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] devicetree: Add vendor-prefix for DH electronics GmbH
Date: Mon,  9 Oct 2017 20:18:33 +0200
Message-ID: <20171009181833.2256-1-marex@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for DH electronics GmbH, https://www.dh-electronics.com .
The company is a SoM and evaluation board manufacturer.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b45d5a06a105..a27f45448d49 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -84,6 +84,7 @@ davicom	DAVICOM Semiconductor, Inc.
 delta	Delta Electronics, Inc.
 denx	Denx Software Engineering
 devantech	Devantech, Ltd.
+dh	DH electronics GmbH
 digi	Digi International Inc.
 digilent	Diglent, Inc.
 dioo	Dioo Microcircuit Co., Ltd
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
