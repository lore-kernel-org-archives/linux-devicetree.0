Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7592FC6196
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8DBE2187F
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BSmq2BLg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732075AbfKGAJY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 19:09:24 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41420 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbfKGAJY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 19:09:24 -0500
Received: by mail-pg1-f193.google.com with SMTP id h4so344079pgv.8
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 16:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4KKU3lnlQMUNYRTg4PG0tZkLk5GCpHdCevi44aaMqI=;
        b=BSmq2BLgOR2hAg+twaNBN+Lj06RNuWYteaIO9NyMxnlT2bzZibvLzHW0s8ALhlnOmx
         +ca0rhqfcYfyqeQ4dJJ8PDsPW2BNwJ4EJECnai5F9h/zDdn0cNA0JzHZxWo9cR00oYUM
         T68KXHA5q8BGJXdrLyXd990555c3Ysgg48PLrEAEakcMzsK3ru07Vm8GvYGQnEP3edO/
         WQ2BiGbhZ+W/IUUH7PwIdxUE4+9CvGy9P8xipawoJRpbr5gTC8Wyo3GUibMG+XFQnSOD
         xiaPU+tTleHyfOi2hemCu4pLCvo15tM4b08Ld12kmfC/LUUBGVIOGBG9KtLguHNcRWMw
         91ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4KKU3lnlQMUNYRTg4PG0tZkLk5GCpHdCevi44aaMqI=;
        b=UvwtaTBkcCDA0wRAD71PQxOfoOqXw/xUzXewwulSyY703xkDU/bBUmDDfxShdEJZzh
         ceixtbdmgvvecPSjGpJXzytv623J2wWdeamGdYiTe/tPlJW1oV9DEYTfnJRoCWzSQFt0
         +7T+6tZW7k2PZCu8hS0HqR9gfQ4NI0HnOdv5f/A4hz27SXl8xQrwOVh1+4ORZEPbq5yc
         QEGfR8Iz11hLCa8XVyiNTt91J8/I74gawCcChMlfHwq9SGHnukZPNr9xOJCDOrv7+6D0
         n2qsI1sHiNoFLBEDykArX3E33A8JzvHmeGNMzXYLNnQgIM+EuUzmucrAtfNcRlKzYV1a
         gZyQ==
X-Gm-Message-State: APjAAAXDQ+XrWeaV9fWjOXSNyAvEwX2kXFUDEOK61F0uy8Z5h56zm26J
        FlCsMifH14HQ1FlRXaNQUMhWqw==
X-Google-Smtp-Source: APXvYqx4fX8Gn+t3Rh3bmDBrB/ZOu/6lTbIy0+fAFGSErMBTtjm4GnANtgUhaKocS8/SeNeX1xNL4g==
X-Received: by 2002:a63:a747:: with SMTP id w7mr772076pgo.310.1573085363153;
        Wed, 06 Nov 2019 16:09:23 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:22 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 2/5] phy: qcom-qmp: Increase PHY ready timeout
Date:   Wed,  6 Nov 2019 16:09:14 -0800
Message-Id: <20191107000917.1092409-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
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

Changes since v2:
- None

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

