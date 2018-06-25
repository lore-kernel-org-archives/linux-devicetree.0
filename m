From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH V5 5/5] ARM: dts: stm32: update iwdg with lsi clock name for stm32f429
Date: Mon, 25 Jun 2018 17:43:03 +0200
Message-ID: <1529941383-8653-6-git-send-email-ludovic.Barre@st.com>
References: <1529941383-8653-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529941383-8653-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch updates iwdg watchdog to use lsi clock name.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index ede77e0..39ea13a 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -310,6 +310,7 @@
 			compatible = "st,stm32-iwdg";
 			reg = <0x40003000 0x400>;
 			clocks = <&clk_lsi>;
+			clock-names = "lsi";
 			status = "disabled";
 		};
 
-- 
2.7.4
