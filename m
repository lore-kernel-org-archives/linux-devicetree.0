From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 3/3] nvmem: imx-ocotp: broaden Kconfig dependency
Date: Mon, 11 Feb 2019 17:50:11 +0100
Message-ID: <20190211165011.5114-3-l.stach@pengutronix.de>
References: <20190211165011.5114-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211165011.5114-1-l.stach@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>, linux-imx@nxp.com, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

The i.MX OCOTP controller is used in numerous Freescale/NXP
SoCs from the MXC family, so the strict dependency on the
i.MX6 SoC is too narrow. Broaden it to cover all the MXC
familiy members.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/nvmem/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 0a7a470ee859..665f2494095a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -25,8 +25,8 @@ config NVMEM_IMX_IIM
 	  will be called nvmem-imx-iim.
 
 config NVMEM_IMX_OCOTP
-	tristate "i.MX6 On-Chip OTP Controller support"
-	depends on SOC_IMX6 || COMPILE_TEST
+	tristate "i.MX 6/7/8 On-Chip OTP Controller support"
+	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This is a driver for the On-Chip OTP Controller (OCOTP) available on
-- 
2.20.1
