Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32B4C5519A
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 15:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 800A020776
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 15:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxdX5jgd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgDXPyj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 11:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728481AbgDXPyR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Apr 2020 11:54:17 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC8FC09B04C
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 08:54:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so11458496wrv.10
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 08:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uy2oj6y3Y9ZepBtVyGrxPJdvFRnE5kSrp0uZgALPNV4=;
        b=OxdX5jgd7SKKPIuY8VGckbJqb2B+N7u09WuNXoGJYbUWG2JB6mNN7dTTc33qF1v3/G
         Z2Y5KWSzxrN9tXX01IQLbyLm590DCvGUp6XMB038RrbEoQGi14QRE+DUxRgK22QRgVas
         XVMrmbZ7i6GZdjziEgZicw3ry83Y6NbQYNuRZAT3UrKE00ucz2r9zgfuWonfaojiPmgb
         rwbqPOOHF8bc+5juHlqsfNuW5R8w5HTUYJVBNqSXZQhM/6RzrkCJZ5LJ3uJRU9LXonPY
         /FuMz5u3+Rw2nKiWH+YdBfi9Ce8PZ51nGaZFRu3dgHJ+oe4bvLn5X7M4DQ9C6UJEvgvA
         p0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uy2oj6y3Y9ZepBtVyGrxPJdvFRnE5kSrp0uZgALPNV4=;
        b=H64MCihxc0h0zHEULfn+L02+kKC4dhDuT1oW7jOfy8tq0x2FlDhZmiJeOo7237Yo//
         olVi9U0as7jA68ELJxicmIsMxvrqXarx3nyykDPA01oUo3oVWC0Sptrd/C2k1J2EDYeE
         QrSTjU5ayghsKCGRAZlznDXhE4Wzu/Chh/xofndzyqjWoWQCZzOU4jyfVzRIsddbkKKL
         W8r+ok2e7Htkzw3p8d1MjEZHMnS8mKoJMaSOt0Iw2q3xeBYkEkIvV1IK/WShBJz8tH2s
         MJpAd/PudNDJGzcS9vmDv9kBO2k9+twhkJdhNJ/tvUd2EGYp4iWF5Cilsy1IPrrn8t9u
         UUEQ==
X-Gm-Message-State: AGi0PubwKZEncCeR7z/btxBLG7Nf9pFAdCVSR0KdvtRzhDXC432iQQMH
        ZaoSGAYc9AojGinwVaC+IkZlLg==
X-Google-Smtp-Source: APiQypJl0lxvUl8otBjfnNrZBi1i0wPxRdrGv+bf5EqXyr8Qz9S3Ed482nW4gdF1iumrebChk3/iwg==
X-Received: by 2002:adf:f986:: with SMTP id f6mr11676191wrr.221.1587743655453;
        Fri, 24 Apr 2020 08:54:15 -0700 (PDT)
Received: from localhost.localdomain ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id z76sm3923583wmc.9.2020.04.24.08.54.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2020 08:54:14 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        robh+dt@kernel.org, rjw@rjwysocki.net, saravanak@google.com,
        sibis@codeaurora.org
Cc:     rnayak@codeaurora.org, bjorn.andersson@linaro.org,
        vincent.guittot@linaro.org, jcrouse@codeaurora.org,
        evgreen@chromium.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH v7 6/7] OPP: Update the bandwidth on OPP frequency changes
Date:   Fri, 24 Apr 2020 18:54:03 +0300
Message-Id: <20200424155404.10746-7-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200424155404.10746-1-georgi.djakov@linaro.org>
References: <20200424155404.10746-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

If the OPP bandwidth values are populated, we want to switch also the
interconnect bandwidth in addition to frequency and voltage.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
v7:
* Addressed review comments from Viresh.

v2: https://lore.kernel.org/r/20190423132823.7915-5-georgi.djakov@linaro.org

 drivers/opp/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 8e86811eb7b2..66a8ea10f3de 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -808,7 +808,7 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
 	unsigned long freq, old_freq, temp_freq;
 	struct dev_pm_opp *old_opp, *opp;
 	struct clk *clk;
-	int ret;
+	int ret, i;
 
 	opp_table = _find_opp_table(dev);
 	if (IS_ERR(opp_table)) {
@@ -895,6 +895,17 @@ int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
 			dev_err(dev, "Failed to set required opps: %d\n", ret);
 	}
 
+	if (!ret && opp_table->paths) {
+		for (i = 0; i < opp_table->path_count; i++) {
+			ret = icc_set_bw(opp_table->paths[i],
+					 opp->bandwidth[i].avg,
+					 opp->bandwidth[i].peak);
+			if (ret)
+				dev_err(dev, "Failed to set bandwidth[%d]: %d\n",
+					i, ret);
+		}
+	}
+
 put_opp:
 	dev_pm_opp_put(opp);
 put_old_opp:
