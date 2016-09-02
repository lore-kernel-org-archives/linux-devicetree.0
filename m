From: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 1/4] nvmem: rockchip-efuse: update compatible strings for Rockchip efuse
Date: Thu,  1 Sep 2016 20:16:54 -0700
Message-ID: <1472786217-52214-2-git-send-email-finley.xiao@rock-chips.com>
References: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472786217-52214-1-git-send-email-finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rk3399-efuse is organized as 32bits by 32 one-time programmable electrical
fuses. The efuse of earlier SoCs are organized as 32bits by 8 one-time
programmable electrical fuses with random access interface.

Add different device tree compatible string for different SoCs to be able
to differentiate between the two. The old binding is of course preserved,
though deprecated.

Signed-off-by: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
index 8f86ab3..94aeeea 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
@@ -1,11 +1,20 @@
 = Rockchip eFuse device tree bindings =
 
 Required properties:
-- compatible: Should be "rockchip,rockchip-efuse"
+- compatible: Should be one of the following.
+  - "rockchip,rk3066a-efuse" - for RK3066a SoCs.
+  - "rockchip,rk3188-efuse" - for RK3188 SoCs.
+  - "rockchip,rk3288-efuse" - for RK3288 SoCs.
+  - "rockchip,rk3399-efuse" - for RK3399 SoCs.
 - reg: Should contain the registers location and exact eFuse size
 - clocks: Should be the clock id of eFuse
 - clock-names: Should be "pclk_efuse"
 
+Deprecated properties:
+- compatible: "rockchip,rockchip-efuse"
+  Old efuse compatible value compatible to rk3066a, rk3188 and rk3288
+  efuses
+
 = Data cells =
 Are child nodes of eFuse, bindings of which as described in
 bindings/nvmem/nvmem.txt
@@ -13,7 +22,7 @@ bindings/nvmem/nvmem.txt
 Example:
 
 	efuse: efuse@ffb40000 {
-		compatible = "rockchip,rockchip-efuse";
+		compatible = "rockchip,rk3288-efuse";
 		reg = <0xffb40000 0x20>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
