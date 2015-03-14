From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 1/2] of: Add vendor prefix for Aptina Imaging
Date: Sat, 14 Mar 2015 16:57:36 +0200
Message-ID: <1426345057-2752-1-git-send-email-laurent.pinchart@ideasonboard.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: =?UTF-8?q?Carlos=20Sanmart=C3=ADn=20Bustos?= <carsanbu@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

Aptina has recently been acquired by ON Semiconductor, but the name Aptina is
still widely used. Should the onnn prefix be used instead ?

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389ca13..4326f52 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -20,6 +20,7 @@ amlogic	Amlogic, Inc.
 ams	AMS AG
 amstaos	AMS-Taos Inc.
 apm	Applied Micro Circuits Corporation (APM)
+aptina	Aptina Imaging
 arm	ARM Ltd.
 armadeus	ARMadeus Systems SARL
 asahi-kasei	Asahi Kasei Corp.
-- 
Regards,

Laurent Pinchart
