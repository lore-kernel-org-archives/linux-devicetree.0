From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 1/7] ARM: sunxi: Introduce Allwinner A80 support
Date: Wed, 24 Sep 2014 22:48:55 +0800
Message-ID: <1411570141-29960-2-git-send-email-wens@csie.org>
References: <1411570141-29960-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411570141-29960-1-git-send-email-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, ctl@merrii.com, Shuge <shuge@allwinnertech.com>, Meng Zhang <kevin@allwinnertech.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Allwinner A80 is a new Cortex octo-core A7/A15 big.LITTLE SoC.
While it's processor cores and interconnecting bus are new, it
re-uses many peripherals found in earlier Allwinner SoCs.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/mach-sunxi/Kconfig | 5 +++++
 arch/arm/mach-sunxi/sunxi.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 1aaa1e1..72f222b 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -42,4 +42,9 @@ config MACH_SUN8I
 	select MFD_SUN6I_PRCM
 	select RESET_CONTROLLER
 
+config MACH_SUN9I
+	bool "Allwinner A80 (sun9i) SoCs support"
+	default ARCH_SUNXI
+	select ARM_GIC
+
 endif
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 42d4753..4bd2117 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -139,3 +139,12 @@ static const char * const sun8i_board_dt_compat[] = {
 DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23) Family")
 	.dt_compat	= sun8i_board_dt_compat,
 MACHINE_END
+
+static const char * const sun9i_board_dt_compat[] = {
+	"allwinner,sun9i-a80",
+	NULL,
+};
+
+DT_MACHINE_START(SUN9I_DT, "Allwinner sun9i (A80) Family")
+	.dt_compat	= sun9i_board_dt_compat,
+MACHINE_END
-- 
2.1.0
