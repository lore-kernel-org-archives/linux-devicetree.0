From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Define drive-impedance-ohm for
 RK3399's emmc-phy.
Date: Fri,  1 Mar 2019 16:33:44 +0100
Message-ID: <20190301153348.29870-2-christoph.muellner@theobroma-systems.com>
References: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: devicetree@vger.kernel.org, Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, Vicente Bergas <vicencb@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Tony Xie <tony.xie@rock-chips.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Randy Li <ayaka@soulik.info>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org, Christoph Muellner <christoph.muellner@theobroma-systems.com>
List-Id: devicetree@vger.kernel.org

A previous patch introduced the property 'drive-impedance-ohm'
for the RK3399's emmc phy node. This patch sets this value
explicitly to the default value of 50 Ohm.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 6cc1c9fa4ea6..b875364a7709 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1450,6 +1450,7 @@
 			clock-names = "refclk";
 			#phy-cells = <1>;
 			resets = <&cru SRST_PCIEPHY>;
+			drive-impedance-ohm = <50>;
 			reset-names = "phy";
 			status = "disabled";
 		};
-- 
2.11.0
