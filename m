From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v1 1/5] ARM: configs: multi_v7: Add I2C support
Date: Fri, 20 Apr 2018 11:17:50 +0200
Message-ID: <1524215874-15093-2-git-send-email-pierre-yves.mordret@st.com>
References: <1524215874-15093-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215874-15093-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Yangbo Lu <yangbo.lu@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds I2C F7 support to multi_v7_defconfig

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
     v1:
        * Initial
---
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e6b3c96..2a87784 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -385,6 +385,7 @@ CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_SIRF=y
 CONFIG_I2C_ST=y
+CONFIG_I2C_STM32F7=y
 CONFIG_I2C_SUN6I_P2WI=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER=y
-- 
2.7.4
