Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9DCC3F2D9
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 14:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 531752166E
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 14:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9wWJeab"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgCEOyC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 09:54:02 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:52128 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgCEOx7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 09:53:59 -0500
Received: by mail-wm1-f53.google.com with SMTP id a132so6659564wme.1
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T64BhDY4P7BH6N7mZRt4GHgX2fhw+FmEfAXfzxtpWvY=;
        b=Z9wWJeabu7EJefkYOIj+P/cmEeY6RWiE6YqVxMZi4GNu94+Mbb9b2IkoPnTfUwsoat
         quh3gQkHQOZdIjhgNEd9yM6khogubrKHLuhC7t6TMOY7PtIYhqfXw4Sahg28TStP/qMY
         mx67UfasNptCEM0BEC/m2D58vRYmvMhy1rKzZSUrki8g4fPIarXoGgjnwa9LaI/ANJgf
         yoqmwRLtqZ4Rzt5zrrKlMu8KCUFCDdVqPI6lXvPw33+oUQ5t58pwZVqTdgtKHzaIJq8O
         Y80w55laQFy5YKsO8rIWZBb8eF/D16vbIWL/ySmJwMshGj8HQZ3YEPfD7X/VN99U/+QP
         lcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T64BhDY4P7BH6N7mZRt4GHgX2fhw+FmEfAXfzxtpWvY=;
        b=eop1wFX/VPs6DuSgLTTYM1fJQccYj7JfYsZoXrnBNlzi6I4Xmt15kjnQwHyjJa9aDR
         +Tc8WLqktq1Up1QKQyOjkIYugxajag1KwfOQjrFa7TDvjS+Q+3hfM6nSO3jxSAKJw9BI
         sI1hXCBaOwLORvUz7Ai86L9SRO5E4EDk3hiq2zAIKLqyIQXBKfvobFD4fr1poxSm+QBp
         ZVHUfEdBSelw01ET096P+abFIbO1Dbzv1tpb+w7H3KzH52/Dr1URmURrIGnXjJb3J0ey
         y4rUSiOv/nv2D3xStUsVHF2SYA43RLYFoFq1TRkeZIkFh87enPaI4iAqgMFBoJZvgz8Y
         WBmQ==
X-Gm-Message-State: ANhLgQ3y9WnNn0vczFazIhQfecZQzdV6spd+esjO3iWSCRQiq/+1mGKn
        MJNOse/pia30XfdNbJ4O7mfhSQ==
X-Google-Smtp-Source: ADFU+vvXZ5YJeHGJlIdkbo9OsuH2BSu5AF9PVb9/sLJ1fMQHgVzp5lUXGtexk8eiFBfudPbWoHdilQ==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr9833114wmj.70.1583420036777;
        Thu, 05 Mar 2020 06:53:56 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f16sm35785985wrx.25.2020.03.05.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 06:53:56 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes
Date:   Thu,  5 Mar 2020 14:53:44 +0000
Message-Id: <20200305145344.14670-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
References: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds support UART0, I2C0, I2C1 and SPI0 available
on Low Speed expansion connector.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 350d3ea60235..fd2bdf10a4d9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -434,6 +434,24 @@
 	vdda-pll-supply = <&vreg_l26a_1p2>;
 };
 
+&i2c11 {
+	/* On Low speed expansion */
+	label = "LS-I2C1";
+	status = "okay";
+};
+
+&i2c14 {
+	/* On Low speed expansion */
+	label = "LS-I2C0";
+	status = "okay";
+};
+
+&spi2 {
+	/* On Low speed expansion */
+	label = "LS-SPI0";
+	status = "okay";
+};
+
 &pm8998_gpio {
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
@@ -574,6 +592,11 @@
 	};
 };
 
+&uart3 {
+	label = "LS-UART0";
+	status = "disabled";
+};
+
 &uart6 {
 	status = "okay";
 
@@ -589,6 +612,7 @@
 };
 
 &uart9 {
+	label = "LS-UART1";
 	status = "okay";
 };
 
@@ -674,6 +698,16 @@
 };
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
+&qup_spi2_default {
+	drive-strength = <16>;
+};
+
+&qup_uart3_default{
+	pinmux {
+		pins = "gpio41", "gpio42", "gpio43", "gpio44";
+		function = "qup3";
+	};
+};
 
 &qup_uart6_default {
 	pinmux {
-- 
2.21.0

