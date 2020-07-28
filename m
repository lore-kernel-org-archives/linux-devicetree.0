Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72F8C433EA
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 915A620714
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUASXs1v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgG1Cz5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 22:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgG1Cz4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 22:55:56 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A2AC061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:56 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 72so9155058ple.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xHSue0CpQdznRDxP9HpcUml2ldWS2kI8QAiHMjwZsXk=;
        b=IUASXs1vJ1qA+xjSALYyZt+BdzR4rFVXPkh++rAUOBtW4OALDpHw7FcO3xHVgYiCZi
         /YC0T0Q0QLAJEIuYlDEdC1B/0lHyq08IcxsTpffEYRgOHUp9eokDwJOdobX6OdNzBHWC
         gGcYXpgJsy8sknso3kDuoeJs6DXH8C14Ig2m2/U9A0WirUen7R0UEmzCcRSwFy9C3O6y
         uT1Psxj5VOB05ySDtvIJD0K7WY0C16kRQvrosHcpWR9tO52rvSAp66ctAIUgqGXmj6ld
         TjtuqaiXR2CRNGWf58N1Bkqc8KG77MsTq5894zZ+AanQ/gD0JZ1MuBQZexHCIGFfiDy9
         xipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=xHSue0CpQdznRDxP9HpcUml2ldWS2kI8QAiHMjwZsXk=;
        b=Oujazh1Np2KovBz4en5Vy5N456r0Y4VDOJOjcNUxv0fkqU5LsOUu3uapj/60EKLotj
         r85fStYDuooqs80oiDCuxKgS1t/aAS++J43P6mQjfzsiWbksd1AiyobDKuC28EQ2qW66
         guWei+1vt/9jNK1eBTphg4IsFXwWqxlw+/ietBbc2jicoVOxjJ6l+5jPTqNivbTrAinq
         Zm9CIMXhMVP4WAijdkjMdv98F4QobwppUi7sPvkQajEErY7H8UOgs3L7/xox6CKNde+1
         8qhfdsuRZCAxM3Ius9BlJ5nWpw7zMXifWZ7mCkTHoZO1B/T36MAtv4unk2SXZqJNoXBt
         oqcQ==
X-Gm-Message-State: AOAM531BD+nZnkmd6um5VOKD8ZA7ldbt6CsvWOI8BADn6lNbTP42EWIm
        5ETKn2lRiCrSPdds9IzxiHI=
X-Google-Smtp-Source: ABdhPJwjK0HYoPAp5SbegcVvL9vysGStO3XCD+1r9RziUs8rO+gT/2vi8u418QOHBxw3jN5+WNU4uQ==
X-Received: by 2002:a17:902:d704:: with SMTP id w4mr21994938ply.278.1595904956348;
        Mon, 27 Jul 2020 19:55:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id w9sm15147407pfq.178.2020.07.27.19.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:55:55 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     linux-fsi@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 5/5] fsi: aspeed: Support CFAM reset GPIO
Date:   Tue, 28 Jul 2020 12:25:27 +0930
Message-Id: <20200728025527.174503-6-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728025527.174503-1-joel@jms.id.au>
References: <20200728025527.174503-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Systems have a line for restting the remote CFAM. This is not part of
the FSI master, but is associated with it, so it makes sense to include
it in the master driver.

This exposes a sysfs interface to reset the cfam, abstracting away the
direction and polarity of the GPIO, as well as the timing of the reset
pulse. Userspace will be blocked until the reset pulse is finished.

The reset is hard coded to be in the range of (900, 1000) us. It was
observed with a scope to regularly be just over 1ms.

If the device tree property is not preset the driver will silently
continue.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 2531e826ba8b..c006ec008a1a 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -22,6 +22,7 @@ struct fsi_master_aspeed {
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
+	struct gpio_desc	*cfam_reset_gpio;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -425,6 +426,43 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
+
+	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
+	usleep_range(900, 1000);
+	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
+
+	return count;
+}
+
+static DEVICE_ATTR(cfam_reset, 0200, NULL, cfam_reset_store);
+
+static int setup_cfam_reset(struct fsi_master_aspeed *aspeed)
+{
+	struct device *dev = aspeed->dev;
+	struct gpio_desc *gpio;
+	int rc;
+
+	gpio = devm_gpiod_get_optional(dev, "cfam-reset", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	if (!gpio)
+		return 0;
+
+	aspeed->cfam_reset_gpio = gpio;
+
+	rc = device_create_file(dev, &dev_attr_cfam_reset);
+	if (rc) {
+		devm_gpiod_put(dev, gpio);
+		return rc;
+	}
+
+	return 0;
+}
+
 static int tacoma_cabled_fsi_fixup(struct device *dev)
 {
 	struct gpio_desc *routing_gpio, *mux_gpio;
@@ -507,6 +545,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	rc = setup_cfam_reset(aspeed);
+	if (rc) {
+		dev_err(&pdev->dev, "CFAM reset GPIO setup failed\n");
+	}
+
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
 	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
 			aspeed->base + OPB_IRQ_MASK);
-- 
2.27.0

