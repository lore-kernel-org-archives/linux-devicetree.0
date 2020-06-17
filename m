Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8E8C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A5C32073E
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VvUC35sO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgFQOv6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 10:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgFQOv5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 10:51:57 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A1DC06174E
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:51:56 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jz3so1122302pjb.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oHDXTrxrPr/ji5r+gzel+9fUGlLw6TAHPNwGJ7xfdkA=;
        b=VvUC35sOnZr1p54G45m3VOKy8uZ8e5bmbhcZN9jZnFVgnTDiwJJjn9q1w9joR+fq6+
         LvIBHOBoTFfEjjTgB2XyZgDwbQMwmAF2q/yvQvrXOVOTPcqSP5y46rr1TpxGi0W40RPU
         9jf31u38Q01rzuP+kO6uGvxmaReLYGtsWSpAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oHDXTrxrPr/ji5r+gzel+9fUGlLw6TAHPNwGJ7xfdkA=;
        b=tmbzy1XCMGRU/HKS+VTGs6nu3e3vU77pG52srd9Tz1PXk05T11rXWhyc5scJzVATi0
         qyxLvmEdUs3nK53V+cq/igq1HIHHh24aIkKeOsLtA1nB0MkyQorqPKBqRYwzf6jdS062
         7w/3a6ZBJ5rFLuLHL7MsBV2gojxYJN6C3tu+AEzNo+/mkP1tvK3pNe/xPih5g6ESptLo
         4QNkl1PFW9fCG85jdDCwvh+wPophjatHo9HgX6DzhOMNkDW3kpXEU6rTJv24/rwDGyuc
         0WBaPdtFm4yEBpAjZ2BuPxolAsgWXsuJpx5szJ+JkQRe0mUENj0lXBlQqGUUk8NgzerA
         FtSQ==
X-Gm-Message-State: AOAM530cRhCYRXx3sYp82rePHB6ctg+fro/rKuwyrVYIloqmHWelT3Cc
        +9TldEGqRps5vYV1wFFGchYLCw==
X-Google-Smtp-Source: ABdhPJyABziZjJ2pLl5VgSZD68qgYBT6lnAEYD6+D8xTs6fWFVqzHs1ul+Kl1aQoJPBpUFqDygFnzg==
X-Received: by 2002:a17:90b:4911:: with SMTP id kr17mr8174779pjb.40.1592405515652;
        Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k18sm147040pfp.208.2020.06.17.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Add properties to qfprom for fuse blowing
Date:   Wed, 17 Jun 2020 07:51:16 -0700
Message-Id: <20200617074930.v3.4.I70c17309f8b433e900656d7c53a2e6b61888bb68@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200617145116.247432-1-dianders@chromium.org>
References: <20200617145116.247432-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

This patch adds properties to the qfprom node to enable fuse blowing.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Name is now 'efuse' to match what schema checker wants.
- Reorganized ranges to match driver/bindings changes.
- Added 4th range as per driver/binding changes.
- No more reg-names as per driver/binding changes.
- Clock name is now just "sec" as per driver/binding changes.

 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  4 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 4e9149d82d09..2a9224e2083f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -287,6 +287,10 @@ vreg_bob: bob {
 	};
 };
 
+&qfprom {
+	vcc-supply = <&vreg_l11a_1p8>;
+};
+
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 31b9217bb5bf..d7f5e3d64b17 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -498,9 +498,15 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
-		qfprom@784000 {
+		qfprom: efuse@784000 {
 			compatible = "qcom,qfprom";
-			reg = <0 0x00784000 0 0x8ff>;
+			reg = <0 0x00784000 0 0x8ff>,
+			      <0 0x00780000 0 0x7a0>,
+			      <0 0x00782000 0 0x100>,
+			      <0 0x00786000 0 0x1fff>;
+
+			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+			clock-names = "sec";
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-- 
2.27.0.290.gba653c62da-goog

