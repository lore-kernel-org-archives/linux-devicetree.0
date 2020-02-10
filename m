Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E9FC3B186
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 12:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E2C221569
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 12:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUWsD3xX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgBJMHp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 07:07:45 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45340 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgBJMHo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 07:07:44 -0500
Received: by mail-wr1-f65.google.com with SMTP id g3so6266890wrs.12
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dlgrD1ImLwD8i7swr2073g2/em63RPZPKMG2q6/uiVU=;
        b=uUWsD3xXPNWZCRZzUdS2YN/EuB9ZtVVSLw6IxS8dRj1eSMq7dCiwtNaRO+3bT5nc+D
         VghAfZAv1tc8NYEvA4SjVupe3sQsVYzxaOi+k8q1lKOMZzSF5tGH6QGGiXWc/t+BAEBD
         18koliwiRZIaIF6BamDEYehIJHr/8LNtGVTkC3nuWVTMroC3pz/I2CUuVfEPopMQDDTH
         pQ4RIcaVXpcuLU3PcoHXlBuAEhkF79HpHzioumIlF4YrwZ3BoF+9L3aOGftaH5kKHKVo
         CfO5vp7Mmuf6KzjbAvH7O6Owyj/owr3ggtFigip/ke8qLI/W6F6O78AlDfTzGozIfff/
         HrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dlgrD1ImLwD8i7swr2073g2/em63RPZPKMG2q6/uiVU=;
        b=sZ1YJJjegYlCb698cRUINmd59oU1ocRZ18W/VM9BvoP0rL1ufysTNgqanJTipFNzvg
         KOUNl2aoT7dDo8K6U0jbPFxKr0LiI4nlbuY/V5idzqxyTOL/Kn3zLbaYHI5gw8MkovXJ
         Ql+HZqOKgVG92YmDeKm0Gynav+je+M8GlOekCUttijEJPWl9ah3RPER2pCzeVLDlvbT5
         RbG7kpXYfWD1/fVtZPXo7u69/YN8Plrg42gUTg4WVz8zW980UvSzU3oK0POu15C8W7La
         afegMhcuk8Td5/NGS/5wsQ1ihn8G0t/KUaUFVnPafrMngtCWi8OL2COnqNcWShjV3AML
         9RFw==
X-Gm-Message-State: APjAAAWfW9oLV4M7IoLxCXZ1XjNk2ApzYdo3QdoJbWN3LCYWE7KNgoE8
        oY8/uzIJfcOJ5Rt9KokUundxOg==
X-Google-Smtp-Source: APXvYqwTicbL22mHDUW1ie+v1PtpkNYflJpxuGDJn6zmsXhpmjJ4NFJzieYb8MQk8zXmSUJGKLMw9A==
X-Received: by 2002:adf:f10b:: with SMTP id r11mr1633083wro.307.1581336462595;
        Mon, 10 Feb 2020 04:07:42 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:42 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 18/18] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Date:   Mon, 10 Feb 2020 12:07:23 +0000
Message-Id: <20200210120723.91794-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch enables the primary and secondary USB controllers on the
qcs404-evb.

Primary:
The primary USB controller has

- One USB3 SS PHY using gpio-usb-conn
- One USB2 HS PHY in device mode only and no connector driver
  associated.

Secondary:
The second DWC3 controller which has one USB Hi-Speed PHY attached to it.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 0fff50f755ef..4045d3000da6 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -318,6 +318,46 @@ pinconf {
 	};
 };
 
+&usb2 {
+	status = "okay";
+};
+
+&usb2_phy_sec {
+	vdd-supply = <&vreg_l4_1p2>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vdda3p3-supply = <&vreg_l12_3p3>;
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+	dwc3@7580000 {
+		usb-role-switch;
+		usb_con: connector {
+			compatible = "gpio-usb-b-connector";
+			label = "USB-C";
+			id-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+			vbus-supply = <&usb3_vbus_reg>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+			status = "okay";
+		};
+	};
+};
+
+&usb2_phy_prim {
+	vdd-supply = <&vreg_l4_1p2>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	vdda3p3-supply = <&vreg_l12_3p3>;
+	status = "okay";
+};
+
+&usb3_phy {
+	vdd-supply = <&vreg_l3_1p05>;
+	vdda1p8-supply = <&vreg_l5_1p8>;
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
-- 
2.25.0

