From: Laszlo Papp <lpapp@kde.org>
Subject: [PATCH] usage-model.txt: fix a typo
Date: Sat,  8 Feb 2014 08:50:18 +0000
Message-ID: <1391849418-5125-1-git-send-email-lpapp@kde.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob@landley.net
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laszlo Papp <lpapp@kde.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 Documentation/devicetree/usage-model.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/usage-model.txt b/Documentation/devicetree/usage-model.txt
index 2b6b3d3..cd2eae5 100644
--- a/Documentation/devicetree/usage-model.txt
+++ b/Documentation/devicetree/usage-model.txt
@@ -123,7 +123,7 @@ successor, the BeagleBoard xM board might look like, respectively:
 	compatible = "ti,omap3-beagleboard-xm", "ti,omap3450", "ti,omap3";
 
 Where "ti,omap3-beagleboard-xm" specifies the exact model, it also
-claims that it compatible with the OMAP 3450 SoC, and the omap3 family
+claims that it is compatible with the OMAP 3450 SoC, and the omap3 family
 of SoCs in general.  You'll notice that the list is sorted from most
 specific (exact board) to least specific (SoC family).
 
-- 
1.8.5.4

