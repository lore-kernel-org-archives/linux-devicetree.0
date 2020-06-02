Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AF7C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 10:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2F0E206A4
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 10:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPrls4ET"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgFBKKX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 06:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727784AbgFBKJu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 06:09:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB2EC061A0E
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 03:09:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a45so954220pje.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDUg6z9g8U9M6fAkFW44jT1VB/1+ZQ8nnChdFdTrw0o=;
        b=JPrls4ETeYgIMJX8QWPVQUeGPDIFB+vzbpaSR5smt+GsXM2c2z7wR9aheT0MN045P2
         MNn4xigoWj3B+e/Mlkhx8leM+ryWRSyDkv2jCuMpjMoMbsu6AveAhfgJUHQ04LLWxZmN
         Mgejx+A7Nfvupn6zYsWwCzGymftS0KpiDMYxnUrGc8Z7h4wVwSJgqHJSqQ8KVtifV0X7
         rlEB+oWDujkm/iwFE0RsCoTI8us/FmQfaZNaYZGaCf6JwP+V5n7ZiL9XU/eRKA9H7Sb3
         hQZABN9U4kKHxk5DR00FZFVn1TbaoJ9Ge7zovM/YwR3zCbmAbsNpG5n5/W57XxXCdpd4
         S+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDUg6z9g8U9M6fAkFW44jT1VB/1+ZQ8nnChdFdTrw0o=;
        b=SeqCWkcHDav62tOpl2LI/SlKi2MkmgunrlkCeDxTro4BJz3sZixIIiiZideetFNMls
         8suBRIrso7PPqXH8WIjnMdPRLZ/mVmznM6nw8y+uJGAS1H6YKZ6vwfTd+jRQKc4tWzQW
         OySUA1pcGNgm0xBhNN76UkBB1KPf97wNOoNEVruGT1cuPGN7MIaW/i473elKzJzixITH
         Be9xOoIbP9HbW2LMwlw7T5RlP2LilXzACIvdnOgb5g4eGW1cAs4trUP6Col2OmYeYtlA
         orjZtIPheYKs11ZjAwngC96/CxC+G1LqdMXk8x2SrB52OUwsLSVmswbXegR4mysOBT39
         AlMA==
X-Gm-Message-State: AOAM532K2do00XKfmoAdZDYGnJB6ex95WaSGNfZEtIKNFayr2t3O1hnZ
        xvjr53/vF+y3qSokR/sgKJhuAA==
X-Google-Smtp-Source: ABdhPJwnO+GOOLL0Y48EeL/vzlAQa5VHkhlhDZThUPUSKKqU0v9nmNf30V1MnTAaDnlATpYdfSTLog==
X-Received: by 2002:a17:90b:3614:: with SMTP id ml20mr4435051pjb.41.1591092589904;
        Tue, 02 Jun 2020 03:09:49 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id d8sm1931276pgb.42.2020.06.02.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 03:09:49 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 3/5] arm64: dts: qcom: pmi8998: Add nodes for LAB and IBB regulators
Date:   Tue,  2 Jun 2020 15:39:22 +0530
Message-Id: <20200602100924.26256-4-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602100924.26256-1-sumit.semwal@linaro.org>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

This patch adds devicetree nodes for LAB and IBB regulators.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
  [sumits: Updated for better compatible strings and names]
--
v2: sumits: updated for better compatible string and names
v3: sumits: updated interrupt-names as per review comments
v4: sumits: removed labibb label
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 23f9146a161e..3230b78b8048 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -25,5 +25,19 @@ pmi8998_lsid1: pmic@3 {
 		reg = <0x3 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		labibb {
+			compatible = "qcom,pmi8998-lab-ibb";
+
+			ibb: ibb {
+				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "sc-err";
+			};
+
+			lab: lab {
+				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
+				interrupt-names = "sc-err";
+			};
+		};
 	};
 };
-- 
2.26.2

