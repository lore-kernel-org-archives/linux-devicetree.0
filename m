Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C88C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 06:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AD1C21582
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 06:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zf8bJkao"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbfLQGUn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 01:20:43 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37381 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfLQGUn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 01:20:43 -0500
Received: by mail-pg1-f194.google.com with SMTP id q127so5082384pga.4
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 22:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/4+dE6TBvtAZbiMIIRV67E0nc4u23eKs5qpkR7aBsc=;
        b=Zf8bJkaoXvahdNySVN74ycCQmLoxy4e5zh/QEjLuVcb/JCf6/qKAIx/QIxOu2AylUF
         NMV/DOrOPmOeOmY0f/G/FTwuHzSTsno4nQwSkTeTsttDr6a+VEguvb69NOqt354udB5u
         3NVNEK2lBA0XKrW2irpwFs6w6ounikv/qY/RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/4+dE6TBvtAZbiMIIRV67E0nc4u23eKs5qpkR7aBsc=;
        b=ohqNP7DzhD0URx+3I5EOl1VdfNeBhbS9Wgn5iSqEIMRt8TwBVNg9dEiGxPqr+2Dx4a
         uRhjD5FZuaEJ3cOlpy98tPYx3Z2xuV46zevARyXvpYxh29bNnKj0wSK5IMruyXIm/oe7
         nI2h3acddtA7m0/8l/uIZ0jxuxgG5PAmE10TD7r4sPQ+UG3ECb70TfTdc2dh+H5d/H1r
         DHkk1Y5/T8MflvaG5mD8DZYl7bPSngojky/ev2m7P9hhMCadg2CA19gUgV+VfL7FahWq
         +10fsnawh7AsIfk9ZJuPhyQiUndNKe8z85Kiaih9Y8QzY23/6miNLd/hI+J1C82ZDUhV
         vGVg==
X-Gm-Message-State: APjAAAVMrLlF40hX7GMOth0oZJgCN4BGgFiQE1DgK+MJ7tkapZ1sPsj3
        Jph6e6D8K6sY61Rb7Z8PIYho7MOpf+uNvA==
X-Google-Smtp-Source: APXvYqyEClKB5KveoH1dz7RJn9lqOw2w9s8Xx0dDnRonMN4XFIC7VrXPxnzpn33/nSEKlc6SZb1QQQ==
X-Received: by 2002:a63:360a:: with SMTP id d10mr22663260pga.366.1576563642808;
        Mon, 16 Dec 2019 22:20:42 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 100sm1682030pjo.17.2019.12.16.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 22:20:42 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] arm64: dts: qcom: sdm845: Rename gic-its node to msi-controller
Date:   Mon, 16 Dec 2019 22:20:25 -0800
Message-Id: <20191216222021.1.I684f124a05a1c3f0b113c8d06d5f9da5d69b801e@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is just like commit ac00546a6780 ("arm64: dts: qcom: sc7180:
Rename gic-its node to msi-controller") but for sdm845.  This fixes
all arm64/qcom device trees that I could find.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 407d26e92fcc..5d3b470f1be5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3203,7 +3203,7 @@ intc: interrupt-controller@17a00000 {
 			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
-			gic-its@17a40000 {
+			msi-controller@17a40000 {
 				compatible = "arm,gic-v3-its";
 				msi-controller;
 				#msi-cells = <1>;
-- 
2.24.1.735.g03f4e72817-goog

