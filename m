Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF498C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D8A620775
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBSlhJE1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389860AbgDOGIL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 02:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389665AbgDOGIJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 02:08:09 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC03C061A0E
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:08:09 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so6342832pjb.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FtoXwVoleXkIcgxv+sUDXuBjYYrXNWCbLasQJpcSpcA=;
        b=HBSlhJE1D9sli7y3Lghond2tbNdmcv2k52X6Hc+g5U5gDHqLCoyA4V8trJ1hfDXtJZ
         hL/C45uaWk31S3muKirUX6mxE9l7/jfKm44TJvP0ibCdxSppuRdEa+V5jgaghqPgvPwI
         eu/W20Vrnl+C99uTB5/SyrV5HOjbQolwSD0F4bscBMiFPNwKQ+s//MBqj/pDAejbqtGV
         YltAG7lbfdjyh2323dgGYG2zkzxv72b+gc/KcqSqVYZI4HZWhkaPYITCu6FX16G58tX7
         mR6yPCRvnbR6gAWQxxosJTZcITIHjoXHzn/censmt3pPbP2o5VkW4dBenxTtyYDbnj95
         alOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FtoXwVoleXkIcgxv+sUDXuBjYYrXNWCbLasQJpcSpcA=;
        b=tbZXUQjw/BGMCQUkfopnHidIdYtgN591XwlrTVokSe+y/zLvkcGGkDPAY+lUTiK37F
         y3p18S1Hr5TtIyArPd1VznuBfsEajzov98dZ2ARKwK9qa9QAli5ng9MOej1boZU4llZK
         53SQFwLYqQn3ztHRAq9+98ZEnPPtSGgIB3dgOqs4lFjunxBvHE0x1wInvJhM4hJDxhlt
         vL8T4uX5OO3Dwdc+qqXXmufEntaur52KKmekyTShZTZVCgkbTg6HQpARP5tXioZcy4DC
         54b6BgeHSSg5KMqWyVibUaJgdHbA/+j/w7ey8nZVRJtqfFI0Gs5vJ/njlV1JCIW2+qZH
         ydMw==
X-Gm-Message-State: AGi0PuYiz4rTgpHLyaetfbXSCZI24in9Pg46IWv6iDOY6I270R0CIG3f
        +/BjhEYK6UZnEGgZeQlcxgGYFg==
X-Google-Smtp-Source: APiQypLATgkPNLXkc5JX3Zzus/BzNEM7TgJHrpWr+foPIyUiTHiGtmwHXGsLk4VH5o6rDNk17+gOew==
X-Received: by 2002:a17:902:968a:: with SMTP id n10mr3367186plp.74.1586930888484;
        Tue, 14 Apr 2020 23:08:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b4sm2643951pff.6.2020.04.14.23.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:08:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] phy: qcom: qmp: Add SM8250 UFS PHY
Date:   Tue, 14 Apr 2020 23:07:45 -0700
Message-Id: <20200415060745.740193-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SM8250 UFS PHY can run off the same initialization sequence as
SM8150, but add the compatible to allow future changes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 5 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.c                    | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 54d6f8d43508..5ff9e7ab6001 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -19,6 +19,7 @@ Required properties:
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845,
 	       "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
 	       "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
+	       "qcom,sm8250-qmp-ufs-phy" for UFS QMP phy on sm8250.
 
 - reg:
   - index 0: address and length of register set for PHY's common
@@ -69,6 +70,8 @@ Required properties:
 			"ref", "ref_aux".
 		For "qcom,sm8150-qmp-ufs-phy" must contain:
 			"ref", "ref_aux".
+		For "qcom,sm8250-qmp-ufs-phy" must contain:
+			"ref", "ref_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
@@ -103,6 +106,8 @@ Required properties:
 			"ufsphy".
 		For "qcom,sm8150-qmp-ufs-phy": must contain:
 			"ufsphy".
+		For "qcom,sm8250-qmp-ufs-phy": must contain:
+			"ufsphy".
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index c190406246ab..50cbcdce3680 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2536,6 +2536,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8250-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
 	},
 	{ },
 };
-- 
2.24.0

