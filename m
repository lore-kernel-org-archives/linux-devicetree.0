From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 1/4] clk: sunxi-ng: Enable DE2_CCU for SUN8I and SUN50I
Date: Tue, 13 Nov 2018 17:45:32 +0530
Message-ID: <20181113121535.24137-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Allwinner SoC like SUN8I and SUN50I has DE2 CCU so enable them
as default.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- droped "depends on" since the CCU select based on MACH defined. 
Changes for v5:
- remove DRM dependency
Changes for v4, v3:
- none
Changes for v2:
- Enable for MACH_SUN8I

 drivers/clk/sunxi-ng/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 826674d090fd..abbd518833b5 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -63,6 +63,7 @@ config SUN8I_V3S_CCU
 
 config SUN8I_DE2_CCU
 	bool "Support for the Allwinner SoCs DE2 CCU"
+	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
 
 config SUN8I_R40_CCU
 	bool "Support for the Allwinner R40 CCU"
-- 
2.18.0.321.gffc6fa0e3
