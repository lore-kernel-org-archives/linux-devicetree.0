From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 4/5] ARM: dts: stm32: Add watchdog support for STM32F429 eval board
Date: Thu, 30 Mar 2017 17:15:25 +0200
Message-ID: <1490886926-20585-5-git-send-email-yannick.fertre@st.com>
References: <1490886926-20585-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490886926-20585-1-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds watchdog support for STM32x9I-Eval board.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32429i-eval.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 6e4b42a..6eaa382 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -144,6 +144,10 @@
 	};
 };
 
+&iwdg {
+	status = "okay";
+};
+
 &adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&adc3_in8_pin>;
-- 
1.9.1
