From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: phy: phy-rockchip-typec: add usb3 otg reset
Date: Fri, 12 Jan 2018 18:08:22 +0800
Message-ID: <1515751704-13213-2-git-send-email-william.wu@rock-chips.com>
References: <1515751704-13213-1-git-send-email-william.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1515751704-13213-1-git-send-email-william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lin.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds USB3 OTG reset property for rk3399 Type-C PHY
to hold the USB3 controller in reset state.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
index 6ea867e..db2902e 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
@@ -13,7 +13,7 @@ Required properties:
  - assigned-clock-rates : the phy core clk frequency, shall be: 50000000
  - resets : a list of phandle + reset specifier pairs
  - reset-names : string reset name, must be:
-		 "uphy", "uphy-pipe", "uphy-tcphy"
+		 "uphy", "uphy-pipe", "uphy-tcphy", "usb3-otg"
  - extcon : extcon specifier for the Power Delivery
 
 Note, there are 2 type-c phys for RK3399, and they are almost identical, except
@@ -56,8 +56,9 @@ Example:
 		assigned-clock-rates = <50000000>;
 		resets = <&cru SRST_UPHY0>,
 			 <&cru SRST_UPHY0_PIPE_L00>,
-			 <&cru SRST_P_UPHY0_TCPHY>;
-		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
+			 <&cru SRST_P_UPHY0_TCPHY>,
+			 <&cru SRST_A_USB3_OTG0>;
+		reset-names = "uphy", "uphy-pipe", "uphy-tcphy", "usb3-otg";
 		rockchip,typec-conn-dir = <0xe580 0 16>;
 		rockchip,usb3tousb2-en = <0xe580 3 19>;
 		rockchip,external-psm = <0xe588 14 30>;
@@ -84,8 +85,9 @@ Example:
 		assigned-clock-rates = <50000000>;
 		resets = <&cru SRST_UPHY1>,
 			 <&cru SRST_UPHY1_PIPE_L00>,
-			 <&cru SRST_P_UPHY1_TCPHY>;
-		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
+			 <&cru SRST_P_UPHY1_TCPHY>,
+			 <&cru SRST_A_USB3_OTG1>;
+		reset-names = "uphy", "uphy-pipe", "uphy-tcphy", "usb3-otg";
 		rockchip,typec-conn-dir = <0xe58c 0 16>;
 		rockchip,usb3tousb2-en = <0xe58c 3 19>;
 		rockchip,external-psm = <0xe594 14 30>;
-- 
2.0.0
