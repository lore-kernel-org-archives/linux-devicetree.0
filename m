From: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/3] Documentation: bindings: add DT documentation for
 u2phy and u2phy grf
Date: Thu,  2 Mar 2017 15:49:04 +0800
Message-ID: <1488440945-27291-3-git-send-email-daniel.meng@rock-chips.com>
References: <1488440945-27291-1-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488440945-27291-1-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Due to the u2phy registers are separated from general grf, we need to
add u2phy grf node and place u2phy node in it. So this patch add u2phy
grf node.

Changes in v2:
 - add u2phy grf specification

Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
index 013e71a..6ac23f9 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
@@ -7,6 +7,9 @@ From RK3368 SoCs, the GRF is divided into two sections,
 - GRF, used for general non-secure system,
 - PMUGRF, used for always on system
 
+On RK3328 SoCs, the GRF is divided into three sections,
+except GRF and PMUGRF, add a section for USB2PHYGRF,
+
 Required Properties:
 
 - compatible: GRF should be one of the followings
@@ -19,6 +22,8 @@ Required Properties:
 - compatible: PMUGRF should be one of the followings
    - "rockchip,rk3368-pmugrf", "syscon": for rk3368
    - "rockchip,rk3399-pmugrf", "syscon": for rk3399
+- compatible: USB2GRF should be one of the followings
+   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
 - reg: physical base address of the controller and length of memory mapped
   region.
 
@@ -33,3 +38,13 @@ Example: GRF and PMUGRF of RK3399 SoCs
 		compatible = "rockchip,rk3399-grf", "syscon";
 		reg = <0x0 0xff770000 0x0 0x10000>;
 	};
+
+Example: USB2GRF of RK3328 SoCs
+
+	usb2phy_grf: syscon@ff450000 {
+		compatible = "rockchip,rk3328-usb2phy-grf", "syscon",
+			     "simple-mfd";
+		reg = <0x0 0xff450000 0x0 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
-- 
1.9.1
