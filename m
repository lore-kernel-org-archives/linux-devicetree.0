From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 2/2] ARM: dts: rockchip: enable eDP panel at Firefly Release
Date: Sun,  7 May 2017 22:46:33 +0800
Message-ID: <20170507144633.11714-3-ayaka@soulik.info>
References: <20170507144633.11714-1-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170507144633.11714-1-ayaka@soulik.info>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, heiko@sntech.de, Randy Li <ayaka@soulik.info>, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/rk3288-firefly.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-firefly.dts b/arch/arm/boot/dts/rk3288-firefly.dts
index 14271be..b3964c8 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dts
+++ b/arch/arm/boot/dts/rk3288-firefly.dts
@@ -48,10 +48,22 @@
 	compatible = "firefly,firefly-rk3288", "rockchip,rk3288";
 };
 
+&edp {
+	status = "okay";
+};
+
+&edp_phy {
+	status = "okay";
+};
+
 &ir {
 	gpios = <&gpio7 RK_PA0 GPIO_ACTIVE_LOW>;
 };
 
+&panel {
+	status = "okay";
+};
+
 &pinctrl {
 	act8846 {
 		pmic_vsel: pmic-vsel {
@@ -69,3 +81,19 @@
 &pwm1 {
 	status = "okay";
 };
+
+&vopb {
+	status = "okay";
+};
+
+&vopb_mmu {
+	status = "okay";
+};
+
+&vopl {
+	status = "okay";
+};
+
+&vopl_mmu {
+	status = "okay";
+};
-- 
2.9.3
