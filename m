From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 13/21] drm/sun4i: Enable DE2 Mixer for Allwinner 64-bit SoCs
Date: Mon, 30 Apr 2018 17:10:50 +0530
Message-ID: <20180430114058.5061-14-jagan@amarulasolutions.com>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180430114058.5061-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Allwinner 64-bit SoC like H5/A64 has DE2 Mixer so enable them
as default.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 60468a779a63..95ae04964756 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -52,7 +52,7 @@ config DRM_SUN8I_DW_HDMI
 
 config DRM_SUN8I_MIXER
 	tristate "Support for Allwinner Display Engine 2.0 Mixer"
-	default MACH_SUN8I
+	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
 	help
 	  Choose this option if you have an Allwinner SoC with the
 	  Allwinner Display Engine 2.0, which has a mixer to do some
-- 
2.14.3
