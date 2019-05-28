From: Anson.Huang@nxp.com
Subject: [PATCH V13 4/5] defconfig: arm64: add i.MX system controller thermal support
Date: Tue, 28 May 2019 11:16:53 +0800
Message-ID: <20190528031654.43801-4-Anson.Huang@nxp.com>
References: <20190528031654.43801-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528031654.43801-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, aisheng.dong@nxp.com, ulf.hansson@linaro.org, peng.fan@nxp.com, daniel.baluta@nxp.com, maxime.ripard@bootlin.com, olof@lixom.net, jagan@amarulasolutions.com, horms+renesas@verge.net.au, leonard.crestez@nxp.com, bjorn.andersson@linaro.org, dinguyen@kernel.org, enric.balletbo@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

This patch enables CONFIG_IMX_SC_THERMAL as module.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change, just rebase the patch to top of linux-next and based on below my patch:
https://patchwork.kernel.org/patch/10959025/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fa1ea8f..c33bf882 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -422,6 +422,7 @@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_QORIQ_THERMAL=m
+CONFIG_IMX_SC_THERMAL=m
 CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
-- 
2.7.4
