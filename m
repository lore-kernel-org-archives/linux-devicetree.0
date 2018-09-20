From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH] ARM: dts: stm32: update HASH1 dma property on stm32mp157c
Date: Thu, 20 Sep 2018 18:17:06 +0200
Message-ID: <1537460226-1435-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: lionel.debieve@st.com, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Remove unused parameter from HASH1 dma property on stm32mp157c SoC.

Fixes: 1e726a40e067 ("ARM: dts: stm32: Add HASH support on stm32mp157c")

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 185541a..04cf534 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -923,7 +923,7 @@
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc HASH1>;
 			resets = <&rcc HASH1_R>;
-			dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0 0x0>;
+			dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0>;
 			dma-names = "in";
 			dma-maxburst = <2>;
 			status = "disabled";
-- 
2.7.4
