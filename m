From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: [PATCH 1/4] ARM: dts: Fix RGMII pinctrl timings
Date: Thu, 1 Oct 2015 17:56:19 +0200
Message-ID: <1443714982-16251-2-git-send-email-maxime.coquelin@st.com>
References: <1443714982-16251-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1443714982-16251-1-git-send-email-maxime.coquelin@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, peter.griffin@linaro.org, lee.jones@linaro.org, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

These new re-timing values provides a better stability on Ethernet link.

Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 8fe542a..a538ae5 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -216,9 +216,9 @@
 						rxd2 = <&pio1 6 ALT1 IN DE_IO 0 CLK_A>;
 						rxd3 = <&pio1 7 ALT1 IN DE_IO 0 CLK_A>;
 						rxdv = <&pio2 0 ALT1 IN DE_IO 0 CLK_A>;
-						rxclk = <&pio2 2 ALT1 IN NICLK 500 CLK_A>;
+						rxclk = <&pio2 2 ALT1 IN NICLK 0 CLK_A>;
 						clk125 = <&pio3 7 ALT4 IN NICLK 0 CLK_A>;
-						phyclk = <&pio2 3 ALT4 OUT NICLK 1750 CLK_B>;
+						phyclk = <&pio2 3 ALT4 OUT NICLK 1250 CLK_B>;
 					};
 				};
 
-- 
1.9.1
