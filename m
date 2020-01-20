Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F67AC33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:32:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07BE622527
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 16:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjhzdQjI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgATQb5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 11:31:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38804 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729541AbgATQbE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 11:31:04 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so100366wrh.5
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=JjhzdQjI+TWAYz1W/yWbj5v73/R2yaAsNLu70EMpS+qEOvlaaV4FjluSActlg4WFY4
         rAwBvSpt36j6czs8YgW9dtDQwu3NdidQ/G08DvOAObI5a0nhQq/KV1D6BO+ZyXNIaWDj
         bVwt4gN1yYlp3/98Dahc58YnHw1HEmcWpipqBed13sjZUL3xoImM1hQGxI3uOipni1zZ
         06SNw0hLPZKpEo6F01Ck36suztNkZ2xVIsCGbALl1gbT9Kjqa4dWk7vSsXHC47gXlv/M
         qACwlHWuOuRH0EAfg3dmHfodAo4zmnJEpu08g/FFub312mbInsECtth5DEYOw8QXmBoz
         MIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yws95nmaJZSmNzRJG51ZJDH/5MHh+qOjv+20GRqLWDg=;
        b=PdHDl+Y8UcBay9Bt+7lELGsG3ihoJLn/WCjFVSej2PZnyKqz+ybqXjqViA3I4/br/K
         YaFE3cdqkOL/cBUu45lX8iSjH5BU3ozv/von3IIXZfjCXOvNT3UT5Fc1NvMDgf3Bhy2B
         0qVUanXPeO7hiOEqnuDveiMMOc0Fuocrr1urXARYmxsH+ODd9LxtmQiOVxJKpUSYzyHI
         SjjNqcAP0wcDitKHF5rgLHVoSWH4IJmgVnwvb2x7ZdtiDIEmHsbAU6B5df+NoVdgGlr2
         hWCwUY6gHKLCdpuw+S5Wmy343t+Ql9RD/pxZf23/gmnDbNcRlp33lbMg7pOMJmI4GDao
         f+nQ==
X-Gm-Message-State: APjAAAWh82p5FdbWfwUKgME0hyAKT7J1Rw9+4laP1dNZtHNO3JFarew+
        BX+ap8qm2CpVKFo6frNa4w3t8w==
X-Google-Smtp-Source: APXvYqxmOZCSEA6GQloH9Buo4cUZ/wrM1BQmJrm83dbNodgqFFA3OF3cv8qxYTmhpFI31XBGoRqBGg==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr331993wrr.286.1579537863155;
        Mon, 20 Jan 2020 08:31:03 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:31:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 13/19] arm64: dts: qcom: qcs404-evb: Define VBUS detect pin
Date:   Mon, 20 Jan 2020 16:31:10 +0000
Message-Id: <20200120163116.1197682-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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

