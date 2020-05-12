Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F58AC54E8E
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:54:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D970206D3
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sO7XfySX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730039AbgELMyb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 08:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729994AbgELMyL (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 08:54:11 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17515C05BD0B
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 05:54:11 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id m12so16710803wmc.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ajq1/CzNblXv+RM50/78rYUghtc/wnGS+X5x8yODyro=;
        b=sO7XfySXe80lnwqkM0HWalZ/ES2oFzxHC7xem4vOYv+YNGQ6ZdL81IDKCWGRDYfo0K
         AIuWbCIrg5La5wCRDU2tJVS4DgFc4wCRbB6qfTOAeTyqMYZlg2VZaW+copxuN+tcappx
         IuMRgLabKURL8TLvRpsSTyWAzjpVwbUMLwc0VPYo7NzOqGT1qcj5lQ6VT/ZlAltjSLbe
         FSBTGWNX19PpIanyCGJPjsAd/QKzg+8cSl7cg13/lrwi54mXTWI8SfsQ8zpneQZZBtdi
         5FpDn2wm5oPgJImqxZQYO6p3LvBY/IvBBd3lsGCb7YLa0bMxREUTf1p5wqFbjpk6DEsd
         rjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ajq1/CzNblXv+RM50/78rYUghtc/wnGS+X5x8yODyro=;
        b=rKtCltULs75bU6WwQ4TM91IZPe89yweJIW6ek0mJYp8ywgeeYHxlYoIsUyvunf8sOa
         hKrrHmyqAe3GtbESXRxleSgML3+JdZsr8hcVIA0LlXZNX+1pg1RT0YrCI55PDV8u4wnR
         NxuG9p077u099PeFbBgZC42NsiB50juMcY5gNQZm2AWB5/8q1KTAWl7iAstVMge4Xo4X
         qmo1WeKVd4Dto5N+7pc0a7WwN4K9X6M+OB+mTrFtGFQrsHG8uhaVHjuHb/rKPnhgSAa0
         MDKp9cNKAjjGE47aVl1dL8hj/CWjJO8WTywPRSDwagBatJuzybbWZXrjUdYHvxIL30FI
         Dj3g==
X-Gm-Message-State: AGi0PuYamwIPLqawwgAyACagQp3c6uXWl6fgkrMisDDwZO8CiFgb6vsh
        Op6x/1yoT/tr4YM1TA5XszCYrQ==
X-Google-Smtp-Source: APiQypI9T2ok8lrlawVLg9C+vh31VJV/7SAheVI1C66BCWNhBoiMINsaNb/Pq91MS1pb1eZXRFnVwg==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr39074416wmj.95.1589288049805;
        Tue, 12 May 2020 05:54:09 -0700 (PDT)
Received: from localhost.localdomain (212-39-89-66.ip.btc-net.bg. [212.39.89.66])
        by smtp.googlemail.com with ESMTPSA id n13sm2433938wrs.2.2020.05.12.05.54.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 05:54:09 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, rjw@rjwysocki.net,
        saravanak@google.com, sibis@codeaurora.org, mka@chromium.org
Cc:     robh+dt@kernel.org, rnayak@codeaurora.org,
        bjorn.andersson@linaro.org, vincent.guittot@linaro.org,
        jcrouse@codeaurora.org, evgreen@chromium.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH v8 08/10] cpufreq: dt: Validate all interconnect paths
Date:   Tue, 12 May 2020 15:53:25 +0300
Message-Id: <20200512125327.1868-9-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512125327.1868-1-georgi.djakov@linaro.org>
References: <20200512125327.1868-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently when we check for the available resources, we assume that there
is only one interconnect path, but in fact it could be more than one. Do
some validation to determine the number of paths and verify if each one
of them is available.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
v8:
* New patch.

 drivers/cpufreq/cpufreq-dt.c | 49 ++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index 4ecef3257532..3dd28c2c1633 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -91,12 +91,54 @@ static const char *find_supply_name(struct device *dev)
 	return name;
 }
 
+static int find_icc_paths(struct device *dev)
+{
+	struct device_node *np;
+	struct icc_path **paths;
+	int i, count, num_paths;
+	int ret = 0;
+
+	np = of_node_get(dev->of_node);
+	if (!np)
+		return 0;
+
+	count = of_count_phandle_with_args(np, "interconnects",
+					   "#interconnect-cells");
+	of_node_put(np);
+	if (count < 0)
+		return 0;
+
+	/* two phandles when #interconnect-cells = <1> */
+	if (count % 2) {
+		dev_err(dev, "%s: Invalid interconnects values\n", __func__);
+		return -EINVAL;
+	}
+
+	num_paths = count / 2;
+	paths = kcalloc(num_paths, sizeof(*paths), GFP_KERNEL);
+	if (!paths)
+		return -ENOMEM;
+
+	for (i = 0; i < num_paths; i++) {
+		paths[i] = of_icc_get_by_index(dev, i);
+		ret = PTR_ERR_OR_ZERO(paths[i]);
+		if (ret)
+			break;
+	}
+
+	while (i--)
+		icc_put(paths[i]);
+
+	kfree(paths);
+
+	return ret;
+}
+
 static int resources_available(void)
 {
 	struct device *cpu_dev;
 	struct regulator *cpu_reg;
 	struct clk *cpu_clk;
-	struct icc_path *cpu_path;
 	int ret = 0;
 	const char *name;
 
@@ -123,8 +165,7 @@ static int resources_available(void)
 
 	clk_put(cpu_clk);
 
-	cpu_path = of_icc_get(cpu_dev, NULL);
-	ret = PTR_ERR_OR_ZERO(cpu_path);
+	ret = find_icc_paths(cpu_dev);
 	if (ret) {
 		if (ret == -EPROBE_DEFER)
 			dev_dbg(cpu_dev, "defer icc path: %d\n", ret);
@@ -134,8 +175,6 @@ static int resources_available(void)
 		return ret;
 	}
 
-	icc_put(cpu_path);
-
 	name = find_supply_name(cpu_dev);
 	/* Platform doesn't require regulator */
 	if (!name)
