From: Bich HEMON <bich.hemon@st.com>
Subject: [PATCH 3/3] ARM: dts: stm32: add can1 sleep pins muxing on
 stm32mp157c-ev1 board
Date: Thu, 15 Nov 2018 08:52:29 +0000
Message-ID: <1542271942-28130-4-git-send-email-bich.hemon@st.com>
References: <1542271942-28130-1-git-send-email-bich.hemon@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542271942-28130-1-git-send-email-bich.hemon@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Add pinctrl sleep state for can1 on stm32mp157c-ev1.

Signed-off-by: Bich Hemon <bich.hemon@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 063ee8a..fdc4c92 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -124,8 +124,9 @@
 };
 
 &m_can1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
 	status = "okay";
 };
 
-- 
1.9.1
