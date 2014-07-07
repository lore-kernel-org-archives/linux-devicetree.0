From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 04/18] AT91: Rework ramc mapping code
Date: Mon,  7 Jul 2014 16:25:17 +0200
Message-ID: <1404743131-24569-5-git-send-email-maxime.ripard@free-electrons.com>
References: <1404743131-24569-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404743131-24569-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@maxim.org.za, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, dwmw2@infradead.org, dbaryshkov@gmail.com
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas@free-electrons.com>, linux-kernel@vger.kernel.org, Boris Brezillon <boris@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Adapt the ramc mapping code to handle multiple ram controllers in the DT.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/mach-at91/setup.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
index 9c4c7fb323fb..cc520596f23b 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -393,24 +393,26 @@ static void at91_dt_ramc(void)
 {
 	struct device_node *np;
 	const struct of_device_id *of_id;
+	int idx = 0;
 
-	np = of_find_matching_node(NULL, ramc_ids);
-	if (!np)
-		panic(pr_fmt("unable to find compatible ram controller node in dtb\n"));
+	for_each_matching_node(np, ramc_ids) {
+		at91_ramc_base[idx] = of_iomap(np, 0);
+		if (!at91_ramc_base[idx])
+			panic(pr_fmt("unable to map ramc[%d] cpu registers\n"), idx);
 
-	at91_ramc_base[0] = of_iomap(np, 0);
-	if (!at91_ramc_base[0])
-		panic(pr_fmt("unable to map ramc[0] cpu registers\n"));
-	/* the controller may have 2 banks */
-	at91_ramc_base[1] = of_iomap(np, 1);
+		idx++;
+	}
+
+	if (!idx)
+		panic(pr_fmt("unable to find compatible ram controller node in dtb\n"));
 
 	of_id = of_match_node(ramc_ids, np);
-	if (!of_id)
+	if (!of_id) {
 		pr_warn("ramc no standby function available\n");
-	else
-		at91_pm_set_standby(of_id->data);
+		return;
+	}
 
-	of_node_put(np);
+	at91_pm_set_standby(of_id->data);
 }
 
 static struct of_device_id shdwc_ids[] = {
-- 
2.0.1
