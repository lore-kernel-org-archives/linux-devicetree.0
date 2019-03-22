From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] ARM: dts: rockchip: Add dvs-gpios to rk3288-veyron-jerry
Date: Fri, 22 Mar 2019 09:52:09 -0700
Message-ID: <20190322165209.196926-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mka@chromium.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

When the rk3288-jerry device tree was first submitted we left out the
dvs-gpios because I pointed out that the property "dvs-gpios" wasn't
yet supported upstream [1].  Soon after that the property was added in
commit bad47ad2eef3 ("regulator: rk808: fixed the overshoot when
adjust voltage").  ...but we forgot to go back and add the property to
the jerry device tree file.  Let's do so now.

NOTE: without this patch, jerry is likely still stable (thanks to the
fallback of making many small jumps in the rk808 regulator code) but
it'll take quite a bit longer to make voltage transitions.

[1] https://lore.kernel.org/linux-arm-kernel/CAD=FV=WwFgjzbk9xF5TU_ie6UnHQMyrZ176D4+jJTWWOoaKC2Q@mail.gmail.com/

Fixes: f3ee390e4ef2 ("ARM: dts: rockchip: add veyron-jerry board")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron-jerry.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
index 2ba89895c33a..cc3019dc38e1 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jerry.dts
@@ -61,7 +61,9 @@
 
 &rk808 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pmic_int_l>;
+	pinctrl-0 = <&pmic_int_l &dvs_1 &dvs_2>;
+	dvs-gpios = <&gpio7 RK_PB4 GPIO_ACTIVE_HIGH>,
+		    <&gpio7 RK_PB7 GPIO_ACTIVE_HIGH>;
 
 	regulators {
 		mic_vcc: LDO_REG2 {
-- 
2.21.0.392.gf8f6787159e-goog
