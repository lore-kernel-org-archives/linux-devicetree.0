Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A87C2D0C4
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 00:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BCD3206D5
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 00:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dDPPKNbr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfLKAge (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 19:36:34 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38494 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfLKAgb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 19:36:31 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so837908pfc.5
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 16:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YgLOEq+b3z3/DTsjuxwC7KLaORE8dq4xMxztFesSO1E=;
        b=dDPPKNbrgbLGmMbRNeNgFCRoeauYBwrY00fbTjRfRSmxMpI2OpLj9AtyX7y2oPRgR6
         d4I5SVqsBlXmaqb1+77ddPC5CfFwyJMR96XAaSBkO1Vrqw1lgldlKHJA2puQAKdgKKiM
         NU/GaCpRjAa/67cieZTL6Nn4UliUEpYmfjKF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YgLOEq+b3z3/DTsjuxwC7KLaORE8dq4xMxztFesSO1E=;
        b=DJyjjg7YnIjgDfSe7h/rLiGXH4hXmaj0XBHeadIOZP4+I28WN6Qnaoonu6fwcxz/vB
         9oIFSc7cRWByd4uzsMJOnuZDmHnxIISWFSyETov30l9bWMxDUTFYlnfXwN/XAFMFl5hy
         kQmnhNoKt172rsE8vL3YfuSoIUTBDn0oj60T4cTA024z8jp+ssKWPjJbuqGdfhHNUQ27
         ODmHv6WRv0JXHNg41AIu4rwuVAagGeEIklnXvFuAvZY6DgwPOvrdcFpLFeLwpR14zI20
         7AQ+bv+E7fcZHVnX5ebqfFdbMTHRVEn41ONM3ZXqGfVuWbiVP8lisesYl3dx7sEUEaYL
         y9rw==
X-Gm-Message-State: APjAAAXPPdVOA7myhdKlS6UOrxF0TBJrGKDs0FCh+YgzmT71lwiUAA0a
        ZpqR7jpis9Arc2gVJP21qALLpw==
X-Google-Smtp-Source: APXvYqzDHrJPYBFC/4ZRlo6kMRGcctk9Da8+L6mFYu9ZNYUFhmEDZGFglvH1i+JoExCrNLitCmIaUA==
X-Received: by 2002:aa7:9145:: with SMTP id 5mr779281pfi.74.1576024590404;
        Tue, 10 Dec 2019 16:36:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id d38sm159954pgd.59.2019.12.10.16.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 16:36:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     mka@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] arm64: dts: sc7180: Add a comment to i2c7 about external pullup
Date:   Tue, 10 Dec 2019 16:35:40 -0800
Message-Id: <20191210163530.2.I8d4cbb3d7ac5824f8e950c53038df8c27a512905@changeid>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
References: <20191210163530.1.I69a6c29e08924229d160b651769c84508a07b3c6@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Make i2c7 symmetric with the other i2c busses and comment that we have
no internal pull because there is an external one.

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 5eab3a282eba..05d30a56eca9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -311,6 +311,8 @@ &qup_i2c7_default {
 	pinconf {
 		pins = "gpio6", "gpio7";
 		drive-strength = <2>;
+
+		/* Has external pullup */
 		bias-disable;
 	};
 };
-- 
2.24.0.525.g8f36a354ae-goog

