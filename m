From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH V3 2/3] ARM: dts: stm32: add iwdg2 support for stm32mp157c
Date: Wed, 20 Jun 2018 15:51:37 +0200
Message-ID: <1529502698-13263-3-git-send-email-ludovic.Barre@st.com>
References: <1529502698-13263-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529502698-13263-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds independent watchdog support for stm32mp157c.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 7d17538..95cc166 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -784,6 +784,14 @@
 			status = "disabled";
 		};
 
+		iwdg2: watchdog@5a002000 {
+			compatible = "st,stm32mp1-iwdg";
+			reg = <0x5a002000 0x400>;
+			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
+			clock-names = "pclk", "lsi";
+			status = "disabled";
+		};
+
 		usbphyc: usbphyc@5a006000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4
