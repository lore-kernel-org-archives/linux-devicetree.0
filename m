From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH net-next] Documentation: devicetree: revise ethernet device-tree binding about TRGMII
Date: Fri, 23 Sep 2016 00:11:00 +0800
Message-ID: <1474560660-20768-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: objelf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

fix typo in mediatek-net.txt and add phy-mode "trgmii" to ethernet.txt

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reported-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/net/ethernet.txt     | 4 ++--
 Documentation/devicetree/bindings/net/mediatek-net.txt | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index bae848e..da05f8b 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -34,7 +34,7 @@ Required properties:
 - phy-handle: see ethernet.txt file in the same directory and
 	the phy-mode "trgmii" required being provided when reg
 	is equal to 0 and the MAC uses fixed-link to connect
-	with inernal switch such as MT7530.
+	with internal switch such as MT7530.
 
 Example:
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
