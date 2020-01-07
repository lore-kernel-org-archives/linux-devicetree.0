Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0F6C33C9B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 13:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C476E2146E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 13:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mh0np/XS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgAGNJG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 08:09:06 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45474 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAGNJG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 08:09:06 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so53812024wrj.12
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 05:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iz352BxuGbNcIztke1mPgtWeM92kMtEgll1IObizsfo=;
        b=mh0np/XSsz+h4CoB38HETauJmkbz8BR6FmKGypqqOtcnNzw7u0JHU+rG8g+IuVrB3T
         YC0UU4aDQQE8m3zagVnJMXDnO18NcI3ySxEPagHAkbOXr+KyYC9WKn9l3vgnk9fLoGBt
         yYXzfW2u6rTKVa6Ii0nqRHruIC+8JiV2NMBGtxPwop0glq3FlMPTyxSMCAs8Plk3M6Y8
         huiqjx2dS3pSH3+pU86kwN7yGkKjVGVG3U773NeU3HIBSzEm1U7OEkfhV+P/Q/KnZ3IG
         Vb+h3q5bop0U7ImfGrNvU5pQV40e/N7CvKVRsBkpEa4pQaQa+CQX+ONTFykH/UylPIYM
         xCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iz352BxuGbNcIztke1mPgtWeM92kMtEgll1IObizsfo=;
        b=GPqgRxbZRcm8i4UJqDajCsCAzA2S7ObslZsBZKZ644o7wjDgKJ8LFiNbAkQxf1OJyW
         lh+9QIyYJKY1ukiMWTLHi93dVtA08o+tx5oAdPYO7A7IrpdwWwqzZ/x4wum5NBIOeSOg
         LFYkXr98RuEpuzEVMC528p2HtqVcBrAP2eXpTwBUR/CnTUR0aqCWuDJagvAK4IkuWWgN
         0/Xae0/LquFgRfArI1J8nsQuxoDwoQE3W37OPqXahCoazxMkyQVb3aT82ZuLfmvnc4ue
         e+2LwlBrQyLD4p9/IeUJ4yPjVnCuAAeEwVBWpZeCtDVKC467+KFXJD80+OdwYCgrk+kZ
         NBqg==
X-Gm-Message-State: APjAAAUv3ZU+j7FfftX1bF3biZ0Tw9+ZkBMurUKpQ+B+8GXrQ31AStoM
        gOvXa/wk4cjT8S3Q75oGhVPb9A==
X-Google-Smtp-Source: APXvYqzva1xlPiPPlyDupp/or7rh5j3PKMzL2qSijT1KHNdr4CPcPjMT6cjFSkIdDmHoOWHjWka4iQ==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr112621130wrh.371.1578402544210;
        Tue, 07 Jan 2020 05:09:04 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b18sm7287035wru.50.2020.01.07.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 05:09:03 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 0/2] gpio: wcd934x: Add support to wcd934x gpio controller
Date:   Tue,  7 Jan 2020 13:08:42 +0000
Message-Id: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support to gpio controller found in Qualcomm
WCD9340/WCD9341 Codec.
This two patches are split of bigger patch series at https://lwn.net/Articles/807737/
Audio codec is already merged as part of ASoC tree. 
There is no compile time dependency on this series, can go via gpio tree.

Thanks,
srini

Changes since v6:
- Removed dependency on GPIO_GENERIC as suggested by Linus W.
- added support to get_direction()

Srinivas Kandagatla (2):
  dt-bindings: gpio: wcd934x: Add bindings for gpio
  gpio: wcd934x: Add support to wcd934x gpio controller

 .../bindings/gpio/qcom,wcd934x-gpio.yaml      |  47 +++++++
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-wcd934x.c                   | 121 ++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
 create mode 100644 drivers/gpio/gpio-wcd934x.c

-- 
2.21.0

