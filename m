From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 4/4] ARM: dts: stm32: fix regulator-sd_switch node on stm32mp157c-ed1 board
Date: Mon, 7 Oct 2019 16:34:02 +0200
Message-ID: <20191007143402.13266-5-alexandre.torgue@st.com>
References: <20191007143402.13266-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007143402.13266-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit fixes regulator-sd_switch node in order to be compliant to
DT validation schema.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 1d426ea8bdaf..329853d9b1de 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -100,7 +100,8 @@
 
 		gpios = <&gpiof 14 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
-		states = <1800000 0x1 2900000 0x0>;
+		states = <1800000 0x1>,
+			 <2900000 0x0>;
 	};
 };
 
-- 
2.17.1
