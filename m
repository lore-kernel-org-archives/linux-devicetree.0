Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345C8C18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D6BD21927
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGnPcZLO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgCJPUN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 11:20:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43801 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJPUN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 11:20:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id v9so16368298wrf.10;
        Tue, 10 Mar 2020 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4n2mLbjo7aNwrYZdMSacX3rbOo2B1BidTBnQhKnQzMY=;
        b=hGnPcZLOVtBzDoE+WzzkasurCg1KMifhIB0cT0mfVWjDCpDX37pU6cHYixT/kBuRTW
         fj6ky1PozzwITKbkfZ6PikNwIt4+o7or4KXFv12jpwRMCYEU+Rk7tumvdMru+48LdhMp
         Zv8gx9tWF1Iu+GXHXivdfwRfabg6g256vFiqg+eSdbXYyZzcFqx5oGuZ2c4zUVeAsgsu
         lmhqJreT86cmN+Z/7BHBX0qyblFrDsGz6fgT3gmdaGzcTGpsa2Oaz5MJpROeEVuNH9sb
         T4JlORBEr3VUhy/P+aDDL9LZAgiFyS3I2UFfsVXXTMseOv98jGqcpdViLVopkUGKSGF3
         KfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4n2mLbjo7aNwrYZdMSacX3rbOo2B1BidTBnQhKnQzMY=;
        b=OrlIIg/KtudWM1iPRf5xOgiz0yTCb1bJPYzlddyZwSXOnVe0X90I6oVaGCNYwOsTPF
         UvTTVoiXbPe2HCoVaszM36a0aE+l1G7kwx+Gx1UbYEPf1A6k5AMR+7A5zaEHjMEndNbd
         DcZ4w9Mae+BTSzue/2dnCW5U1cB9v13AiovcqNOI6pTixyG/LF0OWlxREB/RVgUODQys
         fF6amqbq2VJDEVhhwAIhoyitVgjwkVsafjIr99YqIureF7s17VlUO4wjjkEgubOxZEsc
         GYUwmix1UBHABSl/Wph1xf+a9EwheBUoP4G3bIRzFfxIyg4STe+ZdwSN/OpRDEfQPjG3
         cl+Q==
X-Gm-Message-State: ANhLgQ0a1mCLZUiRGoRLauqGcaUXtRThMlUEeB3APYMutWSN+AblAkkr
        8fVwoVH/lmORssNkzNj0I4g=
X-Google-Smtp-Source: ADFU+vtdcepOM3l2BB9d90s/i+qW7uZK5sCMgjr8svNQswMlI4uZgM5Yxn7HJr/DclKr1TyOG7ycGA==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr11964222wrm.345.1583853611077;
        Tue, 10 Mar 2020 08:20:11 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id d63sm4416772wmd.44.2020.03.10.08.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:20:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/8] Add EMC scaling support for Tegra210
Date:   Tue, 10 Mar 2020 16:19:55 +0100
Message-Id: <20200310152003.2945170-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This series introduces the EMC clock scaling support for Tegra210. The
EMC table of supported frequencies is passed to the kernel via a device
tree reserved memory region.

Joseph posted the v4 of this series[0] about a year ago. I've dusted it
off a bit and tried to address all of the comments that Dmitry had made
in response to v4.

Changes in v4:
- major rework to split this into a clk driver and an EMC driver
- refactored some code to remove duplication and improve readability
- removed some unused code and variables

Thierry

[0]: https://lore.kernel.org/linux-arm-kernel/20190529082139.5581-1-josephl@nvidia.com/

Joseph Lo (8):
  clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
  clk: tegra: Export functions for EMC clock scaling
  clk: tegra: Implement Tegra210 EMC clock
  dt-bindings: memory: tegra: Add external memory controller binding for
    Tegra210
  memory: tegra: Add EMC scaling support code for Tegra210
  memory: tegra: Add EMC scaling sequence code for Tegra210
  arm64: tegra: Add external memory controller node for Tegra210
  clk: tegra: Remove the old emc_mux clock for Tegra210

 .../nvidia,tegra210-emc.yaml                  |   83 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   11 +
 drivers/clk/tegra/Makefile                    |    1 +
 drivers/clk/tegra/clk-tegra210-emc.c          |  352 ++++
 drivers/clk/tegra/clk-tegra210.c              |   83 +-
 drivers/clk/tegra/clk.h                       |    3 +
 drivers/memory/tegra/Kconfig                  |   10 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1782 ++++++++++++++++
 drivers/memory/tegra/tegra210-emc.c           | 1800 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc.h           | 1065 ++++++++++
 include/dt-bindings/clock/tegra210-car.h      |    4 +-
 include/linux/clk/tegra.h                     |   26 +
 13 files changed, 5202 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h

-- 
2.24.1

