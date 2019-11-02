Return-Path: <SRS0=kVRS=Y2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6BCCA9ECF
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 Nov 2019 00:31:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 599DE21897
	for <linux-devicetree@archiver.kernel.org>; Sat,  2 Nov 2019 00:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKEQCCyX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfKBAbx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 20:31:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42326 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfKBAbw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 20:31:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id s23so4073174pgo.9
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 17:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmKwPYUz22DWejWNDVX+p+n7NWEKBj1pY8e7LLu4FLs=;
        b=NKEQCCyXBdgTsGovN13Be6nAO4bGEHx/a7ewD11xgbfrfEdejeHj3o4flLocvdw49X
         5B7JbUckbmB9lrKYnDlhDzzEliMODTUXLmKaeYRp+zDBxNYZOLVd81WSrt1Rc3BVT7JM
         CcPUfhLlVwhjRytWNNpLKQWXQ0eGOSwwk+S4cTzycQvkobf81mn6l591ypI/5qgNxvCd
         ulpR5dD4A88Kh3jdtBjo0S9giVajmA95L6j7JF0QMK/R5FmH5UzfoPFxfUEXy7LL1ubw
         44YroGDFlduFRzbV2uzcvcFQZ001lOP3k9Z6qreygswNFG+/QCrg9FfLR6iw6m/JAAzo
         QELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RmKwPYUz22DWejWNDVX+p+n7NWEKBj1pY8e7LLu4FLs=;
        b=jhqaIwmqniNaK6UTwN37+fTxTEr22THfk5BMLq/3BrCSDjuEdeH0h96mFUqdreOjlD
         voMn//8ISS/u6nhLIUBn8aJICzX92U7NzUQbnwbTup0f9vzc6s0keLl/rN9SI90DJQwP
         yX/8vFSyfcTA7o/0ppllXsIILsSYwuVB+dXltAPEwl5cxwzMXoiPdh0nlB6ot4h1uqCQ
         2pwnIc/bajmtusXxH9jx41EYK5xyr3fHq3UMxcYkJ9lsfbvSnVKg3YzCe1UzxbQSHAop
         UjdMOHUQfAPXX2gmGtTd1iI4fab5HO9itX5UcAWKB/8TUhOlWk++WzvxNKFiFKWIcCWE
         ddzQ==
X-Gm-Message-State: APjAAAXJpLOWCm0XSzAmSjBRG/9/HzFPiRL4j8v8xO9AZ+h3HQ1e19dE
        QXPDey7zpRP7nGKULeNnNL7/ng==
X-Google-Smtp-Source: APXvYqyA6507ov8iEXResqYrB3v7w2XAzOhHSiJo19Q5bEyZRWThuZq6+g+rzLB4CPtyR+YiNFevRA==
X-Received: by 2002:a63:5848:: with SMTP id i8mr16181286pgm.217.1572654711927;
        Fri, 01 Nov 2019 17:31:51 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm7957522pfm.13.2019.11.01.17.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 17:31:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sdm845: Add PCIe nodes
Date:   Fri,  1 Nov 2019 17:31:45 -0700
Message-Id: <20191102003148.4091335-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add PCIe controller and PHY nodes for SDM845 and enable them for the
Dragonboard 845c.

The two series' that adding the PHY drivers and controller support can be found
here:
https://lore.kernel.org/linux-arm-msm/20191102001628.4090861-1-bjorn.andersson@linaro.org/T/#m6a892f4d6a8eefdd2c16b29b1cebb0023c69eac0
https://lore.kernel.org/linux-arm-msm/20191102002721.4091180-1-bjorn.andersson@linaro.org/T/#m42ca469f4b23d534000a4b45a55d9739edbebdc4

Bjorn Andersson (3):
  arm64: dts: qcom: sdm845: Add first PCIe controller and PHY
  arm64: dts: qcom: sdm845: Add second PCIe PHY and controller
  arm64: dts: qcom: db845c: Enable PCIe controllers

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  91 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 215 +++++++++++++++++++++
 2 files changed, 306 insertions(+)

-- 
2.23.0

