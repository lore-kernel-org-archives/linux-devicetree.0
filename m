Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F95C33CAF
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 18:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F402624673
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 18:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EACekihj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgAVS4i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 13:56:38 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40707 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729340AbgAVS4i (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 13:56:38 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so182237wmi.5
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 10:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TYQNQQWESi4gKsyKl1vTO3f1E3mp/r/avow7BgHKMw=;
        b=EACekihjpCPMuOqdeZaEjVRHAd/Nobwhg9yODd2M/hZHedkApPn8slvoG9T2pBI39L
         XDk82lRDLU9B9xV8Bx5mfx6RI2SNXEqCXD8kOJXNi8PEu3k5wxPp5cY743k/FZzNBpjR
         zgEBxu+06xNAMyYJYk8nyudSpf/l0G3qDxLQwaEb2lZ38fO3LpepH9nE2aBor+ek8o8z
         L5qj0F2fXq02YhiH6rMll2KCB+/KESOOajBQkmso3N1Pk/9PoIoh/I55PdJEFjiSaOnr
         moWt3Hryn4u0yJeUQLL7f9+tRudAZn0AknxhmOZwuFLdVsLfuUqCrCM8AooW9E9DqyID
         eSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TYQNQQWESi4gKsyKl1vTO3f1E3mp/r/avow7BgHKMw=;
        b=DauiJ2MoYs5jthjFkakRLjJCp+fKAcCdy0aZZ9qZlyv8eRP+aYreNPHB8idGCPEW+/
         3qflX+ZV1iq0iz1pJzGgzigYEAZz3UNGRMuxGgqrnjFHs/1y7Dnam29ih5eEUN7w5QWK
         oP0M4byTbPQk0eGp7X8EInDNq8t1JAt8+i2dbxW5qqN0JcZWEjuChDaRzRZbgDS0DYqc
         yjmcuEXeEhfRp7qzWCGPTAxJqtl2DKFkSZ1IngNMVGcmGEMtCNQFAdY5pdo/eBOg4w5P
         WMfPMdVWBQeJ6k8QKJ0v17MzLhyheYRz4MhoEfTgp2xEl1qBC1vilguDaWNcKWPltrcQ
         1MJw==
X-Gm-Message-State: APjAAAVUcwExHmfIvsJdSIt2Oj8zrgr4MfmVioFKvy0wk4aqFXRRy3Lh
        8KXapi2J0bsWnYfSR7OgIRiZBw==
X-Google-Smtp-Source: APXvYqwFeZF6Nc6JIvCGJNF9g5Rv0fQCMT+vAOEUUcrAKz5qIfdz87a+PSp7C2abxVLFjFKkp7Lccw==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr4356860wmf.100.1579719395769;
        Wed, 22 Jan 2020 10:56:35 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:35 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v3 19/19] arm64: dts: qcom: qcs404-evb: Enable primary USB controller
Date:   Wed, 22 Jan 2020 18:56:10 +0000
Message-Id: <20200122185610.131930-20-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch enables the primary USB controller which has

- One USB3 SS PHY using gpio-usb-conn
- One USB2 HS PHY in device mode only and no connector driver
  associated.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 07d6d793a922..a2cbca3a6124 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -329,6 +329,35 @@ &usb2_phy_sec {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+	dwc3@7580000 {
+		usb-role-switch;
+		usb_con: gpio_usb_connector {
+			compatible = "gpio-usb-b-connector";
+			label = "USB-C";
+			id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
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

