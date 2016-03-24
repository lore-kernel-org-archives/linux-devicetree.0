From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 3/3] phy: rockchip-emmc: adapt binding to specifiy register offset and length
Date: Thu, 24 Mar 2016 22:29:03 +0100
Message-ID: <1458854943-17388-3-git-send-email-heiko@sntech.de>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458854943-17388-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The emmc-phy occupies a contiguous set of 8 registers inside the general
register files, so the reg property should specify this.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
This is essential a counter argument for Shawn's move from reg to reg_offset
in "phy: rockchip-emmc: fix compile issue on arm64 platform" [0].
With the move under the grf we now also are able to specify this stuff
cleanly using already present mechanisms.

Also meant to v4.6-rc before the binding solidifies.


[0] https://lkml.org/lkml/2016/3/8/114

 Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
index 461e958..555cb0f 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
@@ -4,7 +4,7 @@ Rockchip EMMC PHY
 Required properties:
  - compatible: rockchip,rk3399-emmc-phy
  - #phy-cells: must be 0
- - reg: PHY configure reg address offset in "general
+ - reg: PHY register address offset and length in "general
    register files"
 
 Example:
@@ -12,12 +12,14 @@ Example:
 
 grf: syscon@ff770000 {
 	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 ...
 
 	emmcphy: phy@f780 {
 		compatible = "rockchip,rk3399-emmc-phy";
-		reg = <0xf780>;
+		reg = <0xf780 0x20>;
 		#phy-cells = <0>;
 	};
 };
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
