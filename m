From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 1/6] DT: add vendor prefixes for Ralink
Date: Sat, 13 Apr 2013 10:50:21 +0200
Message-ID: <1365843026-11015-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, John Crispin <blogic@openwrt.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 19e1ef7..6527412 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -41,6 +41,7 @@ onnn	ON Semiconductor Corp.
 picochip	Picochip Ltd
 powervr	PowerVR (deprecated, use img)
 qcom	Qualcomm, Inc.
+ralink	Mediatek/Ralink Technology Corp.
 ramtron	Ramtron International
 realtek Realtek Semiconductor Corp.
 renesas	Renesas Electronics Corporation
-- 
1.7.10.4
