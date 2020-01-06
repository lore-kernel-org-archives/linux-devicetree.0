Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C03C32771
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E90AC21775
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOfEimh3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgAFITE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 03:19:04 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40676 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAFITE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 03:19:04 -0500
Received: by mail-pj1-f66.google.com with SMTP id bg7so7468678pjb.5
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT/ncizRTyOPBJ+qteCCsUj3AuidFovzuZ7StBMRbcE=;
        b=aOfEimh3kCjZ8L1asNBESPiEe+6tiK/ui3GJVgZ6YiRbowwfMGmg2enJK37aarXShh
         1bbisyO0nMLwx5HwECPhDP6tPfGMza8KdWMsq/7JLVKyPCjBwXLnYA7nE8vFw1MqMY+0
         NI6FjqA/fDfPEyNTVssUS174SZCghfSk4Als1cORzdeWd2NTT3+ur/EgyziaR/ysg1LY
         jAVMfZ1Xl7v/QSI3TdxX3WSqw/3qIrdot3PLSJerzUih3jcKNyyjK9bXxNzjx2XkmxU3
         BDXCpEQMjRmH5ydOvy7cBdpHcB67j9I0xYBhP7f0E9h+cop2S5qz+qNQ+PCCFM5edE8d
         uRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT/ncizRTyOPBJ+qteCCsUj3AuidFovzuZ7StBMRbcE=;
        b=ky22Kyff/uIwi3jkqFogHPcm4i6jiD/Sq7TvvpbzAWdK+Z/NA0BQh2AIjONEHcwhmc
         z/mk0MoAv3BQTSmxlKZcKAFM4v15UYDJGpohMLf/dCJW6ZsNHdjh/rn3gPirizo5Kzv1
         g6WbeQSgmk4QmuMey6kTfWLAcx7RiWxi2HiSEKomqHfCJ5t5G6JLUnWsCyvn7Y7KSa92
         np9k6qV8jCAQ2nnIsCkQ4DxAAfyYdNkGMW2tWK/Euzr821nWKIVvJOIoyCY00grfYnLb
         A4cm4xOYM/+O00mV2FVwMKnsYkyG+XV2mU5n702feI6aZS/HWjYYr3ierL0DxBEhG8rz
         gp9g==
X-Gm-Message-State: APjAAAUDFKyU1bKpR2HUDvDHSS9kGopLQFpR7NZssV/Nvm6wQ6Km+kgU
        +et4CpNfckJLTi+NgHBQKedzxhFNUw0=
X-Google-Smtp-Source: APXvYqzzsPBM4bjl7JMe4acr4w9YucNEDzl559pHlJ77jdSG19Ar/9vxC3lOEiqb6ClRXTK8lE9wEw==
X-Received: by 2002:a17:90a:6484:: with SMTP id h4mr40033534pjj.84.1578298743755;
        Mon, 06 Jan 2020 00:19:03 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h7sm82343457pfq.36.2020.01.06.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:19:03 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
Date:   Mon,  6 Jan 2020 00:18:18 -0800
Message-Id: <20200106081821.3192922-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the two PCIe PHYs found in Qualcomm SDM845

Bjorn Andersson (3):
  dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
  phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
  phy: qcom: qmp: Add SDM845 QHP PCIe PHY

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |  10 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 313 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 114 +++++++
 3 files changed, 437 insertions(+)

-- 
2.24.0

