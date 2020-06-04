Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F22C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2364D207D8
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 00:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khZdz1Ta"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgFDAnn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 20:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728386AbgFDAnm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 20:43:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578C8C08C5C0
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 17:43:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z9so5061976ljh.13
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rrUx7tQwdeFto3pPHVu+2ZiRJ+YEecFZO1PGKQ0zZ4o=;
        b=khZdz1TauH+tHn838sjIWoF85Oql5N6z/A4OOWuaGY9ZJ4cpRTHoZtAwBsh2Jvf+GR
         ZIXOt8REjHnFSu1wBb54G6bzSf1d2pNUOObe7Mf2NsNEZF0AWLvaNqi+1PuBeUlYhOXP
         kIZMBf0ugWtOqVZzqKJZxn5e3F90Qo+/F4E1iQwyX7PGSu8LK+iVtlrlFTgpxvpc0inL
         Vl+Bw5U5UH6S4HhzVpKuBzes5FRWN8UuylrzC+MPK1ICGKhY6QXxn6M2PGaGKcL1fC26
         6o6xNWICBnoH5do56Hfk/bexa7GwHKauaUE9ZcQoxGuuY6VEGZlFuhHAp2pjtb0dp4TT
         qeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rrUx7tQwdeFto3pPHVu+2ZiRJ+YEecFZO1PGKQ0zZ4o=;
        b=puwGPhpxHwgBUz3W925GKVHCivzTbQAkcbw5vZ+hA8uEr11b1od95QHI1WoSSyuKqT
         +PKUnPx/Wqgm6gF2J2t9SKslkGYHTNlHTADGC8mc+9Nn6pVNrLvw/0ivV+tN/HDbMbR4
         j0OIayZ8oTY03egNrF16a+HjNk0Mrq/XeDjHl4WJTR4X0c92HHrkudBvTbVXWsFcUIfs
         3/04HYqldVIaIlbFZ1NbMjpyMHDUypXPEtjP66g1Jq8mzXMx21lYGhWHngyYB93PXW5e
         yh/OXdL1V2xP6bteczyNrYhFVLftCWSL6KVM3IGOIwvGFa4eNftXGsSCylXOe7NS4AlV
         rreg==
X-Gm-Message-State: AOAM533PZxfu7J8Hqqq/mF2Lp/54YGS2IDBmpfSKlQTlR2murE4ZbKzc
        JGWCdyvBqhgD1vEcr+I87l31Fw==
X-Google-Smtp-Source: ABdhPJzdz/bJmDVRtzfkAWEJSgZbuJ9yBX8M+106D/OCtibAa42JOFnF6TuJJk/vEzUCZAUld0pbeg==
X-Received: by 2002:a2e:8091:: with SMTP id i17mr896539ljg.141.1591231420879;
        Wed, 03 Jun 2020 17:43:40 -0700 (PDT)
Received: from eriador.lan ([188.162.64.226])
        by smtp.gmail.com with ESMTPSA id t16sm858527ljj.57.2020.06.03.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:43:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 6/7] arm64: dts: qcom: pm8150: enable rtc device
Date:   Thu,  4 Jun 2020 03:43:30 +0300
Message-Id: <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable rtc device provided by the pmic.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index fee2db42f4cb..762fb902db81 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -71,8 +71,6 @@ rtc@6000 {
 			reg = <0x6000>;
 			reg-names = "rtc", "alarm";
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
-
-			status = "disabled";
 		};
 
 		pm8150_gpios: gpio@c000 {
-- 
2.26.2

