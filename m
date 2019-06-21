From: Christophe Kerello <christophe.kerello@st.com>
Subject: [PATCH 4/4] ARM: multi_v7_defconfig: add FMC2 NAND  controller support
Date: Fri, 21 Jun 2019 16:49:50 +0200
Message-ID: <1561128590-14621-5-git-send-email-christophe.kerello@st.com>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds FMC2 NAND controller support used by STM32MP SOCs.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e386f35..092255c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -197,6 +197,7 @@ CONFIG_MTD_NAND_GPMI_NAND=y
 CONFIG_MTD_NAND_BRCMNAND=y
 CONFIG_MTD_NAND_VF610_NFC=y
 CONFIG_MTD_NAND_DAVINCI=y
+CONFIG_MTD_NAND_STM32_FMC2=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
-- 
1.9.1
