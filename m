From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH 04/11] ARM: DT: STiH407: Add compatibility string on clkgend0 for audio clocks
Date: Wed, 18 May 2016 10:41:25 +0200
Message-ID: <1463560892-7209-5-git-send-email-gabriel.fernandez@linaro.org>
References: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, arnaud.pouliquen@st.com, benjamin.gaignard@st.com, vincent.abriou@st.com
List-Id: devicetree@vger.kernel.org

This patch is used in the clock driver to apply a clock propagation
flag on the audio clocks of STiH407

Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index ad45f5e..76c6984 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -216,7 +216,7 @@
 
 			clk_s_d0_flexgen: clk-s-d0-flexgen {
 				#clock-cells = <1>;
-				compatible = "st,flexgen";
+				compatible = "st,stih407-clkgend0", "st,flexgen";
 
 				clocks = <&clk_s_d0_quadfs 0>,
 					 <&clk_s_d0_quadfs 1>,
-- 
1.9.1
