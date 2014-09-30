From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 3/6] hwrng: atmel: add DT support
Date: Tue, 30 Sep 2014 18:19:44 +0200
Message-ID: <1412093987-30241-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Peter Korsgaard <jacmet@sunsite.dk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add DT support.

Make the driver depend on CONFIG_OF as at91sam9g45 was the only SoC making
use of the TRNG block and this SoC is now fully migrated to DT.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/char/hw_random/Kconfig     | 2 +-
 drivers/char/hw_random/atmel-rng.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 836b061..a0f5500 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -64,7 +64,7 @@ config HW_RANDOM_AMD
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on ARCH_AT91 && HAVE_CLK
+	depends on ARCH_AT91 && HAVE_CLK && OF
 	default HW_RANDOM
 	---help---
 	  This driver provides kernel-side support for the Random Number
diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 644ec48..0bb0b21 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -123,6 +123,12 @@ static const struct dev_pm_ops atmel_trng_pm_ops = {
 };
 #endif /* CONFIG_PM */
 
+static const struct of_device_id atmel_trng_dt_ids[] = {
+	{ .compatible = "atmel,at91sam9g45-trng" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, atmel_trng_dt_ids);
+
 static struct platform_driver atmel_trng_driver = {
 	.probe		= atmel_trng_probe,
 	.remove		= atmel_trng_remove,
@@ -132,6 +138,7 @@ static struct platform_driver atmel_trng_driver = {
 #ifdef CONFIG_PM
 		.pm	= &atmel_trng_pm_ops,
 #endif /* CONFIG_PM */
+		.of_match_table = atmel_trng_dt_ids,
 	},
 };
 
-- 
1.9.1
