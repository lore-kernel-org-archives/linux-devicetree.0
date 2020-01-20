Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEDFC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11BD42253D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLzmT+7G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbgATQbI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 11:31:08 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45528 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729585AbgATQbH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 11:31:07 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so46550wrj.12
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=ZLzmT+7G1QN2Kl52lracr4oWkYEPK8VZDgUoaX+8kglatJZ6qSTJZTGfqjjZc8sMqH
         HSEFXPwiLDj/K3rPp1aNqHHMoWNati381iodNxhdYSONqgxEkFt2cPRwxJFqbwvX69vz
         41iUrrHUkJ1AVlw5TOONlRp+yy5YVnlSg43Xa+31g8UzsIB9aBYuOTDVio6l23wtRb0i
         6i7DGHKTgBz+HObpdXH36jpNhIPHQlXrC0bvTD6rxvJroz+rRlHKasPgPzLEMd+8ctJ3
         mGzWiAEneMOJ+G9Px7+1NmjiDR4x/NsAWde5SFLF8Y9OBTh/IwmWhQvIynLaIVcGQngC
         d6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=koutqywy1b4NRt9QVs4i+hWCV8wBQZyxQmv7mEMbsxnZS/68p1bMjltyl/GlH3Erhz
         jeBpnjHzkVQ4GcaenrI+WbpgsQL1XjicwRJw0Rx7YCkzeTvxt3m2MiDOCIfiakOOb/4f
         LmfH7VNril8iWsnONkrt69XhBTJcI4xtoqJ/fjAttzRLMgdERcZGgptIu+/NrXnktdtb
         evjnESpKWQ/Ha5gD1TAqw9qoIOELYtih3ybm6HxotuouORhTMMWYFCmiJ/9/ePOV2VUu
         JgduXiA3PRYtNkUJWtQIOQeuq6wJI39lMUoa9JDOdnv0Nvczz7DuAE90TYTnMYEBS5WP
         81gA==
X-Gm-Message-State: APjAAAX0fVwx1EZSHmREOHdEUvQdDD+pIqj+QQV8Xzsb2TnrQV7pXbiI
        0g5L2YGM4xIjSBoZJUAaX6le8w==
X-Google-Smtp-Source: APXvYqwsxlu9k7l6Uw+nDOZ0lR9INBaTqDEMiEHikJEgxASKQmp85XSc4MCElCe4yAI8hCM4Y4FHWQ==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr283291wrw.289.1579537865228;
        Mon, 20 Jan 2020 08:31:05 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 15/19] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Mon, 20 Jan 2020 16:31:12 +0000
Message-Id: <20200120163116.1197682-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The USB ID pin is used to tell if a system is a Host or a Device. For our
purposes we will bind this pin into gpio-usb-conn later.

For now define the pin with its pinmux.

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
index b6147b5ab5cb..abfb2a9a37e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -270,6 +270,20 @@ rclk {
 			bias-pull-down;
 		};
 	};
+
+	usb3_id_pin: usb3-id-pin {
+		pinmux {
+			pins = "gpio116";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio116";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
 };
 
 &pms405_gpios {
-- 
2.25.0

