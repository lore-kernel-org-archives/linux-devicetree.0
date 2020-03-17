Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8408C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 13:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 801F42076A
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 13:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g961w6HI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgCQN6L (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 09:58:11 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:33762 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgCQN57 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 09:57:59 -0400
Received: by mail-wr1-f41.google.com with SMTP id a25so25819728wrd.0
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJ6WBkhO3K4OzsJINoEYvBbfmbxMU3iYiQ/cJbW0xDo=;
        b=g961w6HILHFqpDyFSns33LU0XmgMSPUSxr8P9etyj+evR/2wwGCLVQH4uB+PHcuCDK
         PWKNLyUII/jas7FoO5LE1NTUjtXDk9k0Y6EIViorMQdTN0ZxBaoiFJPhf4v4Nf/3zy00
         FUsYD0x7uD/JUu7epLOzCdGFP/lxPbQ9xS+PHV++AcJlwIJmZOMLGJBQOeApI5/GdreX
         wts8dEJX0Xb9e8PHe/hVQYGyfAgnMSeoM9F5bATTBxbI/V6N+xCjRiXNfZXBYs6Os0Mc
         IIl5YLQUegLfCoiRILfuOOi9bsro62LdEKBED9EPrpEU/oCp+UteuSqYXeEgaqKglkTG
         O+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJ6WBkhO3K4OzsJINoEYvBbfmbxMU3iYiQ/cJbW0xDo=;
        b=CcnLkF3qE3MRYPMu9Ii2HWnm9dOHTaGmh42FzamahC7oHVw699yg59LvXWD3ha4xtS
         c4PHULjYkeVDDZ3S5J/14zOW2ed9GV+BujnSqlh5djH50glw9iLL/6nqEZEhJYcIBlvE
         7OwrRYDeMWemuu4X5NyCBhaWzzR/BaARuZQQ03GmjbA7eFKinJfoQrp0JwSiHjVYjcHD
         p/JVJMmAgW4zMqugzUmjgFLDSgw3I2wBNGd6R7jRJTF3jq+dTzSLWRsmsqfRZYiw4qEa
         NJlKRBcQ7L/GWKoVXKBMI2CEwFvUXNrWSl20viqHHFVfE3denmOTxVLjx1YYthVvAsFK
         M1Yw==
X-Gm-Message-State: ANhLgQ0kel67/ZD+3CCHQif5HJtU+Tq3apTsj2CsX709hTQYr3heljyl
        u/+OAeaj/qjh9cZS6rWHuWSebw==
X-Google-Smtp-Source: ADFU+vuEQpGGjN2Y6PiGYYhYPKWhI4pKxDM+6JY/eVnr92WFJO7DQJ+ODChwu2MU9pQRB6o9WKPrXw==
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr6279100wrp.91.1584453476447;
        Tue, 17 Mar 2020 06:57:56 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:84f7:5c25:a9d8:81a1])
        by smtp.gmail.com with ESMTPSA id r3sm2976558wrn.35.2020.03.17.06.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, maxime@cerno.tech,
        Anson.Huang@nxp.com, dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 4/6] arm64: dts: sdm845-db845c: Add pm_8998 gpio names
Date:   Tue, 17 Mar 2020 14:57:38 +0100
Message-Id: <20200317135740.19412-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317135740.19412-1-robert.foss@linaro.org>
References: <20200317135740.19412-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add pm_8998 GPIO trace names. These names are defined in
the 96boards db845c mezzanine schematic.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Move gpio-names to previous reference to pm8998_gpio label


 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a6b6837c3d68..efb0086e2aa1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -365,6 +365,34 @@
 };
 
 &pm8998_gpio {
+	gpio-line-names =
+		"NC",
+		"NC",
+		"WLAN_SW_CTRL",
+		"NC",
+		"PM_GPIO5_BLUE_BT_LED",
+		"VOL_UP_N",
+		"NC",
+		"ADC_IN1",
+		"PM_GPIO9_YEL_WIFI_LED",
+		"CAM0_AVDD_EN",
+		"NC",
+		"CAM0_DVDD_EN",
+		"PM_GPIO13_GREEN_U4_LED",
+		"DIV_CLK2",
+		"NC",
+		"NC",
+		"NC",
+		"SMB_STAT",
+		"NC",
+		"NC",
+		"ADC_IN2",
+		"OPTION1",
+		"WCSS_PWR_REQ",
+		"PM845_GPIO24",
+		"OPTION2",
+		"PM845_SLB";
+
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
 		function = "normal";
-- 
2.20.1

