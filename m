Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96B7C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9304120714
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwm4vltx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgG1Czp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 22:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgG1Czo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 22:55:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D643AC061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id il6so4878856pjb.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Ckk/6ewdW9qSUoP0eBZAL2Xbg3NR5wTYMI4LU5aFt4=;
        b=qwm4vltxppZrjcwHre2u8XPw/2x/A/ajhqryA4wKKE4Jxxl4xtOYU/PcilF6+6a1KS
         kQCe3XGO262TWK2MeJaZdKb5NupNdxV9cG+MHUl0Zv948QCe0yd1AK2rk5zrr0AVz39D
         NYNrXYrLZhzhlDzIscWny3RogwmmAmYeinlHjxO5sPpeLHq1FW/ZmzUo7BuJsfj/w2dP
         fKO9cFbVZ3RtnJT85YiHMjnTTBJd+WJ/tdS07odx6JEbtNeU7X0xCTw+j8uuxtJQuORy
         Tiirqcw3lmPkOtES+yzq1Wpo5mLmiJ+cV23g2agFR+BT+lr6B1llmXpcJNrzGO+yTWSp
         mfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6Ckk/6ewdW9qSUoP0eBZAL2Xbg3NR5wTYMI4LU5aFt4=;
        b=njN3piICTUdKoaoIqcnhaho1CMlswLB+I2nI0OxiRjaLSOeO4qGZAYgEM//uoTbWX+
         bkCA8fm6y0JZRCmx4Ff/FXfAXQebiDZ8l7jMRAO50ax3aPqhVr5E9rBW1RfIgbbKsD+y
         F1V0l9mKawxe8S1xfe9chUvmjJlYavHYNNcUCmrtMshsarKxuEaSTZDdFVnt40QOMQE4
         gKUMhXpwoh7qn6N12fp3frP/atPcvnR5FePwf+4FCkwPtQZ/YOm0JWKG4nc8/+Ev3IvN
         sT+j/8bIZiIwivhMV9LedRPhxguRHXW+i+Ro19jbMkVW7IeoV65natrCD34+MmpfkimK
         0mLQ==
X-Gm-Message-State: AOAM531QcDl9xp5Bk+c9FJMmCY6TnfBYmFxoaxriYk3yJRpIbZny3Ptl
        RDS0B41Otz3jSJ1lukqZvkI=
X-Google-Smtp-Source: ABdhPJzbnK5XuiLz1+hp6r9eBmGOKwKaPDwfwg8x6ABvtWcdMwkEo8lIUImCsZ/cWAs1/wr4FcDBpw==
X-Received: by 2002:a17:902:6b0c:: with SMTP id o12mr21979221plk.321.1595904944347;
        Mon, 27 Jul 2020 19:55:44 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id w9sm15147407pfq.178.2020.07.27.19.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:55:43 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     linux-fsi@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/5] fsi: aspeed: Support cabled FSI
Date:   Tue, 28 Jul 2020 12:25:24 +0930
Message-Id: <20200728025527.174503-3-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728025527.174503-1-joel@jms.id.au>
References: <20200728025527.174503-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some FSI capable systems have internal FSI signals, and some have
external cabled FSI. Software can detect which machine this is by
reading a jumper GPIO, and also control which pins the signals are
routed to through a mux GPIO.

This attempts to find the GPIOs at probe time. If they are not present
in the device tree the driver will not error and continue as before.

The mux GPIO is owned by the FSI driver to ensure it is not modified at
runtime. The routing jumper obtained as non-exclusive to allow other
software to inspect it's state.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 46 +++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 2b8ca72baeb5..c282de76e6e7 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/iopoll.h>
+#include <linux/gpio/consumer.h>
 
 #include "fsi-master.h"
 
@@ -417,6 +418,45 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static int tacoma_cabled_fsi_fixup(struct device *dev)
+{
+	struct gpio_desc *routing_gpio, *mux_gpio;
+	int gpio;
+
+	/*
+	 * The routing GPIO is a jumper indicating we should mux for the
+	 * externally connected FSI cable.
+	 */
+	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
+			GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(routing_gpio))
+		return PTR_ERR(routing_gpio);
+	if (!routing_gpio)
+		return 0;
+
+	mux_gpio = devm_gpiod_get_optional(dev, "fsi-mux", GPIOD_ASIS);
+	if (IS_ERR(mux_gpio))
+		return PTR_ERR(mux_gpio);
+	if (!mux_gpio)
+		return 0;
+
+	gpio = gpiod_get_value(routing_gpio);
+	if (gpio < 0)
+		return gpio;
+
+	/* If the routing GPIO is high we should set the mux to low. */
+	if (gpio) {
+		gpiod_direction_output(mux_gpio, 0);
+		dev_info(dev, "FSI configured for external cable\n");
+	} else {
+		gpiod_direction_output(mux_gpio, 1);
+	}
+
+	devm_gpiod_put(dev, routing_gpio);
+
+	return 0;
+}
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -424,6 +464,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	int rc, links, reg;
 	__be32 raw;
 
+	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
+	if (rc) {
+		dev_err(&pdev->dev, "Tacoma FSI cable fixup failed\n");
+		return rc;
+	}
+
 	aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
 	if (!aspeed)
 		return -ENOMEM;
-- 
2.27.0

