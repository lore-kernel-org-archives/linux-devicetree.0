From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/4] ARM: davinci: fix cpufreq registration on da850-evm
Date: Thu, 21 Mar 2019 15:10:07 +0100
Message-ID: <20190321141010.19612-2-brgl@bgdev.pl>
References: <20190321141010.19612-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321141010.19612-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The system_rev variable is never set on davinci and is always 0, so
we're using the default max operating point of 300MHz. The cvdd supply
is fixed at 1.2V however, so we can go up to 372MHz. Remove the switch
and always set da850_max_speed to 372000.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 1fdc9283a8c5..77d74fb311fa 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -1155,17 +1155,7 @@ static struct edma_rsv_info *da850_edma_rsv[2] = {
 #ifdef CONFIG_CPU_FREQ
 static __init int da850_evm_init_cpufreq(void)
 {
-	switch (system_rev & 0xF) {
-	case 3:
-		da850_max_speed = 456000;
-		break;
-	case 2:
-		da850_max_speed = 408000;
-		break;
-	case 1:
-		da850_max_speed = 372000;
-		break;
-	}
+	da850_max_speed = 372000;
 
 	return da850_register_cpufreq("pll0_sysclk3");
 }
-- 
2.20.1
