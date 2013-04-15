From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 1/2] ARM: DT: kernel: move temporary cpu map stack array
 to static data
Date: Mon, 15 Apr 2013 17:13:21 +0100
Message-ID: <1366042402-8987-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Simon Horman <horms@verge.net.au>, Bar
List-Id: devicetree@vger.kernel.org

As the number of CPUs increase, the temporary array allocated on the
stack in arm_dt_init_cpu_maps() can become too big and trigger stack
issues.
This patch moves the allocated memory to static __initdata so that stack
data is not used anymore to allocate the temporary array.
Memory is marked as __initdata since it need not be persistent after boot.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 arch/arm/kernel/devtree.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 70f1bde..f149217 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -78,11 +78,12 @@ void __init arm_dt_init_cpu_maps(void)
 	 * contain a list of MPIDR[23:0] values where MPIDR[31:24] must
 	 * read as 0.
 	 */
+	static u32 tmp_map[NR_CPUS] __initdata = {
+				[0 ... NR_CPUS-1] = UINT_MAX };
 	struct device_node *cpu, *cpus;
 	u32 i, j, cpuidx = 1;
 	u32 mpidr = is_smp() ? read_cpuid_mpidr() & MPIDR_HWID_BITMASK : 0;
 
-	u32 tmp_map[NR_CPUS] = { [0 ... NR_CPUS-1] = UINT_MAX };
 	bool bootcpu_valid = false;
 	cpus = of_find_node_by_path("/cpus");
 
-- 
1.7.12
