From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [v1 PATCH 1/4] Documentation: bindings: add dt doc for Rockchip USB
 Type-C PHY
Date: Fri,  3 Jun 2016 23:15:08 +0800
Message-ID: <1464966911-18949-2-git-send-email-zyw@rock-chips.com>
References: <1464966911-18949-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1464966911-18949-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a binding that describes the Rockchip USB Type-C PHY
for rk3399

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v1:
- add extcon node description
- move the registers in phy driver
- remove the suffix of reset

 .../devicetree/bindings/phy/phy-rockchip-typec.txt | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
new file mode 100644
index 0000000..964e0f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
@@ -0,0 +1,46 @@
+* ROCKCHIP type-c PHY
+---------------------
+
+Required properties:
+ - compatible: should be "rockchip,rk3399-typec-phy0" or
+			 "rockchip,rk3399-typec-phy1"
+ - reg : Address and length of the usb phy control register set
+ - rockchip,grf : phandle to the syscon managing the "general
+   register files"
+ - clocks : phandle + clock specifier for the phy clocks
+ - clock-names: string, clock name, must be "tcpdcore", "tcpdphy_ref";
+ - resets : a list of phandle + reset specifier pairs
+ - reset-names : string reset name, must be:
+		 "tcphy", "tcphy_pipe", "uphy_tcphy"
+ - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
+ - extcon: extcon specifier for the Power Delivery
+
+Example:
+	tcphy0: phy@ff7c0000 {
+		compatible = "rockchip,rk3399-typec-phy0";
+		reg = <0x0 0xff7c0000 0x0 0x40000>;
+		#phy-cells = <0>;
+		extcon = <&fusb1>;
+		rockchip,grf = <&grf>;
+		clocks = <&cru SCLK_UPHY0_TCPDCORE>,
+			 <&cru SCLK_UPHY0_TCPDPHY_REF>;
+		clock-names = "tcpdcore", "tcpdphy_ref";
+		resets = <&cru SRST_UPHY0>,
+			 <&cru SRST_UPHY0_PIPE_L00>,
+			 <&cru SRST_P_UPHY0_TCPHY>;
+		reset-names = "tcphy", "tcphy_pipe", "uphy_tcphy";
+	};
+
+	tcphy1: phy@ff800000 {
+		compatible = "rockchip,rk3399-typec-phy1";
+		reg = <0x0 0xff800000 0x0 0x40000>;
+		#phy-cells = <0>;
+		rockchip,grf = <&grf>;
+		clocks = <&cru SCLK_UPHY1_TCPDCORE>,
+			 <&cru SCLK_UPHY1_TCPDPHY_REF>;
+		clock-names = "tcpdcore", "tcpdphy_ref";
+		resets = <&cru SRST_UPHY1>,
+		         <&cru SRST_UPHY1_PIPE_L00>,
+			 <&cru SRST_P_UPHY1_TCPHY>;
+		reset-names = "tcphy", "tcphy_pipe", "uphy_tcphy";
+	};
-- 
2.6.3
