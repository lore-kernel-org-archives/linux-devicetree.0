Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12E1C54E4A
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D7E0206D3
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRQiCfER"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbgELMyb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 08:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729983AbgELMyK (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 08:54:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED3CC061A0C
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 05:54:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j5so15247846wrq.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 05:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UrDz0VtEFIllRgR/SygMJHwSLsI5h5gjPBKpNjucqnU=;
        b=hRQiCfERNwcKeaXH+vBgWstpdhfVeFUqZ1HMM5gInNFUPCUmTIxlN+nW06ZqEyr1MT
         WJt82jfFMhSh3/RaGC13yJslFwkNU9IP5rTAXxevITstBNNe0Q0GqLiQ8X/4kMoTb5St
         9DB5LdqtelZUdP4aOiA8r4r6CKfpEsAkHPc+1ZB0OvODMQGzdCislqEz/wGa5WTmLoY2
         d/LAisGXl4ceWObzMaSX+TnByQmuW6rujCdNxrDyZktJU5cYwJDxyLT3uqKLbzHAA/zv
         4Q+Skz9YusrYZTS4w02hgcM5lS0pRpHRcUHCIILUcGrWW36OTz9Rc638ZOyVZKUaow2B
         luIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UrDz0VtEFIllRgR/SygMJHwSLsI5h5gjPBKpNjucqnU=;
        b=Qtvt8oH94RRvyoR9PpBuu7Ljf9SQpM7s7IDaclMBuC642kxogGWa1Z+GTylMLDo7u0
         uKGDs2VmbdmKGRA5HQvCY90c6dyIj64RrFv/RumcvpjDUuRa1rz7TkiQyOPh5gAX3//V
         lWRUF1cyEgkDEMpNaEeAobXPqLBL3k1WSAto1SmOKK4GJBsTiDZGf9A5SgepgaSWJG5I
         B2QAIoq4+fa0/n5OWu4wk43kPAsnATYd4Z3xU8YupeJ7qvxikwyUk9rOjx5MBPzDyaPI
         jnFA0BD1pkQHNJI5S3qXxMjfQQ/LfMPybc3f9b3nM6LEtdfDoNK76w+Fj8To1oWuEpuk
         k5AA==
X-Gm-Message-State: AGi0PubNvB5sboTs2ANByk8SlZRo3iWKWUEhtoupdPi3VOjItoVVor6I
        YcMe+ZSuMG7kK4B5bT8WUG2Tng==
X-Google-Smtp-Source: APiQypKf6IbOeOx+5EfHUUqCWzbaipquaePVOHE175HL0LBNU9ynasyUz/CcO62uWiKdOHOo00HWLA==
X-Received: by 2002:a5d:614b:: with SMTP id y11mr26414026wrt.77.1589288047573;
        Tue, 12 May 2020 05:54:07 -0700 (PDT)
Received: from localhost.localdomain (212-39-89-66.ip.btc-net.bg. [212.39.89.66])
        by smtp.googlemail.com with ESMTPSA id n13sm2433938wrs.2.2020.05.12.05.54.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 05:54:06 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, rjw@rjwysocki.net,
        saravanak@google.com, sibis@codeaurora.org, mka@chromium.org
Cc:     robh+dt@kernel.org, rnayak@codeaurora.org,
        bjorn.andersson@linaro.org, vincent.guittot@linaro.org,
        jcrouse@codeaurora.org, evgreen@chromium.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH v8 07/10] cpufreq: dt: Add support for interconnect bandwidth scaling
Date:   Tue, 12 May 2020 15:53:24 +0300
Message-Id: <20200512125327.1868-8-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512125327.1868-1-georgi.djakov@linaro.org>
References: <20200512125327.1868-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In addition to clocks and regulators, some devices can scale the bandwidth
of their on-chip interconnect - for example between CPU and DDR memory. Add
support for that, so that platforms which support it can make use of it.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
v8:
* Picked reviewed-by tag.
* Added a separate patch to check the number of paths in DT and validate
  each one of them.

 drivers/cpufreq/Kconfig      |  1 +
 drivers/cpufreq/cpufreq-dt.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index c3e6bd59e920..db2ad54ee67f 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -217,6 +217,7 @@ config CPUFREQ_DT
 
 config CPUFREQ_DT_PLATDEV
 	bool
+	depends on INTERCONNECT || !INTERCONNECT
 	help
 	  This adds a generic DT based cpufreq platdev driver for frequency
 	  management.  This creates a 'cpufreq-dt' platform device, on the
diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index 26fe8dfb9ce6..4ecef3257532 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -13,6 +13,7 @@
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
 #include <linux/err.h>
+#include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_opp.h>
@@ -95,6 +96,7 @@ static int resources_available(void)
 	struct device *cpu_dev;
 	struct regulator *cpu_reg;
 	struct clk *cpu_clk;
+	struct icc_path *cpu_path;
 	int ret = 0;
 	const char *name;
 
@@ -121,6 +123,19 @@ static int resources_available(void)
 
 	clk_put(cpu_clk);
 
+	cpu_path = of_icc_get(cpu_dev, NULL);
+	ret = PTR_ERR_OR_ZERO(cpu_path);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			dev_dbg(cpu_dev, "defer icc path: %d\n", ret);
+		else
+			dev_err(cpu_dev, "failed to get icc path: %d\n", ret);
+
+		return ret;
+	}
+
+	icc_put(cpu_path);
+
 	name = find_supply_name(cpu_dev);
 	/* Platform doesn't require regulator */
 	if (!name)
