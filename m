Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4317CC0044D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AF3620757
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 19:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lydMUqD/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731013AbgCKTPQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 15:15:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34052 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbgCKTPM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 15:15:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id z15so4139318wrl.1
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7bRjcqFkN2E/+4KIrK48jV+JLqx1FghcnIorb93T/eA=;
        b=lydMUqD/qQqb4NmEt19y3aDFglH7QjMpDZK4mSJnhH8fBLFNA0WVXA53okYhiBBk4L
         +EEJIE8SGvoBIABALTjx0NyYQV1iKWEBlnFVU/bia9DhSi/mQmXrHHwffILepWEwsdzd
         uevzMDFNOC8qV3GFBCs/fKtphnd2fuwV/QKcR3wY3S67pJBfG9jDVVc2mkVdS/4zAd6k
         xl7GI+Br2jiA7sZi1Kdo03MOCWbRKVdygHLYVjY2Wb6FUatpXClFSKqsu/hc3S23BxaE
         B/m+fugry0/oN0sZWsWmuF9j6NWF1lfrAj20p3aczRGDAnAVxhQSDQzx+yXYgK3OYXns
         Ln9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7bRjcqFkN2E/+4KIrK48jV+JLqx1FghcnIorb93T/eA=;
        b=g/dJBoMRoZZh1+lX7sWpwqSDecc/w31LGAv8mFIzvKAeCy4b5nDnbIP1kANFGDicEJ
         JEDUjAGhtVWM/1FhmZJsBLjNSU71YPqVPQCZEogftpXzlwuGw2i2ff+mhr427U8zvqDX
         xHyPUbVL30Z+l/tkwYGIGAQBYuOuwDmPNHy70dQT7DiV/HdQ+2Y+U4gkeThT6QBbqkYY
         qNI1AMEgjs2j3+MHt49joQ+EhNb8G+/fRbdjH9t9E9/Xh/WsO57M1bmxtiTJuo/HH+EP
         1yf9d/SWo7a1XWGgiPLeWyZBgcNVPa0jleESBysiQmyI7EzfANVn3O1RA5+CXKMRGqbg
         KRnw==
X-Gm-Message-State: ANhLgQ18jHH0fxaIr/XnCvkCVoLH5Zuc4sogPgDYbXysjFQFV1b4CMH5
        DAmN1yjG5R7bZoaEMfU7Za3J5w==
X-Google-Smtp-Source: ADFU+vtvAOkVEpVHj6kBiwJ5k7QJBkvLfgLVjEBQpl2Hx3I0Gy9j8faRiHWcgsgTVtDYnMGAAfxWEg==
X-Received: by 2002:adf:f504:: with SMTP id q4mr5772708wro.28.1583954109743;
        Wed, 11 Mar 2020 12:15:09 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c85sm9687437wmd.48.2020.03.11.12.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:15:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Date:   Wed, 11 Mar 2020 19:15:17 +0000
Message-Id: <20200311191517.8221-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
References: <20200311191517.8221-1-bryan.odonoghue@linaro.org>
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
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 44c7dda1e1fc..4dc3f45282fe 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -319,6 +319,46 @@ pinconf {
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
2.25.1

