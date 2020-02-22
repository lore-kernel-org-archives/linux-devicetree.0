Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FDAC35672
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB05D20702
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdCuHZNF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgBVQZD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Feb 2020 11:25:03 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50202 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgBVQZD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Feb 2020 11:25:03 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so2129757pjb.0
        for <devicetree@vger.kernel.org>; Sat, 22 Feb 2020 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Ks7y/QSYAArJm8l8kQ7dWIxmdbWnSg+WMxAzD2T6n1c=;
        b=AdCuHZNFaRFDtgAAkhhYnFi/ZD1m9YBfJU01emxU4mSbXwDRhs1uDdwwYPrHYE+eBS
         GI4xxETIdZE/1zzNfMz0oVP3qlaf87/HfcgBXY8m6U6baMqi6/WQ+LdXInCdLcoIQZAL
         xDMNi2jguKXQ3LInFv0OtDfbUBxZMH2wUAyK/84KntG2ZEAl7rbKPGl+gWanNGicIdFp
         q0KASqHTpV2HD0HgSzBkiNVEIMJd41sWk+X/XsdK/vN5/ZV2yHZ4ism2B0qFGQ+JruDV
         RjnkFLntq729UCaXVHPF74Pq3Ajg2YR/Z+DO9qGH2xd4nLDuQvzBEksJJShR6Ggdbwhw
         Q2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ks7y/QSYAArJm8l8kQ7dWIxmdbWnSg+WMxAzD2T6n1c=;
        b=oNUIt6E5lLVJIWt7uQ5XB+aSdKqg1jT5nm+97lMHsSQJ8MZmkBwYeK3sLQHlyj9A1j
         bSRyojwDRkl0x1hdiVTOVXv2ng3AnJXKtwOxT2sOwysqOqmWpHVr7yQYqZD4+3rCFEDf
         qHgjFJLvTKGXI4QR84E4CezERsYFoMwh8XbmPDXo4uFl2lxrO36yOp6rRQMdaeKJ5Ot9
         0qT5mKAJM0kP9oTgZ+2JMTdXx3lXyMDXNoZ7ACA4F+3UKkz58AcWMNCCC88LuOwq/wG8
         oRU7rebxgiwxpGfOOCQMHgYBePl4J+xGHsKqDViMjaqCAT2M+7Wq0dYIDteKQdsqDVv7
         BkYg==
X-Gm-Message-State: APjAAAU5nHFbKNXbZxMCsBnUlRaqlIt9SswZAYcd9/d6wCyCriMpNNFw
        iuVcQyA3pSzJnSBsEFpfh82G
X-Google-Smtp-Source: APXvYqwDqWgruAJNxa7ONzq20wF+AVoEojPMgADvEuzyv7YdZNMt2utDAZTxPjtcVVj83OJFNZAHgQ==
X-Received: by 2002:a17:90a:fe02:: with SMTP id ck2mr9841156pjb.10.1582388701954;
        Sat, 22 Feb 2020 08:25:01 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:801:b38c:89e8:305c:23c4:b77f])
        by smtp.gmail.com with ESMTPSA id q17sm6851296pfg.123.2020.02.22.08.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 08:25:01 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     matthias.bgg@gmail.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        adamboardman@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] Add I2C controller support for MT6797 SoC
Date:   Sat, 22 Feb 2020 21:54:40 +0530
Message-Id: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This patchset adds I2C controller support for Mediatek MT6797 SoC. There
are a total of 8 I2C controllers in this SoC (2 being shared) and they are
same as the controllers present in MT6577 SoC. Hence, the driver support is
added with DT fallback method.

As per the datasheet, there are controllers with _imm prefix like i2c2_imm
and i2c3_imm. These appears to be in different memory regions but sharing
the same pins with i2c2 and i2c3 respectively. Since there is no clear
evidence of what they really are, I've adapted the numbering/naming scheme
from the downstream code by Mediatek.

This patchset has been tested on 96Boards X20 development board.

Thanks,
Mani

Manivannan Sadhasivam (4):
  dt-bindings: i2c: Document I2C controller binding for MT6797 SoC
  arm64: dts: mediatek: Add I2C support for MT6797 SoC
  arm64: dts: mediatek: Enable I2C support for 96Boards X20 Development
    board
  arm64: dts: mediatek: Switch to SPDX license identifier for MT6797 SoC

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |   1 +
 .../boot/dts/mediatek/mt6797-x20-dev.dts      |  49 ++++
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      | 229 +++++++++++++++++-
 3 files changed, 271 insertions(+), 8 deletions(-)

-- 
2.17.1

