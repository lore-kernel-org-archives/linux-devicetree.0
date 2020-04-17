Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A58DC2BB85
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:01:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43EEB21D91
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LM5cKfCF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgDQHBN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgDQHBL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 03:01:11 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA93C061A10
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id ay1so648792plb.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0oPPqf9OXvijAko5I1mWwWOkYfEpRlvn/eKZF323hM=;
        b=LM5cKfCF3udsrVxaGacR6h/sLv07txx6ixlzAPsrhyLhHk+t5bDVDybO+v5sYGLrWJ
         0JlRYRwYAlGICNY+V/xiZ3+VvIaIdaq8IrKcDKG0nUu5hVGIBw0tEhZhf1KO4TvkOlW9
         RLVisC+UzkLbpuGITMpqNTu7Xt75wNZyE3jYrL31g84UUXX+6P3DyS/5/gDRa//HlFi6
         gxe1wLlRgHLZodNGVk2vWsJMlileOvKLRrMKJCV+rPoO4jqbaR0y3CwHYAre9f2Ci9+z
         LPcmtLf1/qQQkSPaHEmDYY3LOEb8xGjWx63OsfH9rLe6wesBlUbeqVKRHvNeRqVt7j4h
         nt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0oPPqf9OXvijAko5I1mWwWOkYfEpRlvn/eKZF323hM=;
        b=sm0AIvIvbo3MveCp4Civ5BlB/ale4XEU9CP6lidbt4hFFdA83GvJc+hYqo+UNs0rhB
         Ioig/t+E7YE6FIHRP4OvHi6GxjggJfJx4GtuFTy1xThqX4d2ZrgCu/i8YBNG7ZqereK2
         Q6/AOpUPig2315whZ2uKQeGwoMV5qkmPTnf6m4nU/asdNSdw5GUhsZDe4su5lfRrS8ic
         tdKpPohnL+9X7FKAniM5dRbCjfAjgA4/xTMannvE+R2XmexVsJuRwUggxeAfF0pKSjGy
         HUq9czoc8Igne2xbFRn9omozJ/wegr4s3h92/4xRMFzxVFbxoVyU9UhDF7En2cdGxj6t
         4qlw==
X-Gm-Message-State: AGi0PuZ/Qbbkv+ckT4oIL+cFbYk6vPiIKFAufg8dJQkA9FRv3lZAuLOV
        VIgwLGnksiwAhXQ73SdZhgY2Xg==
X-Google-Smtp-Source: APiQypLxO7uvQwER98bAjFxyUXaeNqnsDgp8ArJSafA5CDEuVr7b1Qbz0iwzHp5rQxAxn7iUnTj8bA==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr2151669plp.44.1587106869157;
        Fri, 17 Apr 2020 00:01:09 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18561609pfa.142.2020.04.17.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:01:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: gdsc: Handle supply regulators
Date:   Fri, 17 Apr 2020 00:00:40 -0700
Message-Id: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Handle supply regulators for GDSCs to allow probe deferral when regulators are
not yet present/enabled and to allow the GDSC to enable/disable dependencies as
needed.

Bjorn Andersson (3):
  clk: qcom: gdsc: Handle GDSC regulator supplies
  clk: qcom: mmcc-msm8996: Properly describe GPU_GX gdsc
  arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC

Rajendra Nayak (1):
  arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  4 ++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  | 14 +++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |  6 +++++
 drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                       |  4 ++++
 drivers/clk/qcom/mmcc-msm8996.c               |  2 ++
 7 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.24.0

