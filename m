From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 3/3] ARM: multi_v7_defconfig: enable STM32 SPI
Date: Thu, 17 May 2018 16:21:44 +0200
Message-ID: <1526566904-24514-4-git-send-email-amelie.delaunay@st.com>
References: <1526566904-24514-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526566904-24514-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

Enable the STM32 SPI driver, implemented on STM32MP1 SoC.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 89167cd..f990335 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -411,6 +411,7 @@ CONFIG_SPI_S3C64XX=m
 CONFIG_SPI_SH_MSIOF=m
 CONFIG_SPI_SH_HSPI=y
 CONFIG_SPI_SIRF=y
+CONFIG_SPI_STM32=y
 CONFIG_SPI_SUN4I=y
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA114=y
-- 
2.7.4
