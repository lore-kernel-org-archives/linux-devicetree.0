Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2ECC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 15:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD41E2073D
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 15:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEcMEkLe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgCCPKJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:10:09 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36143 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbgCCPII (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 10:08:08 -0500
Received: by mail-lf1-f68.google.com with SMTP id s1so3065296lfd.3
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 07:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qu4L8psLtSRHjye4pOVUdt2rrul0W+hLv//Rfvk00vc=;
        b=HEcMEkLePpCimF/wMPTy6RBLp8JWPVNYRK/KypW9Sck6/wveKYdTxCa+/MyCnUfXBW
         ah2N9pSfaLtd3Bw9+2lHnhxHfLARz7jZbSSTW7KSnO2utGxuxVn6402arMsh3xYDkoPD
         XM+K30b1kvZ2odWMm4C4iajwsfHp4mEoPRUIXxh/AGWPbbpdUA+2dZ+CzxloN2dpDqo7
         rzWp8CnMnXm1qSFt13BEPeVMl1UHOu/hbG8q5L+kPHYmtyWVdqhsxawWiYMdEOx6Dmh7
         xwnHceszl2o7zAgiyFTJsf3qjXL3qT66sJ+6oHrOYXGRq7SRzxa/I7tpR4knhVWXafv2
         O5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qu4L8psLtSRHjye4pOVUdt2rrul0W+hLv//Rfvk00vc=;
        b=YvgefSucUX7XlrTegApjukqwhHmv0DH2627jrbywwMbdxd9oEXPkZfBf+8OKMO9iQW
         eY8lklSaf08tRmfF/YdVH7s54SQWTekwRXZ9fAtVJrvffDb5VxKMNxXS7Qo56X+jrklt
         /c3Wy9A/8P9zFGNClTDBET9neqHvGgUDcZGdeZoY37esfrsNL0/x/EU1JQnirai796fd
         GgQGc54PjZYAAILvc12f+7ye47s/3GYto1AR83SdZQ0SF3Ii6ZDynGvRHQpWPpUBlTgb
         xfD/V84oRzjt3YAkjvwkPut5EcI3I/6JSLSNFU061yoW6PpKR2FPKancKW6KFza6fsmR
         jEkw==
X-Gm-Message-State: ANhLgQ3YSeowN/0+z8lRg9eH8fRJxORZara1fZ0OPLxG43nCxv+9P7Nn
        gGmdbmRq6BSYoTsG15Npm5Fi7A==
X-Google-Smtp-Source: ADFU+vuOY7tLHeptjMrYBw0cHHhnzrTWWdK/Vlk+y170lgD8Gex04FZPWMeMr83K9o8b8EHO3e5u1w==
X-Received: by 2002:a19:6144:: with SMTP id m4mr3018922lfk.192.1583248085004;
        Tue, 03 Mar 2020 07:08:05 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id n189sm12143135lfa.14.2020.03.03.07.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 07:08:04 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        devicetree@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: msm8916: Conform to the domain-idle-state DT binding
Date:   Tue,  3 Mar 2020 16:07:48 +0100
Message-Id: <20200303150749.30566-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303150749.30566-1-ulf.hansson@linaro.org>
References: <20200303150749.30566-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fixes: a3f048b5424e ("dt: psci: Update DT bindings to support hierarchical PSCI states")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 9f31064f2374..8f3f19e66cd8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -165,6 +165,9 @@
 				min-residency-us = <2000>;
 				local-timer-stop;
 			};
+		};
+
+		domain-idle-states {
 
 			CLUSTER_RET: cluster-retention {
 				compatible = "domain-idle-state";
-- 
2.20.1

