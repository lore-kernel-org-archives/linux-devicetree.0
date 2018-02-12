From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v5 14/26] ARM: shmobile: defconfig: Enable RENESAS_WDT_GEN
Date: Mon, 12 Feb 2018 17:44:23 +0000
Message-ID: <1518457475-4480-15-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@iguana.be>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

R-Car Gen2 and RZ/G1 platforms come with a watchdog IP, therefore enable
its driver by default.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
* no change

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 578434c..d5cdad8 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -132,6 +132,7 @@ CONFIG_CPU_THERMAL=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_DA9063_WATCHDOG=y
+CONFIG_RENESAS_WDT=y
 CONFIG_MFD_AS3711=y
 CONFIG_MFD_DA9063=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-- 
2.7.4
