Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC40C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 01:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9924620772
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 01:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+JVXvVE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgFDBxu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 21:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgFDBxX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 21:53:23 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A7CC08C5C2
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 18:53:23 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id j32so3932511qte.10
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 18:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ol8M2KCtVTfhjIudQ80yoAA541E23GCrsvIpBzMufk8=;
        b=g+JVXvVEhHBGXKk2wAZGtNuoP1FYpvjvUuC5MOwY3es9FBBcxhVq6st1ofsoIOh7+e
         2eFVCjT62+hMAWz2US1Slf0/Wzf6zyrhKXZ7XXrIwxVYhhLty0DDItF+ZpBm5FB4Eqon
         7uv+DEl4e5steUBdILty/uqHIbznxb8XXwua4wBLyTUX1Ln0ENC4YgiE7rXkPKrqw/U+
         oYXNL+FC6xTjKapLxYXEgp9prko8EXbVw4RR7+kADWkJgyS/CfIvgcU4mIYg+ez2B4jR
         ouIkuZGdHNwOWxpM8m4GtThiXkCxZTYLikuEoLjVRopgs8ZAqm6hkSFQj1UNuSzaG9r4
         hCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ol8M2KCtVTfhjIudQ80yoAA541E23GCrsvIpBzMufk8=;
        b=gkQ73/PcM+zm1VfVrIo5VMvoj8oS2M3pZyftBWW3T3Bczy6hfrgc/kmVe14u4JEVA0
         O974OzVOXdiW48IyRSXOPpLDZp4HlvHGIqgj5brk+92jWz4dCVKyAOon6PXPjIV+CY7u
         9bXpENNGa2Jd+o9KVwlqQZhI4XftClvNthpsvfPRs6mrBdMr12rsxy9ch2fs8QTnMXBq
         f8qiK2mY2oEF1qaLFsUm0+6sFvES+KMK4SgF3ZVNuFWyWLWudhNIeU/CXBoiC8WBW0CN
         3tU0IynUUy6B1hZZZmdpFJPEUeUL/8ItuRf/iYwfEZQqVHRUWR/Glz9kXHItN8GuX8re
         LQGw==
X-Gm-Message-State: AOAM533GqAEZ7KJWIT7DuevKfigY7O7h3K1xImrG2QuOTu9ZID9YqZJj
        LGRmLBMzJDChsOmH/VZu03nWuA==
X-Google-Smtp-Source: ABdhPJwV+BvFStA1v5/UAqO4fihvZU5fJ58FDImcRujQQp1tu0wGpU2ow31ZMbF7tSXu0JwSuJkq6A==
X-Received: by 2002:ac8:2bc1:: with SMTP id n1mr2332050qtn.382.1591235602521;
        Wed, 03 Jun 2020 18:53:22 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id t74sm2986439qka.21.2020.06.03.18.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 18:53:21 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] soc: qcom: rpmhpd: Introduce function to retrieve power domain performance state count
Date:   Wed,  3 Jun 2020 21:53:13 -0400
Message-Id: <20200604015317.31389-3-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604015317.31389-1-thara.gopinath@linaro.org>
References: <20200604015317.31389-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Populate .get_performance_state_count in genpd ops to retrieve the count of
performance states supported by a rpmh power domain.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index e72426221a69..a9c597143525 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -362,6 +362,13 @@ static unsigned int rpmhpd_get_performance_state(struct generic_pm_domain *genpd
 	return dev_pm_opp_get_level(opp);
 }
 
+static int rpmhpd_performance_states_count(struct generic_pm_domain *domain)
+{
+	struct rpmhpd *pd = domain_to_rpmhpd(domain);
+
+	return pd->level_count;
+}
+
 static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
 {
 	int i;
@@ -450,6 +457,7 @@ static int rpmhpd_probe(struct platform_device *pdev)
 		rpmhpds[i]->pd.power_on = rpmhpd_power_on;
 		rpmhpds[i]->pd.set_performance_state = rpmhpd_set_performance_state;
 		rpmhpds[i]->pd.opp_to_performance_state = rpmhpd_get_performance_state;
+		rpmhpds[i]->pd.get_performance_state_count = rpmhpd_performance_states_count;
 		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmhpds[i]->pd;
-- 
2.20.1

