From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 3/5] ARM: dts: stm32: add STMFX pinctrl/gpio expander support
 on stm32746g-eval
Date: Wed, 11 Apr 2018 11:47:03 +0200
Message-ID: <1523440025-18077-4-git-send-email-amelie.delaunay@st.com>
References: <1523440025-18077-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523440025-18077-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds support for STMicroelectronics Multi-Function eXpander
pinctrl/gpio expander on stm32746g-eval. It is connected on I2C1.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32746g-eval.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 2d4e717..bd9a33d 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -106,6 +106,22 @@
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
+
+	stmfxpinctrl: stmfx@42 {
+		compatible = "st,stmfx-0300";
+		reg = <0x42>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <8 1>;
+		status = "okay";
+
+		stmfxgpio: gpio-expander {
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			status = "okay";
+		};
+	};
 };
 
 &rtc {
-- 
2.7.4
