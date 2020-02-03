Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12555C35247
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 18:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E37032082E
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 18:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jH9/4klu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgBCSce (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 13:32:34 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37023 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729990AbgBCSca (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 13:32:30 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so8010096pfn.4
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5g1BX8oYOcgjo9pux5M5p2bLE7s9j8ECvjIyZHRTnQY=;
        b=jH9/4kluz76UNEEinon0dfMka4SAYZN1IDWt64qfM1HpWCST1rVre8ZLTVnySBrQE4
         r06F3cdXarrfXJbeH+c55smVRxDpXbI+4b0M3jlK4YWF8O9dGC/4TQ97lsUlI5mgSZgr
         N0cMvp3/6MYuTIjeZSCD36rwx5ScKvjo8aXsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5g1BX8oYOcgjo9pux5M5p2bLE7s9j8ECvjIyZHRTnQY=;
        b=mTFVSZUJnV7KIOLNSjroPf4WschZWzV9uFTFsvPro41A9AuuEeWAHZzFXXRRN/B9Nk
         /rxjqsEk5eWuEWoJSEJU1NpdGjDlu2H72fyGSMgGXE09uj714t1io8hFX5RHNlrNnaRV
         V+Xzp4aE27zox9yApse3f22Yvupu073Kwo9KLli3Y724iQ6RE+rle7zeIKSzn02VIawK
         azKqlWD7qNTNa8L92ciR74YkI5QaBKtYOShqbrTK3ENqOnfdNXZn/WWYhLw0jikeBj2M
         bbM38as6prPvQINuDfqhFPgEmr9Gj4L95JBtAW6C9RFbt56QHe+qitNaxRM9tZUIFeuC
         zFAw==
X-Gm-Message-State: APjAAAVh4FQR/iEh1wDkWqzHOpZJTdgw5+u2ovPndrpKfx9MhfBJAf1s
        b8uPMmrpoxakew286Rs5BgDiZA==
X-Google-Smtp-Source: APXvYqzTPiqHWb2iLW58b5qmzi+ONdPRjXdFJef+3ajjCtf9c5DeaPH9Qiwb5Hulf1bb3kru1zEZZA==
X-Received: by 2002:aa7:9567:: with SMTP id x7mr26097051pfq.133.1580754749735;
        Mon, 03 Feb 2020 10:32:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 14/15] arm64: dts: qcom: sdm845: Add the missing clock on the videocc
Date:   Mon,  3 Feb 2020 10:31:47 -0800
Message-Id: <20200203103049.v4.14.Id0599319487f075808baba7cba02c4c3c486dc80@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We're transitioning over to requiring the Qualcomm Video Clock
Controller to specify all the input clocks.  Let's add the one input
clock for the videocc for sdm845.

NOTE: Until the Linux driver for sdm845's video is updated, this clock
will not actually be used in Linux.  It will continue to use global
clock names to match things up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3:
- Unlike in v2, use internal name instead of purist name.

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...videocc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 35d7fcbda43c..3ad08d9deb54 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2607,6 +2607,8 @@ video-core1 {
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,sdm845-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

