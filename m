From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: enable IPCC mailbox support on STM32MP157a-dk1
Date: Fri, 1 Mar 2019 10:18:39 +0100
Message-ID: <1551431919-23410-4-git-send-email-fabien.dessenne@st.com>
References: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Fabien Dessenne <fabien.dessenne@st.com>
List-Id: devicetree@vger.kernel.org

Enable STM32 IPCC mailbox driver for STM32MP157a-dk1 board.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index b229ab1..85a761a 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -65,6 +65,10 @@
 	};
 };
 
+&ipcc {
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
-- 
2.7.4
