Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FBDC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D01BE2074A
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NUF3+HfZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731276AbgCKTPK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:15:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43466 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731264AbgCKTPK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 15:15:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so4105707wrf.10
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEwzry/jY0EwIu3SqW/i/uuhtKICMHn3+vPUvgi2EeQ=;
        b=NUF3+HfZC/mZ0S8xol+/4n86HJIHKo564ay1CbE+vi3VHYcONGUIaWxmVSw49sFWpW
         RP80M63fJKMzsBLjzyo+IaRYO53JSlgMeia5kKgD+g+3bmeQI165JeavX0hZ0P1QIRc+
         KMi9EjEx0L9uVcHY7f6WOz9e6xzZu05lZHWxesKKKqcd86EMIb4tapRajRfgBMrAAv6c
         maqGeiOBYSAPmThWcjHNY/eZqKPqj3Nmuun8iXe/8scTH+7DppUClsCa9QxMmdkxj7zq
         eYUWrQwlis0oFUvSalRc+LLWjyjCyeOIE1Cs0+s3c71gCChhpMASC70ynZrNSQHfVEJS
         ERTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEwzry/jY0EwIu3SqW/i/uuhtKICMHn3+vPUvgi2EeQ=;
        b=ER9rnsnbUMfq35gfHyo0Bt7phmzg43xX1d5MX8h02v6RjXOrK6yqL5XnONYNvHF+JP
         trChqkzMzTrqs8btM+bfgu3u74/9H3BmGwIyIVJHa395XgpsWKwEwCkM4QbbjJ8l7mIb
         oELDNhvSGbo+mHPFsJgBhIWocVjP6K0u6qu9f5jnP63kzY9OT4jVSszJWQhPwmWQ5ltE
         5t9iBcNHJ1J3bCkH4g190g3X+NdKO8j21t9KBvW9DxjkezYqV/LVC/1+ZTTYMV9uJQBU
         6SZUHevyMEpqjkXs5624im2RL1OH1DtBVvTOV31XKLczySDmFK6ZbYz2l4ZQZYNgFsuA
         5UbQ==
X-Gm-Message-State: ANhLgQ3HGk1M6tEQu2dKwsEJ0mNRhC6OXJ5GEsP6759APLzyqY6rd8gS
        nHbuOu4fCbpskF4mwN4UqGfW1g==
X-Google-Smtp-Source: ADFU+vt5lPjCeIzhFut9VqEfAfutvx/rWPEFF6e/wR/uuWGKcIximP5y31i8vGUEbjFbPSPyEVd1xg==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr6294264wrn.29.1583954108525;
        Wed, 11 Mar 2020 12:15:08 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: qcs404-evb: Raise vreg_l12_3p3 minimum voltage
Date:   Wed, 11 Mar 2020 19:15:16 +0000
Message-Id: <20200311191517.8221-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rather than set the minimum microvolt for this regulator in the USB SS PHY
driver, set it in the DTS.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 4b529a6077d2..44c7dda1e1fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -200,7 +200,7 @@ vreg_l11_sdc2: l11 {
 		};
 
 		vreg_l12_3p3: l12 {
-			regulator-min-microvolt = <2968000>;
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
 		};
 
-- 
2.25.1

