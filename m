Return-Path: <SRS0=kVRS=Y2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8BECA9ECF
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 Nov 2019 00:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1F7C208E3
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 Nov 2019 00:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfM6G2Gl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbfKBAQw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 20:16:52 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45991 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbfKBAQh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 20:16:37 -0400
Received: by mail-pf1-f194.google.com with SMTP id z4so2055462pfn.12
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 17:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcFx68gFVeXHdVBwzZXTkZrB0QDgMIqTKWMux+ooRs8=;
        b=UfM6G2Gl8WH+AYz02r39xAIYWNUDoihkgPCGzFZN0CPZc/rTNvv7I0DhHMk9S2ZN4C
         cdaTpMy5lTjpEQ/uzsoC8Sgvgbv6PyD7qmmAwbPTf82rrbmmlWHK7uEk0OzSyH1oLf4A
         xY7s7MZYXrZyZ7HAdE4hqvu7KRKynfnFKi/9UCED2aKHAGhAQzC5iT/Icpb0QUlTetuA
         S3JcVGZU7Dk3G+yhjWVBPXaQ00Mf4JOS+F9gKReG0WmtUbgyNBUU4wOB9F07pPQm2seu
         GHaRzSSVXZkfUrk9W6bgPWMGXgBlfTAcBlb0qdCyVjNP8rqaBXAngV1Vf2CXrLQ+EQBB
         8chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcFx68gFVeXHdVBwzZXTkZrB0QDgMIqTKWMux+ooRs8=;
        b=f0WqmStBLH7atl1zW5VuB6W4Jqhwn79uDafHTsmiG2QsLdgw1SXZrIZCZUvRKq+kQ/
         XG1qzfl6lL20JX0cKlIf+AQDwXrx19wHBYQfdUuNIOfPBSPGj+vcJBC6BGP1EFm/4w3z
         rhFk1JaHfh/AKWPyowmrjexuni+UkNiTzTzo81wrBfN0pFo8zo4vTtOUeKtwZhSe7RUz
         DEHOUi7KqJEu7T7mvnp1SvSw2cny9hm1ali+UNCl1Lv8G/QPCIrl3TRH/CmwjY+Hehh3
         hBj9okUlBbNn/UspdRWNqhgK6xGSbHZUGTtwcjc69zJa23CXrqO0Wf/Lg2wJYJDayY2r
         GzhA==
X-Gm-Message-State: APjAAAULTUsxJ32z6ps20biolfMCnNi7kjiBSXqmalwsNNBm5OnEI6wx
        fIvxZuN+DtxzoPcz6WNfwLRwrQ==
X-Google-Smtp-Source: APXvYqwxZcLsF0q9Fc8LDGj+EyhAVJrNvRb1omSIPEuI9LoRmXdCIGqKoGl1YCTQMlQjkKKK6+sScQ==
X-Received: by 2002:a17:90a:3b0d:: with SMTP id d13mr7137017pjc.86.1572653795266;
        Fri, 01 Nov 2019 17:16:35 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j11sm7876250pgk.3.2019.11.01.17.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:16:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] phy: qcom-qmp: Increase PHY ready timeout
Date:   Fri,  1 Nov 2019 17:16:25 -0700
Message-Id: <20191102001628.4090861-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
References: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It's typical for the QHP PHY to take slightly above 1ms to initialize,
so increase the timeout of the PHY ready check to 10ms - as already done
in the downstream PCIe driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 091e20303a14..66f91726b8b2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -66,7 +66,7 @@
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
-#define PHY_INIT_COMPLETE_TIMEOUT		1000
+#define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			11
 
-- 
2.23.0

