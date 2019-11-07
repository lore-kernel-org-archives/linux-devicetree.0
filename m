Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4ACFC6194
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29CA62187F
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 00:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/AK8pYY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732208AbfKGAJY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 19:09:24 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39612 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbfKGAJX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 19:09:23 -0500
Received: by mail-pg1-f196.google.com with SMTP id 29so354957pgm.6
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 16:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCG7lU0priqMVKwFQzQJqK3jErBmez8plidupT5N1nI=;
        b=e/AK8pYYZcburR/t3rfFasVBBfADxe2TQIP+JGJ/z21euTg3hoVOAveAbMaPIALq6t
         Q0eJhSvq4LFqu2gARbckiqAAOCwBj60PXxkIq6gNlC4wCvorBNatYjqN9FZ3FH+svRGS
         EoU0qn1nEaXq9anAwy+PTiZ3GiW/IqOFcLOYb6ppw9lfhjuhHK3F2kSvz9snbGjPXu0G
         LeA4zFi4oLkFe4eMWl5co3meTBtDGC2jD8bsv5wY5z4BcNA1vYxEAKYVn8Y+S8EKGaMv
         9HYa2Em/W3BPGnzaG29vHNIXa/BfZrGuNxd69hcbOcu5TT5Qb8UwwNl6hwi41y7FR/HI
         IGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCG7lU0priqMVKwFQzQJqK3jErBmez8plidupT5N1nI=;
        b=bCbb+JJ68ojzvqwjLdGdKEL29b2WknkwAt20XtDNdaV8kawOkGHdB8hcMBW/hetIPZ
         3dFKmjOeh+GyfrcS1RuZWQV2iEwngbJvEUkFAyZlYB9LekyabeQKT5uApQB3tOrAkT7d
         t0BovVHi0/xSGc4yFS0c4IPrZdhzgMXa9ka18ZIJy4O0Q2ei2qpwvbbEnRt6q9w8YBjG
         b6Vaawfc8xG7LISpZqLyEodvNaovjYM9dBXZ5kvMndXt8fAnF+WhVAAxIu9pUwsXtIcw
         l7P5tfUfKTtXICfy2jkErduuQSxjUcCqoMwfvUC+8Qzv8V1vl2VTobWsjauSRmkmcpl9
         k/eg==
X-Gm-Message-State: APjAAAXYu7iocYrEfbFlq7OQhJBU/qXv1bqdV4GYwrmBR3h3kLrEvdSX
        HasDjVgAGlFKURKSgO6ld93MrA==
X-Google-Smtp-Source: APXvYqyiblvWdNuox/MQmOXfqbfG0RLNV24+NjZyLLck8iOnBH22XtxN4kqtN/2S6fbSGLKxWHjR3w==
X-Received: by 2002:a63:f244:: with SMTP id d4mr703636pgk.233.1573085360870;
        Wed, 06 Nov 2019 16:09:20 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z23sm216549pgj.43.2019.11.06.16.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:09:20 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
Date:   Wed,  6 Nov 2019 16:09:12 -0800
Message-Id: <20191107000917.1092409-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for the two PCIe PHYs found in Qualcomm SDM845.

Bjorn Andersson (5):
  dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
  phy: qcom-qmp: Increase PHY ready timeout
  phy: qcom: qmp: Use power_on/off ops for PCIe
  phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
  phy: qcom: qmp: Add SDM845 QHP PCIe PHY

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |  10 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 321 +++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 114 +++++++
 3 files changed, 441 insertions(+), 4 deletions(-)

-- 
2.23.0

