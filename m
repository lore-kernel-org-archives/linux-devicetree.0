From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH RESEND 15/18] AT91: Remove poweroff code
Date: Thu,  3 Jul 2014 16:41:30 +0200
Message-ID: <1404398493-28907-16-git-send-email-maxime.ripard@free-electrons.com>
References: <1404398493-28907-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404398493-28907-1-git-send-email-maxime.ripard@free-electrons.com>
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

Now that all the SoC have been converted to use the new poweroff driver, we can
remove the poweroff code defined in mach-at91.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/mach-at91/setup.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-at91/setup.c b/arch/arm/mach-at91/setup.c
index ae269291d19d..cdd717a4fa30 100644
--- a/arch/arm/mach-at91/setup.c
+++ b/arch/arm/mach-at91/setup.c
@@ -321,17 +321,11 @@ void __init at91_map_io(void)
 
 void __iomem *at91_shdwc_base = NULL;
 
-static void at91sam9_poweroff(void)
-{
-	at91_shdwc_write(AT91_SHDW_CR, AT91_SHDW_KEY | AT91_SHDW_SHDW);
-}
-
 void __init at91_ioremap_shdwc(u32 base_addr)
 {
 	at91_shdwc_base = ioremap(base_addr, 16);
 	if (!at91_shdwc_base)
 		panic(pr_fmt("Impossible to ioremap at91_shdwc_base\n"));
-	pm_power_off = at91sam9_poweroff;
 }
 
 void __iomem *at91_rstc_base;
-- 
2.0.1
