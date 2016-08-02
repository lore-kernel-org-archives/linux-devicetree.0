From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [v9 PATCH 4/6] arm64: dts: rockchip: add Type-C phy for RK3399
Date: Tue,  2 Aug 2016 20:45:11 +0800
Message-ID: <1470141913-1082-5-git-send-email-zyw@rock-chips.com>
References: <1470141913-1082-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1470141913-1082-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are 2 Type-C phy on RK3399, they are almost same, except the
address of register. They support USB3.0 Type-C and DisplayPort1.3
Alt Mode on USB Type-C. Register a phy, supply it to USB3 controller
and DP controller.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

---

Changes in v9:
- change #phy-cells to 1

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None
Changes in v1: None

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 0af03a3..7616ee1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -952,6 +952,50 @@
 		};
 	};
 
+	tcphy0: phy@ff7c0000 {
+		compatible = "rockchip,rk3399-typec-phy";
+		reg = <0x0 0xff7c0000 0x0 0x40000>;
+		rockchip,grf = <&grf>;
+		#phy-cells = <1>;
+		clocks = <&cru SCLK_UPHY0_TCPDCORE>,
+			 <&cru SCLK_UPHY0_TCPDPHY_REF>;
+		clock-names = "tcpdcore", "tcpdphy-ref";
+		assigned-clocks = <&cru SCLK_UPHY0_TCPDCORE>;
+		assigned-clock-rates = <50000000>;
+		resets = <&cru SRST_UPHY0>,
+			 <&cru SRST_UPHY0_PIPE_L00>,
+			 <&cru SRST_P_UPHY0_TCPHY>;
+		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
+		rockchip,typec-conn-dir = <0xe580 0 16>;
+		rockchip,usb3tousb2-en = <0xe580 3 19>;
+		rockchip,external-psm = <0xe588 14 30>;
+		rockchip,pipe-status = <0xe5c0 0 0>;
+		rockchip,uphy-dp-sel = <0x6268 19 19>;
+		status = "disabled";
+	};
+
+	tcphy1: phy@ff800000 {
+		compatible = "rockchip,rk3399-typec-phy";
+		reg = <0x0 0xff800000 0x0 0x40000>;
+		rockchip,grf = <&grf>;
+		#phy-cells = <1>;
+		clocks = <&cru SCLK_UPHY1_TCPDCORE>,
+			 <&cru SCLK_UPHY1_TCPDPHY_REF>;
+		clock-names = "tcpdcore", "tcpdphy-ref";
+		assigned-clocks = <&cru SCLK_UPHY1_TCPDCORE>;
+		assigned-clock-rates = <50000000>;
+		resets = <&cru SRST_UPHY1>,
+			 <&cru SRST_UPHY1_PIPE_L00>,
+			 <&cru SRST_P_UPHY1_TCPHY>;
+		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
+		rockchip,typec-conn-dir = <0xe58c 0 16>;
+		rockchip,usb3tousb2-en = <0xe58c 3 19>;
+		rockchip,external-psm = <0xe594 14 30>;
+		rockchip,pipe-status = <0xe5c0 16 16>;
+		rockchip,uphy-dp-sel = <0x6268 3 19>;
+		status = "disabled";
+	};
+
 	watchdog@ff840000 {
 		compatible = "snps,dw-wdt";
 		reg = <0x0 0xff840000 0x0 0x100>;
-- 
2.6.3
