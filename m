From: <patrice.chotard@st.com>
Subject: [PATCH 1/3] ARM: dts: stm32: Add usart2_pins on stm32h743
Date: Wed, 7 Jun 2017 09:16:21 +0200
Message-ID: <1496819783-5113-2-git-send-email-patrice.chotard@st.com>
References: <1496819783-5113-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1496819783-5113-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com
Cc: Patrice Chotard <patrice.chotard@st.com>
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Add usart2 pins definition in order to add usart2 support
dedicated for console output on stm32h743i-disco board.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
index fcc1e06..76bbd65 100644
--- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
@@ -151,6 +151,19 @@
 					bias-disable;
 				};
 			};
+
+			usart2_pins: usart2@0 {
+				pins1 {
+					pinmux = <STM32H7_PD5_FUNC_USART2_TX>;
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32H7_PD6_FUNC_USART2_RX>;
+					bias-disable;
+				};
+			};
 		};
 	};
 };
-- 
1.9.1
