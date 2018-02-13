From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 2/3] arm64: dts: rockchip: add cdn-dp node for rk3399.
Date: Tue, 13 Feb 2018 15:35:48 +0100
Message-ID: <20180213143549.15197-2-enric.balletbo@collabora.com>
References: <20180213143549.15197-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180213143549.15197-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add a node for the cdn DP controller which is embedded in the rk3399
SoC.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Changes since v1:
- None

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index cdf733e4a450..17a9dc5591c5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -457,6 +457,46 @@
 		};
 	};
 
+        cdn_dp: dp@fec00000 {
+                compatible = "rockchip,rk3399-cdn-dp";
+                reg = <0x0 0xfec00000 0x0 0x100000>;
+                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
+                         <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
+                clock-names = "core-clk", "pclk", "spdif", "grf";
+                assigned-clocks = <&cru SCLK_DP_CORE>;
+                assigned-clock-rates = <100000000>;
+                power-domains = <&power RK3399_PD_HDCP>;
+                phys = <&tcphy0_dp>, <&tcphy1_dp>;
+                resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                         <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+                reset-names = "spdif", "dptx", "apb", "core";
+                rockchip,grf = <&grf>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+                status = "disabled";
+
+                ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        dp_in: port {
+                                #address-cells = <1>;
+                                #size-cells = <0>;
+                                dp_in_vopb: endpoint@0 {
+                                        reg = <0>;
+                                        remote-endpoint = <&vopb_out_dp>;
+                                };
+
+                                dp_in_vopl: endpoint@1 {
+                                        reg = <1>;
+                                        remote-endpoint = <&vopl_out_dp>;
+                                };
+                        };
+                };
+        };
+
 	gic: interrupt-controller@fee00000 {
 		compatible = "arm,gic-v3";
 		#interrupt-cells = <4>;
@@ -1553,6 +1593,11 @@
 				reg = <3>;
 				remote-endpoint = <&mipi1_in_vopl>;
 			};
+
+                        vopl_out_dp: endpoint@4 {
+                                reg = <4>;
+                                remote-endpoint = <&dp_in_vopl>;
+                        };
 		};
 	};
 
@@ -1605,6 +1650,11 @@
 				reg = <3>;
 				remote-endpoint = <&mipi1_in_vopb>;
 			};
+
+                        vopb_out_dp: endpoint@4 {
+                                reg = <4>;
+                                remote-endpoint = <&dp_in_vopb>;
+                        };
 		};
 	};
 
-- 
2.15.1
