From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 4/5] ARM: dts: stm32: Add I2C4 support for STM32MP157C-ED1
Date: Fri, 20 Apr 2018 11:17:53 +0200
Message-ID: <1524215874-15093-5-git-send-email-pierre-yves.mordret@st.com>
References: <1524215874-15093-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215874-15093-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Yangbo Lu <yangbo.lu@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

Add I2C4 support for STM32MP157C evaluation daughter.
Required for PMIC.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
     v1:
        * Initial
---
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 9f90337a..490b712 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -25,6 +25,14 @@
 	};
 };
 
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
-- 
2.7.4
