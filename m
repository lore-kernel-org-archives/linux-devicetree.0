Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47592CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1802721D7F
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJvxtYwH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbfJYR7W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 13:59:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39957 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730963AbfJYR7W (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 13:59:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so2063629pfb.7
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=unR/WpfWQtLnGQnVJ3by74evvy2oa+5Uab8WgXeyAOE=;
        b=UJvxtYwH9CGFkhirLQqu+rJtutpY1tWkr0flVmuS0Babg4DFzpDp05K3KnQ8twaZiN
         +BBYOmr2jN1sMSIL9K0URLOOLTXtEJXXAx0biRbmUzyhYd3CyxSUYDiR/PbetdFM8KbG
         mJlwQavQlCGDYNmm5n+WNQH6sO0aZl/kw20fL+xByx0qsQ4zJRb7SuQSmLLWDGMqH8mN
         J4v5YTQ3TLHFTfmECzZ+VlH+pIZ7dKUz6nPePhGYW23nReE4ncBLxC/Ry0cxRr5VRuv2
         a8i+EbPkU2FT2pWcT3Sjy6n0fPdS8JIJ7sibUjGKyYafF9SE1KXbPrBu04RSfjW6RFD4
         A/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=unR/WpfWQtLnGQnVJ3by74evvy2oa+5Uab8WgXeyAOE=;
        b=Wk9VN1u5fzyHIA26diV6HdE/NRO4ndT5T9S268oYCdtW46SLWYYQGLVJXO2u1naTki
         IWvYfLkufsk7xfU5bTZZrtnf1Z6TM8WLwbQYKciu4jp6Ppj8Yp4BTneFSOP4D3SS9rNE
         LJFZCRQw1dwyDZDTGu9iCPld4RqOr2cZ0q3inwzPAq+6nMcPOuhXAdMVeHp+CKU1uc95
         QHgZnibzBMTakPHAea2aCgu+KKyzJr6vydiM+ke5xvxuJ5p3hKkQZemwVprju+n7UP/c
         e2fZomVNwcPSuJQidLOaLzg/9nSQIUzoc4qbPuaqP7tUT5ziv8sNgooQ/7weaqW575yx
         Mw2g==
X-Gm-Message-State: APjAAAUwU5hxiQqn03P6quNjGsWYSWfLOvRvgAuh2loy4jTwxdWUg0sh
        VAwM5u+e1V0y3dmPvzWzQa/S
X-Google-Smtp-Source: APXvYqwqGQ38V7Ub8lavu+bHjXLvP5YFKQZgt51D74jM8Myzon3TzVpmB6KO12QNI/CECFGWcyO9+g==
X-Received: by 2002:a65:464b:: with SMTP id k11mr6073160pgr.263.1572026361779;
        Fri, 25 Oct 2019 10:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7108:7f86:4131:5b00:9fc5:5eaa])
        by smtp.gmail.com with ESMTPSA id r13sm3430303pfg.3.2019.10.25.10.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:59:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/2] Add IMX296 CMOS image sensor support
Date:   Fri, 25 Oct 2019 23:29:06 +0530
Message-Id: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This patchset adds support for IMX296 CMOS image sensor from Sony.
Sensor can be programmed through I2C and 4-wire interface but the
current driver only supports I2C interface. The sensor is
capable of outputting frames in CSI2 format (1 Lane). In the case
of sensor resolution, driver only supports 1440x1088 at 30 FPS.

The driver has been validated using Framos IMX296 module interfaced to
96Boards Dragonboard410c.

Thanks,
Mani

Changes in v3:

* Fixed the reference to video-interfaces.txt in binding.

Changes in v2:

* Switched to YAML binding

Manivannan Sadhasivam (2):
  dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
  media: i2c: Add IMX296 CMOS image sensor driver

 .../devicetree/bindings/media/i2c/imx296.yaml |  98 +++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx296.c                    | 733 ++++++++++++++++++
 5 files changed, 851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
 create mode 100644 drivers/media/i2c/imx296.c

-- 
2.17.1

