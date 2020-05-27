Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B04C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 05:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 554F3207E8
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 05:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BynqfQ+a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgE0Ftx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 01:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgE0Ftw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 01:49:52 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD207C061A0F
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 22:49:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k22so9735116pls.10
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 22:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVRQ/dG/ulblJ6XfEmveJlaTO6rV8wSk5XBgKB7R2z8=;
        b=BynqfQ+a5CBlSg++kvXtdKorWt70nAbQ+AB4vsASLLrHpIBhbOhM6OAKRk2lZNj+kA
         WljhD0oBMlc/5i9E1DkVKQJ8SlYlQI8ucYCGfJftn1M7eDYZVNv+eXnXqtfCdZVWoqrH
         dwemZk680kcFLHibchlHCwPFcGGcic+56SbpnjYYqq48OyOGyXH1OsPAMTwr2Vv0EWRw
         YqPozv5/lTy7+D/29KN9QuzT0GCdxf0Bq0dRR4uu+JpanFNmFH19PORWmbC+n9QnRSe2
         S1wplBoDTWOL1CDlIbBl+Wa4YrUZcx6hx6repqVSqIFvYNCjR4n2EdmiO145otuDW/Ug
         8FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVRQ/dG/ulblJ6XfEmveJlaTO6rV8wSk5XBgKB7R2z8=;
        b=BDsALI42ctz62nYGlgMNCi5aVWqEYtwY35Y4WpuImbsiw42LbGir/TWwqrI6TrjC2j
         8B5tAZJRpgkfOY89dfFUQp4Evvf2bH/wYWDar1fZr993p512+z0lJL0qCB6NPU4SJ2gr
         biW/9shmFsMMvVDquzEsGJk0s5bAoMc6y5+WIruorpEbMdmu+P4T+PwiuFLMpLfKn72Y
         McWxLe9kPMop2DWj9P2oW11EchwGWzGEGUlApaXWxIrVzOHSM8LT5iWTnFKRgwIBL6HL
         9lZSzaUsafqwTD6M+o1b7IiekNrAn5wv3nuu3VkPHPxpeFgsoooYeIQXJmRa0kPH9Ujj
         ZDow==
X-Gm-Message-State: AOAM5304cjbLD5Zayjyt4N0IQ8Xab2cs7bNi7ocD10hcHajp0Zij0Eqv
        WaOJYkBhWH/q8aK4hKgozc1rIw==
X-Google-Smtp-Source: ABdhPJxxYTWCxpVs3/p7Y4l6Rw8F2L+7yqSTCrCkinr/sKBgmzP+kAYhcMGEhULY0IXMqrNttZJoMQ==
X-Received: by 2002:a17:902:c004:: with SMTP id v4mr4526725plx.46.1590558590090;
        Tue, 26 May 2020 22:49:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5]  remoteproc: qcom: PIL info support
Date:   Tue, 26 May 2020 22:48:44 -0700
Message-Id: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
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
 drivers/remoteproc/Kconfig                    |   8 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 124 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   7 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  16 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  15 ++-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  14 +-
 12 files changed, 264 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.26.2

