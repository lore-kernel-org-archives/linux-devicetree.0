Return-Path: <SRS0=wYQk=7F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0847C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 13:20:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EBE620727
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 13:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="Omo1S8aT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387772AbgEWNU4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 May 2020 09:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731282AbgEWNUz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 May 2020 09:20:55 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFF4C05BD43
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 06:20:55 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id z5so6056083qvw.4
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jTWXBoIp5xP2z98SKXvxr1jwUQDv9G49Gs5gB7jAmQ=;
        b=Omo1S8aTK2Xnmb0ZKAitTpFmzlzazJ6IEpN8QlZupFp4jAG/z+ILAtQ22mh90r0Q6N
         H8VCvisko0Otqabe3s1i4RXIgtSlzjtuQzMixowLsADA6YrvoYzySOSEMolVTlmgl3BZ
         unmnh0KcrxdfbG0ZTMyZyjTqC/YzzYqiTUXBB91FWV1nXL18uthuwcjCxYHyEKs+QYd+
         KcmdtQlUnUOi4mpp2kJOX+qzILl15d4vCLA/7aYSnIwj2QfxbEWuR2tQse2pGSZtA7kp
         Ms81QtCOf07KkEkWmRrXf60EdjabUREqAmOGI1dUShhFZIDqIuUTGeZyxaN9O1xfVFGI
         +s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jTWXBoIp5xP2z98SKXvxr1jwUQDv9G49Gs5gB7jAmQ=;
        b=L8KmoAhOUqLnu/tLUADUUpDBDJz5T/7A2PUowJwQWotTVMUIa0affXX1YdOEvdMey0
         m2tvdHMa6Aw5/9b+otrQ/6L2tXbMftuUsPQd3SmlnkJ6emLt9AbSKC1dpPAMEeQ94/dx
         Q2I7lGL0m/+/zAsJ9yD//9z8xR5qqCrfaMW4yZSnLEWe4gzy6CAcH4rDEamaThTMAtBE
         dnWPeARGpQXNLcVWkbu/AKudRDqcl2+VfLSs9M9XG4A0wiX6ir93qYc9vc3D6g425FuO
         83cZ7LtFmMTV14ampzuQS2+GFAd23dcxhyLS3taEcdgcwpY5dXQkHiw8px+OGo6hgL2p
         a9KA==
X-Gm-Message-State: AOAM533gD6B/hf9/82l9O3cgr0lAQHhvKrGuWOqesmkUV3WJ5OIMDoRe
        NtFhK5jzlFYUAdDpzO61kSvU4B//b5s=
X-Google-Smtp-Source: ABdhPJzSiWtfHLcpMPsu3/OplQOPrW3WaqO9a9RL0m/spX6r63BLU7ZEGJoOWSQ+p6psVR32yyK4wg==
X-Received: by 2002:ad4:55ac:: with SMTP id f12mr227669qvx.51.1590240054557;
        Sat, 23 May 2020 06:20:54 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m33sm10349519qte.17.2020.05.23.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 06:20:54 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sm8250: rename spmi node to spmi_bus
Date:   Sat, 23 May 2020 09:21:04 -0400
Message-Id: <20200523132104.31046-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The pm8150 dtsi files refer to it as spmi_bus, so change it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 04c9c215ffcd..a273b99bf1e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -578,7 +578,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		spmi: qcom,spmi@c440000 {
+		spmi_bus: qcom,spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x0001100>,
 			      <0x0 0x0c600000 0x0 0x2000000>,
-- 
2.26.1

