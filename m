From: takasi-y@ops.dti.ne.jp
Subject: [PATCH v2 3/3] ARM: shmobile: kzm9d: Use common clock framework
Date: Tue, 8 Oct 2013 14:34:03 +0900
Message-ID: <20131008143403.c11f294c8a1701a2ab3bc5fd@ops.dti.ne.jp>
References: <20131008143040.52f36df8edb7ab63224d8433@ops.dti.ne.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20131008143040.52f36df8edb7ab63224d8433@ops.dti.ne.jp>
Sender: linux-sh-owner@vger.kernel.org
To: SH-Linux <linux-sh@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, ben.dooks@codethink.co.uk, Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>, Mike Turquette <mturquette@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use common clock framework version of clock
 drivers/clk/shmobile/clk-emev2.c
instead of sh-clkfwk version
 arch/arm/mach-shmobile/clock-emev2.c
when it is configured as a part of multi-platform.

Signed-off-by: Takashi Yoshii <takasi-y@ops.dti.ne.jp>
---
 arch/arm/mach-shmobile/board-kzm9d-reference.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-shmobile/board-kzm9d-reference.c b/arch/arm/mach-shmobile/board-kzm9d-reference.c
index 054d8d5..853003c 100644
--- a/arch/arm/mach-shmobile/board-kzm9d-reference.c
+++ b/arch/arm/mach-shmobile/board-kzm9d-reference.c
@@ -20,15 +20,14 @@
 
 #include <linux/init.h>
 #include <linux/of_platform.h>
+#include <linux/clk-provider.h>
 #include <mach/emev2.h>
 #include <mach/common.h>
 #include <asm/mach/arch.h>
 
 static void __init kzm9d_add_standard_devices(void)
 {
-	if (!IS_ENABLED(CONFIG_COMMON_CLK))
-		emev2_clock_init();
-
+	of_clk_init(NULL);
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
 
-- 
1.8.1.5
