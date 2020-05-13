Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AE5C2D0FE
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 06:06:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3071220708
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 06:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSuhoH0e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbgEMF53 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 01:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728871AbgEMF53 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 01:57:29 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342FBC05BD09
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 22:57:29 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z1so7532685pfn.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 22:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kcyyNciXuByQ3loktJkU4jCSR6CJ8Ob9Xjb+xzFsaeI=;
        b=uSuhoH0eMm36ZmB2Fj4UvKsgN/+ZX1g/k1KEpzJIpbdClvv6EyyLOo7Xhggv5m5whY
         fumXDtsw61PgVLyJv2XjsNuuuTuZjCZvWyabAK+NvvkfNV0tCUa+gHZc9WhLMPFjreoK
         EwT4KhQzxnMfDwSNS8mbvvmwljx32IjcWYMh8pjl7UzEBBJsTevzdSozStSlvgQrPAfe
         nQeawgeQN9j+hQquwiMcT19uaLzEMQbVmFFzglN9Bj16ZuEP8iVNoH0pQQSyQpLuNYVg
         EJWC67O81VXreR59gfK39BQ4XBVYSaoFfjGBH7ASGAuHeCSgqkbavrNhxciR6oNvCDl5
         +LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kcyyNciXuByQ3loktJkU4jCSR6CJ8Ob9Xjb+xzFsaeI=;
        b=bfOzsdmpXfe/vNjNBLUQJ/jQXR+FYIRNv6WpERFIxBugcxIMyMlr4FnVPGpAqFxcRH
         1Jo6K7bZgx7IdpOwEp267+PLvcF64a9gyNh3EIdoGej/4XMQ7hXnzkJgKt6idjF3jEEk
         8MpzBv808oBZVLLzPh8S4J1kmUZxjw7JsNiN4HvQ875K8LLNYlS5jTh0b4sFgr2t51Mj
         UMjn8WovVs4wiIpdpZhWpiKDYv1Q9n36zqQ4x3ZMghCGzmOxepcs8ZmqBqUlu9MbyjxV
         2Dj1RmlD+s7IZEFBRU5Nan6eu4P0iuZ18ToB/ABc75/c+RZO4e6KPAK/uWu05GhaSMXx
         1Seg==
X-Gm-Message-State: AGi0PubY+dCT+xN7K4kMRuULTJqx2bBkUpWAVwGo2BPZz+g/XOB6E/Hf
        vcr5Bg49aVQvZxra0sG13Pmy+g==
X-Google-Smtp-Source: APiQypL7n3HR1/A2BsmbmDuES13Hpi9E5nO3B4RrCgr0yhFV1nEZmheX1W1DXxDuIqkSRWwoDZ7KGg==
X-Received: by 2002:a63:f610:: with SMTP id m16mr22384313pgh.174.1589349448543;
        Tue, 12 May 2020 22:57:28 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w192sm14131161pff.126.2020.05.12.22.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 22:57:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] remoteproc: qcom: PIL info support
Date:   Tue, 12 May 2020 22:56:36 -0700
Message-Id: <20200513055641.1413100-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Introduce support for filling out the relocation information in IMEM, to aid
post mortem debug tools to locate the various remoteprocs.

Bjorn Andersson (5):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce helper to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 +++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 +++
 drivers/remoteproc/Kconfig                    |   6 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 124 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   7 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  16 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  15 ++-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  14 +-
 12 files changed, 262 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.26.2

