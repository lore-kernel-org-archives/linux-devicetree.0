Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD48C18E5A
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:35:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5519C20873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuFRQGUw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgCKMfI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:35:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34093 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729286AbgCKMfI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 08:35:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id x3so3079084wmj.1
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBDvlQYuE7oNVEONMOO8X/XPChxn1w8gmsgCTidgsCw=;
        b=IuFRQGUwIPudbPryb66bcSA98/I2fxKUyrPgEpzM7Mb1lLK/P5FF7MyO9h4p4VuskT
         Yhj5pXVHXTjcli+/HkP3VCsvmL+0g7IDTKiR7iP8+19qQezBMpShkj0kc9XzgONY9raR
         3g/ISgcPg3tku4y6jDUrfUqWQ4PSlKmyYwjAhVUV/HQrAq588PH7mliHe1N9X2CsiJaS
         Vh7+v4NBPDpqXijwB5Q3YUjjz5RacSyPKqEoZ1sHQ1iQQF59sXVnvba0AZXushksIgxf
         +eWPmswyHwbr3v1abaV5i3iPcYkzE+S0pQ0L57aPZzswXFAsFlBiiXkt5SXrAqu5t2kd
         Im7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBDvlQYuE7oNVEONMOO8X/XPChxn1w8gmsgCTidgsCw=;
        b=MlYUJyymsjNyHDqidRK6YSwQ9LU5zNkBKHHBKai9L9+zlhiEGcIWgdkBIJKPGSJf47
         EL8vDlGii/EAD7Qd9EdNR46+QvfTTgW3luBtQsOKxArOk+dWvBtozqvrtJWYWn4HT6wp
         If/dcKzMShHJgME4bZ6IvoqNDYIQBIYabrrq1xRdLLftY5WRwz8bKE7yP6GbJqFgz3Zm
         mBN1ltMhydSwFoF/PXQ3/bt9pCygVejXJrOy/FWNm1pJiFAgfG40ltn6Xd7wKPggtBEh
         +oo2HbA3YTIfmynlN26550mWbWf/kTWrwF96StI5BmFn1V+o08HFtul89Ew4+wIpG+pS
         fbgA==
X-Gm-Message-State: ANhLgQ1C3Zqs0Ov0jtRaIxnBmAiU6pKqwtcxF4kbaQLfUYE3+9X4aCYs
        HHp032zUBmNGgAZxhQi+NZgtnA==
X-Google-Smtp-Source: ADFU+vsQz6jYa7lO28kY389afQXTOf18x6yaQthL0HYfPi/AgNw2jQwmb4F0so/4szpPJCmFHz6GRg==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr3724311wmj.59.1583930107055;
        Wed, 11 Mar 2020 05:35:07 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:9087:3e80:4ebc:ae7b])
        by smtp.gmail.com with ESMTPSA id m25sm7822732wml.35.2020.03.11.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:35:06 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        maxime@cerno.tech, leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v1 1/6] arm64: dts: msm8916: Add i2c-qcom-cci node
Date:   Wed, 11 Mar 2020 13:34:56 +0100
Message-Id: <20200311123501.18202-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311123501.18202-1-robert.foss@linaro.org>
References: <20200311123501.18202-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064f2374..afe1d73e5cd3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1503,6 +1503,33 @@
 			};
 		};
 
+		cci@1b0c000 {
+			compatible = "qcom,msm8916-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb", "cci_ahb",
+				      "cci", "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <19200000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default>;
+			status = "disabled";
+
+			cci0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@1b00000 {
 			compatible = "qcom,msm8916-camss";
 			reg = <0x1b0ac00 0x200>,
-- 
2.20.1

