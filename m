Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A68DC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 12:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF52F2083B
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 12:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coX3lDQh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgEGMXZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 08:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727096AbgEGMXX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 08:23:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C0EC05BD0C
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 05:23:22 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x4so6285224wmj.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=js2krj0RD3hheEAL8cEfa5AyUl6zi0N+wYVVoWFXilU=;
        b=coX3lDQhoiVcmqCufwxRJFR3NjAPEGH0QUsc9BHbtnYuDYAuLvTLxr0YOckuFoNb7v
         35jokTarqofjAL3txGkkqvMZF3vNo4G0u7efJqy9Y1pnS66YOVSLWrt6IuSYNYzRPyrp
         AlIT+KfReY3LKpelz3IBfQjruAr5XEaRDetgT1Nrn/xtHLNlkqv6RE0QEAIlFU4wWyv+
         VEoUUlCkUZ2JKYaSIedjEjVQO2ejeJ4w6XYe6uW1EUMzKjJaO1JtXNWnn4m6koCVsIEY
         6G20LE29aCBSg2u8Jp6+umXE2ph1Ui21SToAqkAkEb8oBp0aY5QcRTkCCninELhLUXPf
         Qt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=js2krj0RD3hheEAL8cEfa5AyUl6zi0N+wYVVoWFXilU=;
        b=IWXSgwKwhhTXqOKpdDY0qTZZU1k4JRfc7lCdMc2vewMupLqESH0rLE0k2szb/ntuQG
         zkDZIRVThQaAQdL71ehKWw5Afiel0qsWSIkiUBvPlMlwQO2ThKWMmDmuv52yuNk2AU+M
         kizFEcrxsp2766eQlDpqLSl2+ziBilo46Vh1hvp4wfMGFyhazbXBgvgmyCUzHuaSaoju
         09hcmD2sjUWDjaC/uHeCMGWPd3MuLlK4y02fZ9TsM1he5NLIGVWsrNYlpz1PUVewx5az
         i5LLy8YoQi5lU8Fc32cyB9LWlATCNxdEvCdVGZ77Q4kVoXLNEv+ozaIXvEXPtckuKSXV
         j/XQ==
X-Gm-Message-State: AGi0PuZN198JJRL4+cJl1a6Bodwe9766lvUb+FasRGJeK4s1FDu9YRvq
        +pbTMlibE62Ykk9B6mr/deT9Ow==
X-Google-Smtp-Source: APiQypKUssr+tZ7ONvwALRESmstwlo4sXONYM0CoLMz4PdmEGwytmWK3dIclCWwC8C5V8ol/fEYJtA==
X-Received: by 2002:a05:600c:4013:: with SMTP id i19mr3094203wmm.71.1588854201286;
        Thu, 07 May 2020 05:23:21 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p7sm8202936wrf.31.2020.05.07.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 05:23:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/2] usb: typec: tps6598x: Add OF probe binding
Date:   Thu,  7 May 2020 13:23:52 +0100
Message-Id: <20200507122352.1773661-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507122352.1773661-1-bryan.odonoghue@linaro.org>
References: <20200507122352.1773661-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds a MODULE_DEVICE_TABLE() to allow probing of this driver from a DTS
setting.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gustavo A. R. Silva <garsilva@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/tps6598x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 0698addd1185..61c6761072c9 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -563,6 +563,14 @@ static int tps6598x_remove(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id tps6598x_of_match[] = {
+	{ .compatible = "ti,tps6598x", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tps6598x_of_match);
+#endif
+
 static const struct i2c_device_id tps6598x_id[] = {
 	{ "tps6598x" },
 	{ }
@@ -572,6 +580,7 @@ MODULE_DEVICE_TABLE(i2c, tps6598x_id);
 static struct i2c_driver tps6598x_i2c_driver = {
 	.driver = {
 		.name = "tps6598x",
+		.of_match_table = of_match_ptr(tps6598x_of_match),
 	},
 	.probe_new = tps6598x_probe,
 	.remove = tps6598x_remove,
-- 
2.25.1

