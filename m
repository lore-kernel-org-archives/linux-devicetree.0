From: Pascal Paillet <p.paillet@st.com>
Subject: [PATCH 4/4] ARM: dts: stm32: disable active-discharge for vbus_otg on stm32mp157a-avenger96
Date: Fri, 11 Oct 2019 16:05:33 +0200
Message-ID: <20191011140533.32619-5-p.paillet@st.com>
References: <20191011140533.32619-1-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011140533.32619-1-p.paillet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: p.paillet@st.com
List-Id: devicetree@vger.kernel.org

Active discharge is not needed on vbus_otg and generate unneeded current
consumption.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index d1cc42a92d3f..628c74a45a25 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -252,7 +252,6 @@
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
 				interrupt-parent = <&pmic>;
-				regulator-active-discharge = <1>;
 			};
 
 			vbus_sw: pwr_sw2 {
-- 
2.17.1
