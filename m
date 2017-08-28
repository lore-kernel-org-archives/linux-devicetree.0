From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv2 4/7] ARM: dts: stm32: Enable USB HS on stm32746g-eval
Date: Mon, 28 Aug 2017 16:20:15 +0200
Message-ID: <1503930018-536-5-git-send-email-amelie.delaunay@st.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1503930018-536-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch enables USB HS on stm32746g-eval (Host mode).

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32746g-eval.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 69a9579..03ee797 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -83,6 +83,13 @@
 			gpios = <&gpioc 13 0>;
 		};
 	};
+
+	usbotg_hs_phy: usb-phy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+		clocks = <&rcc 0 STM32F7_AHB1_CLOCK(OTGHSULPI)>;
+		clock-names = "main_clk";
+	};
 };
 
 &clk_hse {
@@ -102,3 +109,12 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbotg_hs {
+	dr_mode = "host";
+	phys = <&usbotg_hs_phy>;
+	phy-names = "usb2-phy";
+	pinctrl-0 = <&usbotg_hs_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.7.4
