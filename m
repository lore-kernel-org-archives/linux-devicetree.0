From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v8 2/9] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Fri, 10 May 2019 22:15:29 +1200
Message-ID: <20190510101536.6724-3-chris.packham@alliedtelesis.co.nz>
References: <20190510101536.6724-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190510101536.6724-1-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@armlinux.org.uk, bp@alien8.de, mark.rutland@arm.com, robh+dt@kernel.org, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de, gregory.clement@bootlin.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jan Luebbe <jlu@pengutronix.de>

The macro name is too generic, so add a AURORA_ prefix.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/include/asm/hardware/cache-aurora-l2.h | 2 +-
 arch/arm/mm/cache-l2x0.c                        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/hardware/cache-aurora-l2.h b/arch/arm/include/asm/hardware/cache-aurora-l2.h
index c86124769831..dc5c479ec4c3 100644
--- a/arch/arm/include/asm/hardware/cache-aurora-l2.h
+++ b/arch/arm/include/asm/hardware/cache-aurora-l2.h
@@ -41,7 +41,7 @@
 #define AURORA_ACR_FORCE_WRITE_THRO_POLICY	\
 	(2 << AURORA_ACR_FORCE_WRITE_POLICY_OFFSET)
 
-#define MAX_RANGE_SIZE		1024
+#define AURORA_MAX_RANGE_SIZE	1024
 
 #define AURORA_WAY_SIZE_SHIFT	2
 
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index a00d6f7fd34c..7d2d2a3c67d0 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1364,8 +1364,8 @@ static unsigned long aurora_range_end(unsigned long start, unsigned long end)
 	 * since cache range operations stall the CPU pipeline
 	 * until completion.
 	 */
-	if (end > start + MAX_RANGE_SIZE)
-		end = start + MAX_RANGE_SIZE;
+	if (end > start + AURORA_MAX_RANGE_SIZE)
+		end = start + AURORA_MAX_RANGE_SIZE;
 
 	/*
 	 * Cache range operations can't straddle a page boundary.
-- 
2.21.0
