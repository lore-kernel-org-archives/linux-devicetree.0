From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v7 1/2] mtd: nand: sunxi: update DT bindings
Date: Fri, 24 Jun 2016 13:00:04 +0800
Message-ID: <20160624050005.31186-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB7H4WK5QKGQEZTWXACY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the reset lines

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
Changes in v7:
  - Rebased for nand/next branch.
  - Merged the two part of "Optional properties" of nand/next's document
    into one part.

 Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index 6fdf8f6..b040ed4 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -14,17 +14,17 @@ Required properties:
 Optional properties:
 - dmas : shall reference DMA channel associated to the NAND controller.
 - dma-names : shall be "rxtx".
-
-Optional children nodes:
-Children nodes represent the available nand chips.
-
-Optional properties:
+- reset : phandle + reset specifier pair
+- reset-names : shall be "ahb" if present
 - allwinner,rb : shall contain the native Ready/Busy ids.
  or
 - rb-gpios : shall contain the gpios used as R/B pins.
 - nand-ecc-mode : one of the supported ECC modes ("hw", "hw_syndrome", "soft",
   "soft_bch" or "none")
 
+Optional children nodes:
+Children nodes represent the available nand chips.
+
 see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
 
 
-- 
2.9.0
