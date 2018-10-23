From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 2/4] arm64: defconfig: Enable DRM_SUN8I_MIXER
Date: Tue, 23 Oct 2018 21:27:25 +0530
Message-ID: <20181023155727.9383-2-jagan@amarulasolutions.com>
References: <20181023155727.9383-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023155727.9383-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Allwinner Display Engine 2.0 Mixer is need for ARM64
Allwinner SoC's, build it as module.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- Enable it on defconfig 
Changes for v4, v3:
- none
Changes for v2:
- Enable for SUN8I

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4b3844480a77..7f271178d421 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -446,6 +446,7 @@ CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_EXYNOS_MIC=y
 CONFIG_DRM_ROCKCHIP=m
 CONFIG_DRM_SUN4I=m
+CONFIG_DRM_SUN8I_MIXER=m
 CONFIG_ROCKCHIP_ANALOGIX_DP=y
 CONFIG_ROCKCHIP_CDN_DP=y
 CONFIG_ROCKCHIP_DW_HDMI=y
-- 
2.18.0.321.gffc6fa0e3
