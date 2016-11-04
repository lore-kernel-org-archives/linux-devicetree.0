From: <gabriel.fernandez@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32f429: Add QSPI clock
Date: Fri, 4 Nov 2016 09:52:57 +0100
Message-ID: <1478249577-25999-3-git-send-email-gabriel.fernandez@st.com>
References: <1478249577-25999-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478249577-25999-1-git-send-email-gabriel.fernandez@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, gabriel.fernandez@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch adds the QSPI clock for stm32f469 discovery board.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index e911af8..c43a484 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -66,6 +66,10 @@
 	};
 };
 
+&rcc {
+	compatible = "st,stm32f469-rcc", "st,stm32f42xx-rcc", "st,stm32-rcc";
+};
+
 &clk_hse {
 	clock-frequency = <8000000>;
 };
-- 
1.9.1
