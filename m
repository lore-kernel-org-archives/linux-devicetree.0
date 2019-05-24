From: peng.fan@nxp.com
Subject: [PATCH V3 RESEND AGAIN 1/2] defconfig: arm64: enable i.MX8 SCU octop driver
Date: Fri, 24 May 2019 14:39:12 +0800
Message-ID: <20190524063913.44171-1-peng.fan@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, van.freenix@gmail.com, Peng Fan <peng.fan@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Andy Gross <andy.gross@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Jagan Teki <jagan@amarulasolutions.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
List-Id: devicetree@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Build in CONFIG_NVMEM_IMX_OCOTP_SCU.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V3:
 No change
V2:
 rename patch title, add review tag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 979a95c915b6..32b85102b857 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -748,6 +748,7 @@ CONFIG_HISI_PMU=y
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
 CONFIG_NVMEM_IMX_OCOTP=y
+CONFIG_NVMEM_IMX_OCOTP_SCU=y
 CONFIG_QCOM_QFPROM=y
 CONFIG_ROCKCHIP_EFUSE=y
 CONFIG_UNIPHIER_EFUSE=y
-- 
2.16.4
