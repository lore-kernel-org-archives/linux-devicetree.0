From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 3/4] ARM: multi_v7_defconfig: enable STM32 booster regulator
Date: Mon, 1 Jul 2019 10:14:24 +0200
Message-ID: <1561968865-22037-4-git-send-email-fabrice.gasnier@st.com>
References: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561968865-22037-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This enables the driver for STM32 booster regulator found on stm32mp1.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6b748f2..230e7e0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -568,6 +568,7 @@ CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_RN5T618=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
+CONFIG_REGULATOR_STM32_BOOSTER=m
 CONFIG_REGULATOR_STM32_VREFBUF=m
 CONFIG_REGULATOR_STPMIC1=y
 CONFIG_REGULATOR_TI_ABB=y
-- 
2.7.4
