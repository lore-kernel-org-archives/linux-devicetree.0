Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1653BC55189
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA3782073A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvNKDJfe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbgDVKj4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730148AbgDVKVN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 06:21:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D29C08E934
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:20:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s10so1751338wrr.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=123u9I7LwrG7OqauG/EgayFD4qVNvmiu3Wq50pc/uqc=;
        b=GvNKDJfeh4dQsO8mnI588YI2+9PpMuErH9kG2Ok/GZC9xY5NOMt9q1qJZrqmGVMUZK
         R4sR2TNQO5gXPNlLTiiVmKvSNzArGmbUIr9yPqT1Y0dUpt+5Hfh30s8eDZ1nhX+FYHLv
         zNHDnSM9BSKH+LqlQn21ZUSUMVJuesdnj3M6ZsBu5gttTYxuyFN14IGmKUNGGckLRYgy
         /AJAAMCPn5+p7w36EAidIpMXqzdLrfGwZHODddvNxpFzf7YfLjP4K05bRiPrMJwpEftD
         vKHFD7PdJNhNsHpfeIHciBjKhzwVDIlIcTnsHMr0936gNrAhM6aCSewT+xKhNeEIKi/s
         h27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=123u9I7LwrG7OqauG/EgayFD4qVNvmiu3Wq50pc/uqc=;
        b=suuZbBd+c3vCmiR5p+3iAlC3Q1XHC790AnYZzfai1tUTSyrmnih65eXQzpRezriOXC
         pBbIRNERig0Khtpq3NKjd8pbH1u5o+wVMEQKtGCvdFJDMPaEj3xUo5VEen+8UMAUnkxy
         DcW0FNICtXf49DjLN7ZRIARKjKL+szp1AnC9iG0z08Y0HR5IWxmGi/Mze24p+jX8WpFl
         1juw4Yw22Hct92h1jdFpZUOzD/64S6Wps2sGY6+fjktvyjcrgfyYXB+ShFAzZ4usnE0C
         IxMcnMvc+8hBpdPp6fD2JOuN+1J+N5YvNUervBRQLk0VHQ4DOvedWU4sqxzxL2PdWfzZ
         vnow==
X-Gm-Message-State: AGi0PubvskYlFH5FYGQLRha0bV+qTa/UPrydwhgKDmjA/VvxnWiXmJ9f
        LPoEtbcDQvVw8l+1jJvophuy4w==
X-Google-Smtp-Source: APiQypJt2yJqpBjOpfZHuVtBJqDu3oRBOVm+IrdDn08DJb66CNt9BsvawPp+OzA7IVCouOqPrEL82g==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr28404439wrt.407.1587550856176;
        Wed, 22 Apr 2020 03:20:56 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id h10sm7792460wrq.33.2020.04.22.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:20:55 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] arm64: qcom: c630: fix asm dai setup
Date:   Wed, 22 Apr 2020 11:20:43 +0100
Message-Id: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"direction" property is only valid for asm compressed dais,
so remove it for non compressed dais

Fixes: 45021d35fcb2 ("arm64: dts: qcom: c630: Enable audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 3b617a75fafa..51a670ad15b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -359,12 +359,10 @@
 &q6asmdai {
 	dai@0 {
 		reg = <0>;
-		direction = <2>;
 	};
 
 	dai@1 {
 		reg = <1>;
-		direction = <1>;
 	};
 };
 
-- 
2.21.0

