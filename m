From: Valentin Longchamp <valentin.longchamp@keymile.com>
Subject: [PATCH 2/3] ARM: kirkwood: look for alternative gate ctrl of node
Date: Tue,  7 May 2013 17:52:20 +0200
Message-ID: <1367941941-19152-3-git-send-email-valentin.longchamp@keymile.com>
References: <1367941941-19152-1-git-send-email-valentin.longchamp@keymile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1367941941-19152-1-git-send-email-valentin.longchamp@keymile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, jason@lakedaemon.net
Cc: gregory.clement@free-electrons.com, Valentin Longchamp <valentin.longchamp@keymile.com>, devicetree-discuss@lists.ozlabs.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

The search for the gate ctrl of node must now also look for the
introduced compatible node.

Signed-off-by: Valentin Longchamp <valentin.longchamp@keymile.com>
---
 arch/arm/mach-kirkwood/board-dt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index 7904758..3e607c9 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -44,6 +44,10 @@ static void __init kirkwood_legacy_clk_init(void)
 	struct of_phandle_args clkspec;
 	struct clk *clk;
 
+	if (np == NULL)
+		np = of_find_compatible_node(NULL, NULL,
+			"marvell,prestera-kw-gating-clock");
+
 	clkspec.np = np;
 	clkspec.args_count = 1;
 
-- 
1.8.0.1
