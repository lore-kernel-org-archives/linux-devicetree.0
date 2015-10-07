From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH v4 4/4] ARM: STi: DT: Add support for stih418 A9 pll
Date: Wed,  7 Oct 2015 11:08:59 +0200
Message-ID: <1444208939-10233-5-git-send-email-gabriel.fernandez@linaro.org>
References: <1444208939-10233-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444208939-10233-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <maxime.coquelin@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Fabian Frederick <fabf@skynet.be>, Pawel Moll <pawel.moll@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Olivier Bideau <olivier.bideau@st.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

Add support for new PLL-type for stih418 A9-PLL.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 arch/arm/boot/dts/stih418-clock.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
index 148e177..ae6d997 100644
--- a/arch/arm/boot/dts/stih418-clock.dtsi
+++ b/arch/arm/boot/dts/stih418-clock.dtsi
@@ -44,7 +44,7 @@
 
 			clockgen_a9_pll: clockgen-a9-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih407-plls-c32-a9", "st,clkgen-plls-c32";
+				compatible = "st,stih418-plls-c28-a9", "st,clkgen-plls-c32";
 
 				clocks = <&clk_sysin>;
 
-- 
1.9.1
