From: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 1/3] Documentation: bindings: add assign clock property in
 u2phy node
Date: Thu,  2 Mar 2017 15:49:03 +0800
Message-ID: <1488440945-27291-2-git-send-email-daniel.meng@rock-chips.com>
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

On some platform such as RK3328, the 480m clock may need to assign
clock parent in dts in stead of clock driver. So this patch add
property of assigned-clocks and assigned-clock-parents to assign
parent for 480m clock.

Changes in v2:
 - move u2phy grf specification to grf.txt

Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index 3c29c77..e71a8d2 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -2,6 +2,7 @@ ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
 
 Required properties (phy (parent) node):
  - compatible : should be one of the listed compatibles:
+	* "rockchip,rk3328-usb2phy"
 	* "rockchip,rk3366-usb2phy"
 	* "rockchip,rk3399-usb2phy"
  - reg : the address offset of grf for usb-phy configuration.
@@ -11,6 +12,11 @@ Required properties (phy (parent) node):
 Optional properties:
  - clocks : phandle + phy specifier pair, for the input clock of phy.
  - clock-names : input clock name of phy, must be "phyclk".
+ - assigned-clocks : phandle of usb 480m clock.
+ - assigned-clock-parents : parent of usb 480m clock, select between
+		 usb-phy output 480m and xin24m.
+		 Refer to clk/clock-bindings.txt for generic clock
+		 consumer properties.
 
 Required nodes : a sub-node is required for each port the phy provides.
 		 The sub-node name is used to identify host or otg port,
-- 
1.9.1
