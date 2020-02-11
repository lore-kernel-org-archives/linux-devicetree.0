Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9053C3B186
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B30952082F
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krxFBIuL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbgBKAwR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 19:52:17 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35546 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgBKAwQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 19:52:16 -0500
Received: by mail-pf1-f196.google.com with SMTP id y73so4574550pfg.2
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8+iy7pVN4WE3jutHz5qWVqRqdhsfXVc/4DMY70bYKQ=;
        b=krxFBIuL7oKSbZcqFj1jVnlp3lrMP84d2IGovq34cVVYAhbvsdfo2xtjVTuHRHzcHW
         Ul+m25Diga040b2BWpWkTKMuejH24MHC0kNpWlKeJwBi3MP+dMUEqF3MEl8/CBnBC3zW
         j2n+5n9RHv5Sb0Q0QX0XqOn9Y0AajR7nTvj4/oy0ApKii9/kxslgo6ryTuzKttiA3Zly
         Ymv+snierXvMsL+GsvI2XTVOIn0mV9aJoFfJJBlB1XaUMnagRi/2QabexTPgGnBmVCga
         lgoOfBo9Mz7BvDwu9YUlpEfdRWYuyYnkOqex7849I5GyGINClDwrfnkM8So0t/cIYNro
         Limg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8+iy7pVN4WE3jutHz5qWVqRqdhsfXVc/4DMY70bYKQ=;
        b=MmWaSMt7UwedBBL8OkiUhkHtNcfWlm9s03Z6u6ayrQHWev7ASraJZ1TE+W906pXkzM
         z7Xuqtu90muKnHMUdlYC0/3lpO/1zQaz+nWbR0ukum4IHdFEHRUTDiFrsG2MLzTKgDGP
         h1Y3DTWhljXVcyl5Afs7ntCDUWiXOz9A8/+BWPX+UpepareycJRS5krQAzAyyGDh9mkD
         5ixOxkBR7yfTnMpgZPvWGZ4QwFGEsux6JvEJV44vZ8bd1LRT3Hcr1S5d4Z3usgThxt0g
         QSbaPa3IriARtrARGaaKuv6aeqloobN9+sIZS6vXJE6n37RjdC2NgGUTtt/vex8FuwvW
         qytQ==
X-Gm-Message-State: APjAAAUeKPXDIz2RT4OCr9S5i/U09mn2h/W0DouLly/tx/pWAp3n8PKc
        Yg8xG6npK0oxtqIE2CXzgVM23A==
X-Google-Smtp-Source: APXvYqwzEs01mneR4MjC/kY7F3XwSiwiWb6bslc15hzLTqaoTFJRvKVCPb8EQ9uh+djJtwD3r9r7kQ==
X-Received: by 2002:a63:2f46:: with SMTP id v67mr4526056pgv.220.1581382335751;
        Mon, 10 Feb 2020 16:52:15 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 5/8] arm64: dts: qcom: sdm845: Add IMEM and PIL info region
Date:   Mon, 10 Feb 2020 16:50:56 -0800
Message-Id: <20200211005059.1377279-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a simple-mfd representing IMEM on SDM845 and define the PIL
relocation info region, so that post mortem tools will be able to locate
the loaded remoteprocs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Replace offset with reg

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..3443d989976c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3018,6 +3018,19 @@ spmi_bus: spmi@c440000 {
 			cell-index = <0>;
 		};
 
+		imem@146bf000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x146bf000 0 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible ="qcom,pil-reloc-info";
+				reg = <0x94c 200>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x80000>;
-- 
2.24.0

