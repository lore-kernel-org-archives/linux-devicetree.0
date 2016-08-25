From: "Steven J. Hill" <steven.hill@cavium.com>
Subject: [PATCH] MIPS: Octeon: mark GPIO controller node not populated IRQ,
 init.
Date: Thu, 25 Aug 2016 16:22:26 -0500
Message-ID: <422712ab-4b0d-2b6d-4600-b917c2d327a9@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We clear the OF_POPULATED flag for the GPIO controller node, otherwise
the GPIO lines used by the MMC driver are never probed.

Fixes: 15cc2ed6dcf9 ("of/irq: Mark initialised interrupt controllers as populated")
Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
---
 arch/mips/cavium-octeon/octeon-irq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index 5a9b87b..41d12d4 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1619,6 +1619,13 @@ static int __init octeon_irq_init_gpio(
 		return -ENOMEM;
 	}
 
+	/*
+	 * Clear the OF_POPULATED flag that was set above for the
+	 * GPIO controller so that the lines used by the MMC driver
+	 * will not be skipped.
+	 */
+	of_node_clear_flag(gpio_node, OF_POPULATED);
+
 	return 0;
 }
 /*
-- 
1.9.1
