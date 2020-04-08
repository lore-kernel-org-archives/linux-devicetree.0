Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECC0C2D0EA
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FE2520757
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aFWPOjD+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgDHNKt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 09:10:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35943 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729020AbgDHNKs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 09:10:48 -0400
Received: by mail-wm1-f65.google.com with SMTP id d202so5394902wmd.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NlDlRv555GH3IWzPThM2PIkVo5dnbd1J1aXXNjhdRgU=;
        b=aFWPOjD+POZxqE+i+gRicc1Ttn6UlDSIUKWVEXYrw6mfX2v20gZgt82l4KRhjiIe9A
         b7eh6/OF5TAIN8zLoLVxFZu6TXaYtFE7/efNaS8sZKDyPnHEaYTT/n35OdxMY05APuOt
         rlWYwUne8HTx4HnFmTSaPsuQsXqpfgebNO4ZoJARRorQ9DkoYG3cYPagjmaYqCRxy/5p
         rnFMxw1K+6Rzmgrq1DW3Fnq4at0dmmS01p0cbFLJdKNnxjXp8BkfZrycWl7oUXu+s+cK
         d/adjUK3FZcpZfWktEdbNJoad3EocqLejBbg1sRQ265bF0LqSaopWWshBlwmpvodh1TX
         BEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NlDlRv555GH3IWzPThM2PIkVo5dnbd1J1aXXNjhdRgU=;
        b=Nfv49HdzYt5hizlp+PEsWQi6cuJkMjPzHnGu3JZVbh9h9jXM5de1s8hdQQaxBbBAx5
         yKEB/pXMbUA3WTE3KyMPlWUZ5+NQs3JX2kvFuNq4lk4IcBcl+0TEqqP93CL7SAcN1Z58
         AylF8Ztv2VLIisWn/d07ozYgE0U4OgkmjJvRNIDfmLjNmTIQZ0xetDYy2U9gB6IySIyp
         X2nwbWj1q+ymBUwMkZYRrRAGtMEvLSeYUVdf94/m6CKz8M8zpBA6heMWvvJ7L4vDH4/3
         zu7aWAn0EOi/enJ0HFgkSzGweMELfURObACsCVaSiCytPCTp/90wmCBInNkU7S5MbCL0
         c8PA==
X-Gm-Message-State: AGi0PubHI4gFjsyWzuJGo9GxxJH4dVwLYgKFegHpNgZNp4ngFV0jqhoY
        +wuUHgsQPeKetqg8dR+Ha31S3Q==
X-Google-Smtp-Source: APiQypKFGiJ+gX60BLbUE1LDlC51Duk6XfC5j/frP0y9C+JdDx5KsdFSZwr18YptOjMFQlBlrJHuCg==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr3107514wmj.125.1586351446839;
        Wed, 08 Apr 2020 06:10:46 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:46 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 1/6] arm64: dts: msm8916: Add i2c-qcom-cci node
Date:   Wed,  8 Apr 2020 15:09:54 +0200
Message-Id: <20200408130959.2717409-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Add label to cci node
 - Sort cci node by address
 - Relabel cci0 i2c bus to cci-i2c0

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index a88a15f2352b..cad0ac482367 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1603,6 +1603,33 @@ ports {
 		};
 	};
 
+	cci: cci@1b0c000 {
+		compatible = "qcom,msm8916-cci";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1b0c000 0x1000>;
+		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+			<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+			<&gcc GCC_CAMSS_CCI_CLK>,
+			<&gcc GCC_CAMSS_AHB_CLK>;
+		clock-names = "camss_top_ahb", "cci_ahb",
+				  "cci", "camss_ahb";
+		assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				  <&gcc GCC_CAMSS_CCI_CLK>;
+		assigned-clock-rates = <80000000>, <19200000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cci0_default>;
+		status = "disabled";
+
+		cci_i2c0: i2c-bus@0 {
+			reg = <0>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	smd {
 		compatible = "qcom,smd";
 
-- 
2.25.1

