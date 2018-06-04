From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] arm64: dts: rockchip: correct voltage selector
 Firefly-RK3399
Date: Mon,  4 Jun 2018 19:15:23 +0200
Message-ID: <20180604171523.28454-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Vagrant Cascadian <vagrant@debian.org>, Catalin Marinas <catalin.marinas@arm.com>, Shawn Lin <shawn.lin@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Kever Yang <kever.yang@rock-chips.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Heinrich Schuchardt <xypron.glpk@gmx.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pierre-Hugues Husson <phh@phh.me>, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Without this patch the Firefly-RK3399 board boot process hangs after these
lines:

   fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
   fan53555-reg: supplied by vcc_sys
   vcc1v8_s3: supplied by vcc_1v8

Blacklisting driver fan53555 allows booting.

The device tree uses a value of fcs,suspend-voltage-selector different to
any other board.

Changing this setting to the usual value is sufficient to enable booting.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 4f28628aa091..50940ef844a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -458,7 +458,7 @@
 	vdd_cpu_b: regulator@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
-		fcs,suspend-voltage-selector = <0>;
+		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_cpu_b";
 		regulator-min-microvolt = <712500>;
 		regulator-max-microvolt = <1500000>;
-- 
2.17.1
