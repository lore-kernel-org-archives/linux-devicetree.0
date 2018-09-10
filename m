Return-Path: <SRS0=jO/Z=LY=hxt-semitech.com=dongsheng.wang@kernel.org>
From: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
Subject: [PATCH] dt-bindings: net/ibm: fix spelling issue
Date: Mon, 10 Sep 2018 13:35:03 +0800
Message-ID: <1536557703-19637-1-git-send-email-dongsheng.wang@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
List-ID: <devicetree@vger.kernel.org>

Fix a word spelling issue.

Signed-off-by: Wang Dongsheng <dongsheng.wang@hxt-semitech.com>
---
 Documentation/devicetree/bindings/net/ibm,emac.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/ibm,emac.txt b/Documentation/devicetree/bindings/net/ibm,emac.txt
index c0c14aa3f97c..fd76d9bf4a3a 100644
--- a/Documentation/devicetree/bindings/net/ibm,emac.txt
+++ b/Documentation/devicetree/bindings/net/ibm,emac.txt
@@ -45,7 +45,7 @@
 			  Supported values are: "mii", "rmii", "smii", "rgmii",
 			  "tbi", "gmii", rtbi", "sgmii".
 			  For Axon on CAB, it is "rgmii"
-    - mdio-device       : 1 cell, required iff using shared MDIO registers
+    - mdio-device       : 1 cell, required if using shared MDIO registers
 			  (440EP).  phandle of the EMAC to use to drive the
 			  MDIO lines for the PHY used by this EMAC.
     - zmii-device       : 1 cell, required iff connected to a ZMII.  phandle of
-- 
2.18.0
