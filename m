Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6375EC3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 18:14:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 436BF20705
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 18:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1h0aeVu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731084AbgEDSOB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 14:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731776AbgEDSOA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 14:14:00 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3BBC061A41
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 11:14:00 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id h26so293636qtu.8
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z3nW96fFZYnDn8jk8+VYyojQcEjzERa3OD5pCIlBdho=;
        b=K1h0aeVunNzSt5ERI2Q5f1AdAZ3vbRcewfdgTDjWr/DOw/0bFRJyHo5X3G1b4FH9Xu
         gr4v3njy+NCCtBeUGcdM6EZfJjBU6Sb4QUbjBMA1Kf13psCgtumNxIH5kyXKgupAOryp
         IQhYOQHjNWrgm0b3KRupuCNtFivn+Gqns6Zb0HPC4S3bQY3xzBOxxEUeNIDvpR6c8JPA
         O65YVwhn7Nx9KOa2gtSjrvavv1qiH0w42V+gZdqaIAPrDgMfh4SLBo6u3sD/DfiY88EK
         OMf9ZIRY2El4ZvVgtPG2UoIZkbB3A4Y0bllnjIo9M+x+MzBKenOUkIRU2d1Rhgahl7ik
         W28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z3nW96fFZYnDn8jk8+VYyojQcEjzERa3OD5pCIlBdho=;
        b=dIS6w+IbW9GL/ZYvndjSMoF5j5F6FZyYsupFg6vmKNSi9aemgEC9UU8BODwD5puKXf
         Us/tbO0Db98Srk4+iFtv0M3x05Bq5SS5trP1A1kSD6wA4X9MaV153jKxtgLhzMceg+JJ
         mB7RDEFOEWornuw7J4hHDpuWQobWN+zy7JB5/3HjUDZCFnwrV5RxpYF3/3G5tk2IoQa7
         q74W2VQliI5o683tdifDzc6sx50ppPVhnJGTw4F0Vt5xIBnS5hTFCkD1kY1aOhd32cHt
         7i/ZM405efFxV6yCAN3f7grLCpkr0E9aBeqVZDci/tBLY+q28GV0C2CcpGo3cuEZjnv6
         ZaPQ==
X-Gm-Message-State: AGi0PuZvVrcf0zgqNQ8zE34efd9SjEOMfWdDfD5pmMN+2w6jYdkAt7Kh
        pkjg4wG+8hPzx2NgWiQz/QwPVvVeSCo=
X-Google-Smtp-Source: APiQypI4Oi2r4p833QHi40cXGxwDFX3mON5ouXXX22y6pe3WuHg5/KcOdeA1C0f71wZ5egHt2uEuCQ==
X-Received: by 2002:ac8:1c35:: with SMTP id a50mr389657qtk.286.1588616039180;
        Mon, 04 May 2020 11:13:59 -0700 (PDT)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id v4sm7107146qkv.43.2020.05.04.11.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 11:13:58 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     davem@davemloft.net, evgreen@chromium.org.net,
        subashab@codeaurora.org, cpratapa@codeaurora.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/1] arm64: dts: sdm845: add IPA iommus property
Date:   Mon,  4 May 2020 13:13:50 -0500
Message-Id: <20200504181350.22822-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an "iommus" property to the IPA node in "sdm845.dtsi".  It is
required because there are two regions of memory the IPA accesses
through an SMMU.  The next few patches define and map those regions.

Signed-off-by: Alex Elder <elder@linaro.org>
---

NOTE: This was posted in error previously as part of another series,
      which has since been superseded (and no longer includes it).
      https://lore.kernel.org/netdev/20200504175859.22606-1-elder@linaro.org/

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 71dfdfcf2033..7cce6f1b7c9e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1762,6 +1762,8 @@
 
 		ipa: ipa@1e40000 {
 			compatible = "qcom,sdm845-ipa";
+
+			iommus = <&apps_smmu 0x720 0x3>;
 			reg = <0 0x1e40000 0 0x7000>,
 			      <0 0x1e47000 0 0x2000>,
 			      <0 0x1e04000 0 0x2c000>;
-- 
2.20.1

