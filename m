From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH net-next v2] Documentation: devicetree: revise ethernet device-tree binding about TRGMII
Date: Fri, 23 Sep 2016 14:01:20 +0800
Message-ID: <1474610480-1883-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

add phy-mode "trgmii" to
Documentation/devicetree/bindings/net/ethernet.txt

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reported-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/net/ethernet.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index 5d88f37..e1d7681 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -11,8 +11,8 @@ The following properties are common to the Ethernet controllers:
   the maximum frame size (there's contradiction in ePAPR).
 - phy-mode: string, operation mode of the PHY interface; supported values are
   "mii", "gmii", "sgmii", "qsgmii", "tbi", "rev-mii", "rmii", "rgmii", "rgmii-id",
-  "rgmii-rxid", "rgmii-txid", "rtbi", "smii", "xgmii"; this is now a de-facto
-  standard property;
+  "rgmii-rxid", "rgmii-txid", "rtbi", "smii", "xgmii", "trgmii"; this is now a
+  de-facto standard property;
 - phy-connection-type: the same as "phy-mode" property but described in ePAPR;
 - phy-handle: phandle, specifies a reference to a node representing a PHY
   device; this property is described in ePAPR and so preferred;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
