Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FDFC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 17:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD5F920873
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 17:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MuZ/MiO2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbgCCRMT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 12:12:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35255 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730732AbgCCRMQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 12:12:16 -0500
Received: by mail-wm1-f68.google.com with SMTP id m3so3673372wmi.0
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 09:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LBQ2v3hA6tUuTQv1F+Yyise6oBp+Wr4OulTkBt8Vu4I=;
        b=MuZ/MiO2WECej5cula13eoTtSplGql2nE4/SV0KTwBnbu1ULqTOwYdxwhA9dTioSVG
         MDF6Y7w6EF/Etsd0sds4bS4DiXQTLMO+O8Zruq5mrFfU75ahUKCpn87rQgv8Ugz5orSd
         pehyOiaNqPHFgkt1lCDbVz5qGvx3cKrxm2G8HzeLddue7+pdhcwZTIPRO6EI863Vcm8o
         NmLGUNMw3OnmCblBtEnOzighvjaiLNgv8LDvFApMorKHn0R59sJafAMM73Q2PAkzMZLf
         oPuC1UGwO2skPUuXI0XyyOZB5a0THy2BFygUAHJAoARhWovvYDNtv/S9y6Xk9MM0t88A
         41qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LBQ2v3hA6tUuTQv1F+Yyise6oBp+Wr4OulTkBt8Vu4I=;
        b=Qp2/UFOeqp0MnFNQgz+5CLTk9Qgo1I6XyNStHMWPMMY/miL7woNTThBSplRMTUT1OH
         SsPrfAvxYaY1ZFiL0GHLGbh0rCaFw4VZZXhjwgzyE6BMx93IQXgCcOLt7wKIbviBrixI
         4sr//1sjiIWc5yeh7haPlx0Yjv+x0ar9Gk3AOgAPXkkTDfkkuVKMD88CG8hciwbPxyoo
         1czxqmhg2n69YDPEPWIMZM/jbEigKTkm7PE0hhUVrcrWjx8oDbnqwaEmrg2onG6z996E
         c9cLJXznRTUKZx9F62SazqNRvoJf0G6WgAJaygPPLpJCcg23AKlZdSDpLLeFNDuYEb3d
         cyiQ==
X-Gm-Message-State: ANhLgQ1Ekw4seWBmMJzU4Ab3gWsBNMcotFlPhKzKygHlwNDwLAl9TVfl
        N0FDWPu5Zqj5Lr3wvqHffrb5lg==
X-Google-Smtp-Source: ADFU+vtjKGrY2UQkokTzHe0CV7rbHBSu/5iKmuaPRTnpGoKYIJ2QcJzM9XpasbAPE/3CsG61MXPzIw==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr5143834wma.87.1583255534987;
        Tue, 03 Mar 2020 09:12:14 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:14 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 18/18] arm64: dts: qcom: qcs404-evb: Enable USB controllers
Date:   Tue,  3 Mar 2020 17:11:59 +0000
Message-Id: <20200303171159.246992-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
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

