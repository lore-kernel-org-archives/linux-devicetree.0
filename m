Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:53683 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933291Ab3HNV11 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 17:27:27 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V6 5/5] gpio: implement gpio-ranges binding document fix
Date: Wed, 14 Aug 2013 15:27:12 -0600
Message-Id: <1376515632-12594-5-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
References: <1376515632-12594-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

Use the new of_parse_phandle_with_fixed_args() to implement the
corrected gpio-ranges DT property definition.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 drivers/gpio/gpiolib-of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 665f953..48cda3c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -194,8 +194,8 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		return;
 
 	for (;; index++) {
-		ret = of_parse_phandle_with_args(np, "gpio-ranges",
-				"#gpio-range-cells", index, &pinspec);
+		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
+				index, &pinspec);
 		if (ret)
 			break;
 
-- 
1.8.1.5

