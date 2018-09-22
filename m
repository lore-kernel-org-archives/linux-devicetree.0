From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH 2/3] This patch add the eMMC to the ASUS tinker board S
Date: Sat, 22 Sep 2018 18:02:35 +0100
Message-ID: <20180922170236.8690-3-beagleboard@davidjohnsummers.uk>
References: <20180922170236.8690-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180922170236.8690-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rockchip@lists.infradead.org, David Summers <beagleboard@davidjohnsummers.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 arch/arm/boot/dts/rk3288-tinker-s.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-tinker-s.dts b/arch/arm/boot/dts/rk3288-tinker-s.dts
index 5e1078c6a784..bc691e3f9c07 100644
--- a/arch/arm/boot/dts/rk3288-tinker-s.dts
+++ b/arch/arm/boot/dts/rk3288-tinker-s.dts
@@ -11,3 +11,17 @@
 	model = "Rockchip RK3288 Asus Tinker Board S";
 	compatible = "asus,rk3288-tinker-s", "rockchip,rk3288";
 };
+
+&emmc {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	disable-wp;
+	non-removable;
+	num-slots = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_pwr &emmc_bus8>;
+	max-frequency = <150000000>;
+	mmc-hs200-1_8v;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
-- 
David Summers <beagleboard@davididjohnsummers.uk>
