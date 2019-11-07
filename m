Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67D7FC6199
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96EEF2187F
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+nW4KyY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbfKGAJZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 19:09:25 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37998 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbfKGAJZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 19:09:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id c13so582070pfp.5
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nkwrhUtOyjx0z9ia/8F33+h4qaYoxLjegmC7kxYQ68c=;
        b=G+nW4KyYZbSmZV1PjkTQItWl/2ynM7MjIg4xQoN3etiESrao5WSn8DqJrhbsEDXx7z
         VRSfFtgZrlUqjK/Am4eN6BvO9OeLveWVg2v7MGpYtHwP+zJQ6G/7leP8ahpXUESoxn5Q
         XLl/3rOmXsYBbPkbhJt8xebs2f8+J0E5sif/yBvUK99IXEoh7dCB4v8YN+7Q/xNqA3y5
         Djg07z3+oZAxmuKIvyi8XQWEMsksPV4l6ekG6ORvL3vUUpsazEJbyC851Mk5mWVlgdmk
         op1GB6r68yrrb7k1aMnDqtJPXMRrrjkZKLE5D9cXZMYTb/WW5ujfVQnRSOwJ3zWMjD4Y
         dDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkwrhUtOyjx0z9ia/8F33+h4qaYoxLjegmC7kxYQ68c=;
        b=XtAMAKtyW5bPFubQtExPbk1sPkWI9cxOMPP5LwIdkEtNtqbY+ZF7rbf2rJVqCED8tV
         OqwLv8kqOINSzr+O8wZhPlkzsnhPVYM9478lRmUIZ2wal4s0eIPoEFo4IALA/2rjwor8
         Hgio6fXAvPzgDClR9hjg+wqeiPUWnyWWAMr5s9TedWonwbbulGLa4pfez/cN1uCISZW5
         O/juF4K0ptNnCfXVGW53cPzELGZrcFg/LnLPoWyE1Pr80YU7HfbFMhSz+HMTW+HhChmB
         /7e/eRoB72RAocunw8OlVr1ZAZxYOPykqHYVVp8fwvp5yLm3IZcTxxnN0FCC5Dmk7VdN
         2jAw==
X-Gm-Message-State: APjAAAUujwGvBnpIDK4JvLCQ4N9J64ecpzO14h4aaQxnjJbFFAmdtXc5
        UUP/QJSbg6de3iKXL4PmTS8Xgg==
X-Google-Smtp-Source: APXvYqzL7Xf8VVGGGBOYn8T1eJwl32JXDaBaAGfga67YrGPm3bMWanjaIDD5Bj8hcuNZkpL4diF6pQ==
X-Received: by 2002:aa7:930c:: with SMTP id 12mr90008pfj.33.1573085364599;
        Wed, 06 Nov 2019 16:09:24 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 3/5] phy: qcom: qmp: Use power_on/off ops for PCIe
Date:   Wed,  6 Nov 2019 16:09:15 -0800
Message-Id: <20191107000917.1092409-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
References: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The PCIe PHY initialization requires the attached device to be present,
which is primarily achieved by the PCI controller driver.  So move the
logic from init/exit to power_on/power_off.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/phy/qualcomm/phy-qcom-qmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 66f91726b8b2..b9f849d86795 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1968,7 +1968,7 @@ static const struct phy_ops qcom_qmp_phy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static const struct phy_ops qcom_qmp_ufs_ops = {
+static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
 	.power_on	= qcom_qmp_phy_enable,
 	.power_off	= qcom_qmp_phy_disable,
 	.set_mode	= qcom_qmp_phy_set_mode,
@@ -2068,8 +2068,8 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 		}
 	}
 
-	if (qmp->cfg->type == PHY_TYPE_UFS)
-		ops = &qcom_qmp_ufs_ops;
+	if (qmp->cfg->type == PHY_TYPE_UFS || qmp->cfg->type == PHY_TYPE_PCIE)
+		ops = &qcom_qmp_pcie_ufs_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
 	if (IS_ERR(generic_phy)) {
-- 
2.23.0

