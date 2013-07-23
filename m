From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 24/28] ARM: kirkwood: Split DT and legacy MBus
 initialization
Date: Tue, 23 Jul 2013 10:31:28 -0300
Message-ID: <1374586292-4941-25-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This commit replaces the legacy MBus initialization with the new
DT-based in Kirkwood. For boards that are not yet converted to DT,
we keep the legacy initialization.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/mach-kirkwood/board-dt.c | 1 +
 arch/arm/mach-kirkwood/common.c   | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index 6e122ed..682b7ac 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -87,6 +87,7 @@ static void __init kirkwood_dt_init(void)
 	 */
 	writel(readl(CPU_CONFIG) & ~CPU_CONFIG_ERROR_PROP, CPU_CONFIG);
 
+	BUG_ON(mvebu_mbus_dt_init());
 	kirkwood_setup_wins();
 
 	kirkwood_l2_init();
diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
index 165e751..15b7e72 100644
--- a/arch/arm/mach-kirkwood/common.c
+++ b/arch/arm/mach-kirkwood/common.c
@@ -534,10 +534,6 @@ void __init kirkwood_cpuidle_init(void)
 void __init kirkwood_init_early(void)
 {
 	orion_time_set_base(TIMER_VIRT_BASE);
-
-	mvebu_mbus_init("marvell,kirkwood-mbus",
-			BRIDGE_WINS_BASE, BRIDGE_WINS_SZ,
-			DDR_WINDOW_CPU_BASE, DDR_WINDOW_CPU_SZ);
 }
 
 int kirkwood_tclk;
@@ -713,6 +709,10 @@ void __init kirkwood_init(void)
 	 */
 	writel(readl(CPU_CONFIG) & ~CPU_CONFIG_ERROR_PROP, CPU_CONFIG);
 
+	BUG_ON(mvebu_mbus_init("marvell,kirkwood-mbus",
+			BRIDGE_WINS_BASE, BRIDGE_WINS_SZ,
+			DDR_WINDOW_CPU_BASE, DDR_WINDOW_CPU_SZ));
+
 	kirkwood_setup_wins();
 
 	kirkwood_l2_init();
-- 
1.8.1.5
