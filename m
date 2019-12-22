Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410C4C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13FCA2070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UczAdNSr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfLVOKj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:39 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:33161 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfLVOKj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:39 -0500
Received: by mail-wm1-f47.google.com with SMTP id d139so13021859wmd.0;
        Sun, 22 Dec 2019 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7AbgJnlI2EgW2o46IrRW4rMlaaCjoaiBzQBWSad/QY=;
        b=UczAdNSrjKhjynMj1kLnOFEfs6dBxuD9HS+qUfUS0ScfIOcm+JxMWk5oSaxBOkXByR
         6gaLQqz3Mrz4qnPgputIbZ8rDwtcyjGTLKEnitpxLYIcNPmYF/krKuiJby6/FG1ThV1x
         lWOFCCtp665LX5whMlvedNYORO30ma30VfSfu8luz8MqyMKoE85dZHn6rUFtScVgluQz
         kcZny23KO0BF2TtqNDbLkEwLtKT4jMje2mofyUL9GglvxahI7tzl29d9td3sWDYADhLx
         gphKu7SRjbY5pgidDmIGr46fzb56tVFY1u3SmCb/bzpJbXgy9hDo9o48nYMCzMgzrpMo
         tfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7AbgJnlI2EgW2o46IrRW4rMlaaCjoaiBzQBWSad/QY=;
        b=n1JHnzAjM4l3MMT0w0jvYMnrFayccMPnyU2MepY1HlKJiHShhcgn5LDlckHBaYdiO/
         MdFdD7paNDQmxY/ilDBZftm/T+Lb4fi6jLvueBEz3ti6CU2gLhTa8eJAnvbT4ZhzNdSg
         ampwcX9Z3ss3hkZxNCut/02++q9nT8Rm3zEbtzmnPAX2sCySovHU/Jjj2qIqPyKYZ6Cy
         E9pSlPt+UteE9zKWyIRMVt9b5QvfgQZTapB029qPxwlq06gBbCvN4yV4/+5XTKAwIr2q
         ZordvI//AO8hKZmB5iN9DpxH+kkV10VYmOkkotgQ6hIxjsN/J/SIL0tkCvLy+RXPrt/h
         JYlQ==
X-Gm-Message-State: APjAAAU7/XhEqXZ6PZ/Vf8hTWKiBtPxHdnH62ZV/GSsOyACQV+1imxV7
        ebkT2ESPavsm5oW8KHEwf2I=
X-Google-Smtp-Source: APXvYqzvd6XcPv4vx+hdJsXC32Q1Do76lfi1GgENJOeIj9qM+MtsJHFTfEKt5YaFE6KurC1wrYCX1g==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr27386857wml.164.1577023837135;
        Sun, 22 Dec 2019 06:10:37 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id m10sm16950082wrx.19.2019.12.22.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:35 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/13] memory: tegra: Add Tegra186/Tegra194 support
Date:   Sun, 22 Dec 2019 15:10:22 +0100
Message-Id: <20191222141035.1649937-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this set of patches improves the Tegra186 memory controller support and
extends it with Tegra194 support. The first three patches add the needed
device tree bindings and headers. Patches 4-10 first refactor the driver
to make it easier to support multiple SoC generations and finally add
EMC frequency scaling support (via debugfs) as well as Tegra194 support.
The last three patches enable the memory and external memory controllers
in device tree.

Thierry

Thierry Reding (13):
  dt-bindings: memory: Add Tegra186 memory client IDs
  dt-bindings: memory: Add Tegra194 memory controller header
  dt-bindings: memory: Add Tegra186 memory subsystem
  memory: tegra: Rename tegra_mc to tegra186_mc on Tegra186
  memory: tegra: Add per-SoC data for Tegra186
  memory: tegra: Extract memory client SID programming
  memory: tegra: Add system sleep support
  memory: tegra: Support DVFS on Tegra186 and later
  memory: tegra: Only include support for enabled SoCs
  memory: tegra: Add support for the Tegra194 memory controller
  arm64: tegra: Add interrupt for memory controller on Tegra186
  arm64: tegra: Add external memory controller on Tegra186
  arm64: tegra: Add the memory subsystem on Tegra194

 .../nvidia,tegra186-mc.yaml                   |  130 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |   22 +
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |    4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |   43 +
 drivers/memory/tegra/Makefile                 |    3 +-
 drivers/memory/tegra/tegra186-emc.c           |  293 +++++
 drivers/memory/tegra/tegra186.c               | 1122 ++++++++++++++++-
 include/dt-bindings/memory/tegra186-mc.h      |  139 ++
 include/dt-bindings/memory/tegra194-mc.h      |  410 ++++++
 9 files changed, 2110 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
 create mode 100644 drivers/memory/tegra/tegra186-emc.c
 create mode 100644 include/dt-bindings/memory/tegra194-mc.h

-- 
2.24.1

