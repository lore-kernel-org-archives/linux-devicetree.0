From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 3/7] rtc: isl12057: deprecate use of isl in compatible string for isil
Date: Tue, 16 Dec 2014 01:23:18 +0100
Message-ID: <4541d90a3f81ad51fdc42b13f6e9b1611ef73206.1418688042.git.arno@natisbad.org>
References: <cover.1418688042.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1418688042.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.o>
List-Id: devicetree@vger.kernel.org


"isil" and "isl" prefixes are used at various locations inside the kernel
to reference Intersil corporation. This patch is part of a series fixing
those locations were "isl" is used in compatible strings to use the now
expected "isil" prefix instead (NASDAQ symbol for Intersil and most used
version). The old compatible string is kept for backward compatibility.

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 drivers/rtc/rtc-isl12057.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index bd76c5e35fa5..cd6d8cc8c2c9 100644
--- a/drivers/rtc/rtc-isl12057.c
+++ b/drivers/rtc/rtc-isl12057.c
@@ -644,7 +644,8 @@ static SIMPLE_DEV_PM_OPS(isl12057_rtc_pm_ops, isl12057_rtc_suspend,
 
 #ifdef CONFIG_OF
 static const struct of_device_id isl12057_dt_match[] = {
-	{ .compatible = "isl,isl12057" },
+	{ .compatible = "isl,isl12057" }, /* for backward compat., don't use */
+	{ .compatible = "isil,isl12057" },
 	{ },
 };
 #endif
-- 
2.1.1


