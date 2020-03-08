Return-Path: <SRS0=ZTIy=4Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5948C18E5B
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 05:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BABD620838
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 05:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3PrAbng"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgCHF4Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Mar 2020 00:56:16 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36705 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgCHF4Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Mar 2020 00:56:16 -0500
Received: by mail-pg1-f193.google.com with SMTP id d9so3185605pgu.3
        for <devicetree@vger.kernel.org>; Sat, 07 Mar 2020 21:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQLcaG4v4iP9SXWeTRwv6UzXT7p+SW2HOZis4ljRrU8=;
        b=r3PrAbngur1I3ac8O7nrPt5vFQcuLshUpHLyjwDgQx5bahchJ4LgeBcyOhQkmB3zZ2
         GlHcgsK5vR6Em9CAKrfI+kNkABaITMonig5UXcFWr09Lk1d3MGepfzrm5T6pHvo+IotW
         zNaYONaMlaBK9Z8ZF0r+qMTauSeo25I2HhhGt/GIMmNVaR/cKQGaFaYldixeQCTnJmBI
         KHU8jMgYR54PPUaSWLL8Ni5TQvr3ewjtlgNf4Vjziu9Rk5ftFrBBszJVG8HSARrqODui
         rVcufxgfteyv5F02a+0gdoF4pqBLurIVs9iul3hAiNZgO0EN5WCqNCQ3Nsmo9I0UAKKb
         CH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZQLcaG4v4iP9SXWeTRwv6UzXT7p+SW2HOZis4ljRrU8=;
        b=YPYARdGdv143EUGXiM9vmyHRC/+fvvxAXehl07ZoQQwi3WNHW+wOgTZh+sPIfDh673
         fWMfDRyELI3bEkr7HC1npGH7iPV+mrF5+cVPy/6ksHqG6Nn8ApKEmnqQAEBkZz0QP3u5
         F+i8Q8eWS2YjO9eg6rvCAzyKrX9dQD+QJ8cXnS/xw3v0M35nBx7qlT4jYPOD25vTFrgj
         6QgeUtCfytGeVekdJjYICAGFvVPxmL+3j0TXcqBi5mDMplDfTlTbQ4RmphM8oUsQKQXx
         nmRtJT77bWRf/t4JW9C84JkYdISku+Uflloz6yCZy2QYnGY8mkVF9rCsb2zYEeX78jy6
         D0yA==
X-Gm-Message-State: ANhLgQ3Y9iKYuRE2NdHbgwXrPQMz/whoVHhl39ouO5/dP0ZD7BvD8Pcm
        skb3ydh73u0nIO3rHfLLjSC36w==
X-Google-Smtp-Source: ADFU+vvtxEJiap8kXC5Tov4FW+UxaNfAA81JqXk07ynGpFMuJ/1wUtQooNds0qI0B70AI7/sw1U1mg==
X-Received: by 2002:aa7:8119:: with SMTP id b25mr8184678pfi.122.1583646974936;
        Sat, 07 Mar 2020 21:56:14 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k72sm14305175pjb.47.2020.03.07.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 21:56:14 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8998-mtp: Disable funnel 4 and 5
Date:   Sat,  7 Mar 2020 21:54:45 -0800
Message-Id: <20200308055445.1992189-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Disable Coresight funnel 4 and 5, for now, as these causes the MTP to
crash when clock late_initcall disables unused clocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 0e0b9bc12945..8a14b2bf7bca 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -95,11 +95,15 @@ &funnel3 {
 };
 
 &funnel4 {
-	status = "okay";
+	// FIXME: Figure out why clock late_initcall crashes the board with
+	// this enabled.
+	// status = "okay";
 };
 
 &funnel5 {
-	status = "okay";
+	// FIXME: Figure out why clock late_initcall crashes the board with
+	// this enabled.
+	// status = "okay";
 };
 
 &pm8005_lsid1 {
-- 
2.24.0

