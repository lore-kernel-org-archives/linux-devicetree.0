Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847CFC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 02:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 457642469C
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 02:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yqr0M/Nd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgCBCJX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Mar 2020 21:09:23 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36772 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgCBCJX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Mar 2020 21:09:23 -0500
Received: by mail-pj1-f67.google.com with SMTP id d7so773135pjw.1
        for <devicetree@vger.kernel.org>; Sun, 01 Mar 2020 18:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Y617NjPV2w0ps+7DkMU/HSrI2+VaICeo3Wmn8yqjrI=;
        b=Yqr0M/Nd8HF+aGZNYtnaqApjbKNmUfJzIkxfNG78niHql0bIYGw/HmZsSz8UJEnHui
         P26sITklXpwlFTmbB5sf4gLJed2jbKdyqUYnKnhgiQJobwT988DqsMpePkywIlSdj4CC
         iculfj6zghd2otF8wYE0m4rSHNEkPsn7+L/IL89fSsaKPtbNOzDuB3H9utHpQSrndn98
         2ToAnUEoU43XyAkGgRhVZF0fn1efgvKI5Lzxvan50s4COGHKQeKUuOCvCXY0CqGxuwmx
         0JIFsML4gI94JYAEH1Kj4X/qgiFSCYJ0sZes+WGrHnnymMyZnz8NGShNRb3KVUWSr/7S
         gOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Y617NjPV2w0ps+7DkMU/HSrI2+VaICeo3Wmn8yqjrI=;
        b=CyZIH9AiYpeMUcBOVut9KOvVqlSqaobA8MOYu+x4zdaILyVMkr1KHVo/DZdkTcPJdF
         2yB9UOZQKZTjHmHkPx7WLcRpj6gW4MUXsyi9zgIHazzonMy7M9aS73zKPPxSgmKYmMKd
         y7fHiVzHKK5iz38Hxy0IrG/J+vd8ZBd3IM3VyY6Pq+/pFaM+Cc10mxQku0MpudPZ7Chv
         k5fSUFc33uO7sk0zWRBpFcBLDphjHEP5ME1VQ1oDDbX+wiuZLBq1zWRzRBhN3caZswRO
         kg00P3WZFuKksiyR1f8F3hB7z76Y7xQ5UqII3FiqFQzOFRsIc5HRUVVIKkVjosMRUNg0
         rCYw==
X-Gm-Message-State: APjAAAVwX+dmUgPF/ZwOvGy3B51YSV+OPWnu2lJRyRXyeLU+/ijGtei/
        W1SKzBZ10TgFaXdbsC8R/XmDMg==
X-Google-Smtp-Source: APXvYqxfWyEPbC+YVHwW6uh4cHK4f4uu8GCmPDe2S9W5MvePPjMSTsJSNaOeLDNfMtXpLd0yZXczFA==
X-Received: by 2002:a17:902:524:: with SMTP id 33mr16076380plf.241.1583114962362;
        Sun, 01 Mar 2020 18:09:22 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o12sm6147522pfp.1.2020.03.01.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 18:09:21 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-mtp: Relocate remoteproc firmware
Date:   Sun,  1 Mar 2020 18:07:57 -0800
Message-Id: <20200302020757.551483-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Update the firmware-name of the remoteproc nodes to mimic the firmware
structure on other 845 devices.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 09ad37b0dd71..fa7f4373a668 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -50,6 +50,7 @@ vreg_s4a_1p8: pm8998-smps4 {
 
 &adsp_pas {
 	status = "okay";
+	firmware-name = "qcom/sdm845/adsp.mdt";
 };
 
 &apps_rsc {
@@ -350,6 +351,7 @@ vreg_s3c_0p6: smps3 {
 
 &cdsp_pas {
 	status = "okay";
+	firmware-name = "qcom/sdm845/cdsp.mdt";
 };
 
 &gcc {
@@ -372,6 +374,11 @@ &i2c10 {
 	clock-frequency = <400000>;
 };
 
+&mss_pil {
+	status = "okay";
+	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.24.0

