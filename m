From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/4] ARM: davinci: fix cpufreq registration on da850-evm
Date: Fri, 22 Mar 2019 14:31:02 +0100
Message-ID: <20190322133105.5945-2-brgl@bgdev.pl>
References: <20190322133105.5945-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190322133105.5945-1-brgl@bgdev.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The system_rev variable is never set on davinci and is always 0, so
we're using the default max operating point of 300MHz. The cvdd supply
comes from the tps6507 pmic and the voltage can go all the way to 1.3V
so the maximum supported rate should be 456MHz.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 1fdc9283a8c5..58b2a485b527 100644
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
+	da850_max_speed = 456000;
 
 	return da850_register_cpufreq("pll0_sysclk3");
 }
-- 
2.20.1
