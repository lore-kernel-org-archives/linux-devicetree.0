From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 09/13] arm64: sunxi: Kconfig: add essential pinctrl driver
Date: Tue, 26 Jul 2016 22:30:37 +0200
Message-ID: <20160726203041.29366-10-maxime.ripard@free-electrons.com>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

From: Andre Przywara <andre.przywara@arm.com>

The pinctrl driver is essential for the Allwinner SoCs to work.
Add the driver's config symbol to the Kconfig entry to always compile
it in. We can't use the arm approach to make the _driver's_ Kconfig
symbol def_bool, because we lack the MACH_* symbols in arm64.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 7ef1d05859ae..4cc444c3c2e9 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -3,6 +3,7 @@ menu "Platform selection"
 config ARCH_SUNXI
 	bool "Allwinner sunxi 64-bit SoC Family"
 	select GENERIC_IRQ_CHIP
+	select PINCTRL_SUN50I_A64
 	help
 	  This enables support for Allwinner sunxi based SoCs like the A64.
 
-- 
2.9.2
