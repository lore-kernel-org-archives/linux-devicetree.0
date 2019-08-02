From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 44/76] arm64: dts: imx8mm: Correct SAI3 RXC/TXFS pin's mux option #1
Date: Fri,  2 Aug 2019 09:19:18 -0400
Message-ID: <20190802131951.11600-44-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Anson Huang <Anson.Huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

[ Upstream commit 52d09014bb104a9157c0f5530700291052d2955c ]

According to i.MX8MM reference manual Rev.1, 03/2019:

SAI3_RXC pin's mux option #1 should be GPT1_CLK, NOT GPT1_CAPTURE2;
SAI3_TXFS pin's mux option #1 should be GPT1_CAPTURE2, NOT GPT1_CLK.

Fixes: c1c9d41319c3 ("dt-bindings: imx: Add pinctrl binding doc for imx8mm")
Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
index e25f7fcd79975..cffa8991880d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
@@ -462,7 +462,7 @@
 #define MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28                                   0x1CC 0x434 0x000 0x5 0x0
 #define MX8MM_IOMUXC_SAI3_RXFS_TPSMP_HTRANS0                                0x1CC 0x434 0x000 0x7 0x0
 #define MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK                                  0x1D0 0x438 0x000 0x0 0x0
-#define MX8MM_IOMUXC_SAI3_RXC_GPT1_CAPTURE2                                 0x1D0 0x438 0x000 0x1 0x0
+#define MX8MM_IOMUXC_SAI3_RXC_GPT1_CLK                                      0x1D0 0x438 0x000 0x1 0x0
 #define MX8MM_IOMUXC_SAI3_RXC_SAI5_RX_BCLK                                  0x1D0 0x438 0x4D0 0x2 0x2
 #define MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29                                    0x1D0 0x438 0x000 0x5 0x0
 #define MX8MM_IOMUXC_SAI3_RXC_TPSMP_HTRANS1                                 0x1D0 0x438 0x000 0x7 0x0
@@ -472,7 +472,7 @@
 #define MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30                                    0x1D4 0x43C 0x000 0x5 0x0
 #define MX8MM_IOMUXC_SAI3_RXD_TPSMP_HDATA0                                  0x1D4 0x43C 0x000 0x7 0x0
 #define MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC                                 0x1D8 0x440 0x000 0x0 0x0
-#define MX8MM_IOMUXC_SAI3_TXFS_GPT1_CLK                                     0x1D8 0x440 0x000 0x1 0x0
+#define MX8MM_IOMUXC_SAI3_TXFS_GPT1_CAPTURE2                                0x1D8 0x440 0x000 0x1 0x0
 #define MX8MM_IOMUXC_SAI3_TXFS_SAI5_RX_DATA1                                0x1D8 0x440 0x4D8 0x2 0x2
 #define MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31                                   0x1D8 0x440 0x000 0x5 0x0
 #define MX8MM_IOMUXC_SAI3_TXFS_TPSMP_HDATA1                                 0x1D8 0x440 0x000 0x7 0x0
-- 
2.20.1
