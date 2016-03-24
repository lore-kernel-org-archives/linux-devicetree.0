From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] phy: rockchip-emmc: should be a child device of the GRF
Date: Thu, 24 Mar 2016 14:22:54 +0100
Message-ID: <1458825774-9957-2-git-send-email-heiko@sntech.de>
References: <1458825774-9957-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458825774-9957-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The emmc-phy is fully enclosed in the general register files (GRF).
Therefore as seen from the device-tree it shouldn't be a separate platform-
device but instead a sub-device of the GRF - using the simply-mfd mechanism.

The driver entered the kernel in the current merge-window, so we can still
adapt the binding without needing a fallback, as the binding hasn't been
released with a full kernel yet.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
Hi Shawn, Kishon,

I didn't see this new phy driver until now, so I'd really like to get
this sorted before the old binding solidifies :-).

I'll convert the usbphy as well, but that has to have the fallback for
the old binding, so is not as urgent as these two.

As mentioned in the patch description above, this is meant as a fixup for
kernel 4.6.


One thing I noticed, the emmc phy is occupying the range 0xf780-0xf7a0,
so shouldn't the reg property reflect that, like
    reg = <0xf780 0x20>;
to stay with common conventions?


 .../devicetree/bindings/phy/rockchip-emmc-phy.txt     | 19 ++++++++++++-------
 drivers/phy/phy-rockchip-emmc.c                       |  5 ++++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
index 61916f1..d711259 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-emmc-phy.txt
@@ -3,17 +3,22 @@ Rockchip EMMC PHY
 
 Required properties:
  - compatible: rockchip,rk3399-emmc-phy
- - rockchip,grf : phandle to the syscon managing the "general
-   register files"
  - #phy-cells: must be 0
  - reg: PHY configure reg address offset in "general
    register files"
 
 Example:
 
-emmcphy: phy {
-	compatible = "rockchip,rk3399-emmc-phy";
-	rockchip,grf = <&grf>;
-	reg = <0xf780>;
-	#phy-cells = <0>;
+
+grf: syscon@ff770000 {
+	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+
+...
+
+	emmcphy: phy@f780 {
+		compatible = "rockchip,rk3399-emmc-phy";
+		rockchip,grf = <&grf>;
+		reg = <0xf780>;
+		#phy-cells = <0>;
+	};
 };
diff --git a/drivers/phy/phy-rockchip-emmc.c b/drivers/phy/phy-rockchip-emmc.c
index 887b4c2..6ebcf3e 100644
--- a/drivers/phy/phy-rockchip-emmc.c
+++ b/drivers/phy/phy-rockchip-emmc.c
@@ -176,7 +176,10 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
 	struct regmap *grf;
 	unsigned int reg_offset;
 
-	grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
+	if (!dev->parent || !dev->parent->of_node)
+		return -ENODEV;
+
+	grf = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(grf)) {
 		dev_err(dev, "Missing rockchip,grf property\n");
 		return PTR_ERR(grf);
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
