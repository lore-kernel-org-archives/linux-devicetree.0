From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 17/17] ARM: at91: add new compatible strings for pmc driver
Date: Wed, 13 Nov 2013 08:18:55 +0100
Message-ID: <1384327135-7262-1-git-send-email-b.brezillon@overkiz.com>
References: <1384289513-3068-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384289513-3068-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds new compatible string for PMC node to prepare the
transition to common clk.

These compatible string come from pmc driver in clk subsystem and are
needed to provide new device tree compatibility with old at91 clks
(device tree using common clks will use the new compatible strings).

Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-at91/clock.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-at91/clock.c b/arch/arm/mach-at91/clock.c
index 5f02aea..72b2579 100644
--- a/arch/arm/mach-at91/clock.c
+++ b/arch/arm/mach-at91/clock.c
@@ -884,6 +884,11 @@ static int __init at91_pmc_init(unsigned long main_clock)
 #if defined(CONFIG_OF)
 static struct of_device_id pmc_ids[] = {
 	{ .compatible = "atmel,at91rm9200-pmc" },
+	{ .compatible = "atmel,at91sam9260-pmc" },
+	{ .compatible = "atmel,at91sam9g45-pmc" },
+	{ .compatible = "atmel,at91sam9n12-pmc" },
+	{ .compatible = "atmel,at91sam9x5-pmc" },
+	{ .compatible = "atmel,sama5d3-pmc" },
 	{ /*sentinel*/ }
 };
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
