Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED41C352A3
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 02:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8740021775
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 02:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EB4qPHFi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbgBGB7Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Feb 2020 20:59:24 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39415 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbgBGB7Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Feb 2020 20:59:24 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so957582wme.4
        for <devicetree@vger.kernel.org>; Thu, 06 Feb 2020 17:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=EB4qPHFiqjaHLWaM/xuGWdSlWoqy/me+RmkCCtLDpUqfROTlp11Nua9NpW76lSXJo6
         ol5HnB5j5EX18l8zD/2VjMykku+H0QwTjhYwS9COhevjdwrou9Fw0FijvSjEhVOJwx1N
         6IGnpJc+1rBgWMwF9eQKFMj2RnNPRsas+kbZfAmodzE3xFWpCsI0lOAFZZHMfJvsUtSY
         EqrpKVw0YEbkyYElU6X4xsGXJrYoTSxvL0dlf2Q8RQfjRF3imtAMQnoBaxSvTPtSBnsd
         8hzGiEjJPNLgaAMYSbdPltRfnksqE05dj4ZPutHykMSCZ/mSRogs1WbHbrUDxI/lCYz4
         ngJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=Z4P1gXUd0R4pFt873Igg2lnAb9IWJtzKG5/oeHRPzRrD4taTvtxS/KSARPg2DSqlPq
         +LNTA0tcb2Ub8C27FzvPyBIKM3/Is9XGt9x5/564j4xNQYv/DpcYSDhh677RwsP8Ep2b
         WoyfflGX84o9vGbq7Vn0fFqZxsMHNYckNlTT31QuIYtNdjrbHFu4sZmwQ3fOH6IVJyHm
         cQdTiiUo2uY7kCQ693ikBP1fMhh+e4rUcG17c/nNSLFjJ4BYvBglKjD3z1tJkAI3L98c
         +tS/LKJSXEgOfIk4+BTBdsTFvGzgtouwD4LhIo7LIpDtEvEMXt7iy1oh5NMTb0S/TEAD
         X1PQ==
X-Gm-Message-State: APjAAAUNporD74A0rny8iL82fdI3InW4JPbNL3ASkNRE/C9SmJP5DLYq
        OWRQBW4v/ZouhpMZh7HcUu1tMA==
X-Google-Smtp-Source: APXvYqymcKqIpAqu/yA09z56SWIcUHvFeO6IwFLJ/k5vRwPvn5AEcGhoHMWSMAENnnnyws5hqQZpRQ==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr950345wmm.143.1581040762397;
        Thu, 06 Feb 2020 17:59:22 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:21 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 12/18] arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
Date:   Fri,  7 Feb 2020 01:59:01 +0000
Message-Id: <20200207015907.242991-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

VBUS present/absent is presented to the SoC via a GPIO on the EVB. Define
the pin mapping for later use by gpio-usb-conn.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 501a7330dbc8..6d53dc342f97 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -4,6 +4,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include "qcs404.dtsi"
 #include "pms405.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	aliases {
@@ -270,6 +272,18 @@ rclk {
 	};
 };
 
+&pms405_gpios {
+	usb3_vbus_pin: usb3-vbus-pin {
+		pinconf {
+			pins = "gpio12";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			input-enable;
+			bias-pull-down;
+			power-source = <1>;
+		};
+	};
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.0

