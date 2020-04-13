Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE1DC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 17:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 977DD20735
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 17:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="FxHHTce6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbgDMRBc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 13:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732296AbgDMRB2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Apr 2020 13:01:28 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73202C00860A
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 10:01:26 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r26so10702776wmh.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JkyvlKP4pHrJ8AdiuVHbCpIXULnDIYo0wPYklEdrEI0=;
        b=FxHHTce6kUJpnTuVqBEebcyuVduLLI3MDxCnmXLzQvF9W3QrB7+QIxbokfNCr7pLCs
         wrVSaK4KajytYNVxvM1R9kGh4X3+Csq+BtIsmZSauaoYn10y4aE+jS7aUyWmcXN5aB7R
         0y+EDhH8klxRKA1Xa4V48yr2cTSD4ApiPj/p2MFKFoP5ysqHJDi3LDsOmVm5q3dtVUH+
         pbwr9mrv8VEvahdHePsPeO9KF1214yZI22kRz+PTHX+PKRdxkyN3XQcmISb9pFErsEAR
         Ro5vrVW9MJlBzCbsZruCvN1COWWiYI6FXKBlEZyt1ePyq5TzJu5ZL/D64x7xzhEd0V5M
         w5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkyvlKP4pHrJ8AdiuVHbCpIXULnDIYo0wPYklEdrEI0=;
        b=XGy0wI3Wwf43uwMPMwLSlW79a7W4xn6rFVIJfW7e5cElYutq+MI6tmfLd07FOK8ogw
         0j12auwIW74yTOS9B/IOnIm7FugxovdMqsLcJx1N1kvhDWQpA/C5Al8j8mZnZdyOEdts
         w805Svh+oqjRIT/ST1xqKwgWOTq9F10lOwMR5KYs0s7snSBSmPgNeBt9z921ggr84QZ2
         NzS2eZEJapqoNaXMkLw03/NzfhidQf39wrKXw4awozb97OkY6mf/+GCXn/BcFtOP++PE
         sYH5cCgEOkSvNPhDKtJcX65bzy1dhUVCTMbqRqoHUH2d50BJgZ7h1ZXj4Tw3RU0E2j8o
         UoZw==
X-Gm-Message-State: AGi0Pubtd3Waa40yYxynjIIzr4WS9NKjeMxAAZU8ybrr/M16bRF5n9EJ
        Apk2wFfqjULyP171169zNLS5YQ==
X-Google-Smtp-Source: APiQypJO8z0SusDHMvM2B2HYR3lG5GDTJa102Xjb6xK/nW9B/iuDf2ZoA7bxlxWdOqWiHzKXzwXxBQ==
X-Received: by 2002:a05:600c:2c04:: with SMTP id q4mr18746719wmg.7.1586797285096;
        Mon, 13 Apr 2020 10:01:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:1f1b:192:29fe:7bf:41fe:904d])
        by smtp.googlemail.com with ESMTPSA id q187sm15443268wma.41.2020.04.13.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:01:24 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Christian Lamparter <chunkeey@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 3/3] dts: ipq4019: add MDIO node
Date:   Mon, 13 Apr 2020 19:01:07 +0200
Message-Id: <20200413170107.246509-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413170107.246509-1-robert.marko@sartura.hr>
References: <20200413170107.246509-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the necessary MDIO interface node
to the Qualcomm IPQ4019 DTSI.

Built-in QCA8337N switch is managed using it,
and since we have a driver for it lets add it.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b4803a428340..80d0a69e9fed 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -578,6 +578,34 @@ wifi1: wifi@a800000 {
 			status = "disabled";
 		};
 
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq40xx-mdio";
+			reg = <0x90000 0x64>;
+			status = "disabled";
+
+			ethphy0: ethernet-phy@0 {
+				reg = <0>;
+			};
+
+			ethphy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+
+			ethphy2: ethernet-phy@2 {
+				reg = <2>;
+			};
+
+			ethphy3: ethernet-phy@3 {
+				reg = <3>;
+			};
+
+			ethphy4: ethernet-phy@4 {
+				reg = <4>;
+			};
+		};
+
 		usb3_ss_phy: ssphy@9a000 {
 			compatible = "qcom,usb-ss-ipq4019-phy";
 			#phy-cells = <0>;
-- 
2.26.0

