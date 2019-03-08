From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH  2/2] ARM: dts: stm32: add jedec compatible for nor flash on stm32mp157c-ev1
Date: Fri, 8 Mar 2019 16:10:23 +0100
Message-ID: <1552057823-10876-3-git-send-email-ludovic.Barre@st.com>
References: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch adds jedec compatible for spi-nor flash
on stm32mp157c-ev1 (needed with new spi-mem interface).

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 7fef155..cae88d9 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -140,6 +140,7 @@
 	status = "okay";
 
 	flash0: mx66l51235l@0 {
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>;
@@ -148,6 +149,7 @@
 	};
 
 	flash1: mx66l51235l@1 {
+		compatible = "jedec,spi-nor";
 		reg = <1>;
 		spi-rx-bus-width = <4>;
 		spi-max-frequency = <108000000>;
-- 
2.7.4
