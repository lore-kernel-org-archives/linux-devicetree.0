Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0880BC2BB86
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7B132087E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh/5Onvo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgDIRwq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35887 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIRwq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:46 -0400
Received: by mail-wm1-f68.google.com with SMTP id d202so655474wmd.1;
        Thu, 09 Apr 2020 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+Mi6KDkPWzdlDV0g49k1I6RXnFF1LUw8bky5xoGFzI=;
        b=lh/5Onvo8Sxk7LUxcskXMpZ3z3znzprt8Iccxu5eJ5pLPW/pywKpoDqig28WLUBWAE
         Z7gCtoU0p+f9OptjXJEuCXfmrwzP0YVN4WeIdNAn1ph0B9dHn/AcpOsC8NEe9lV0u7cY
         7v6P7+csUEcXsaiBN8tj6epzuxBEFJseR/ZewMeOZrNZ7POHeV8FGbU3j9DJZ4uJPMI6
         s73wvX9EhRUkhepBvFxde4lHjV8fBHAwFN5JKDW1t8rDOC8lTLMALLCQSKCOG0N3gvLp
         0MjWOOwjYIMWdBqGfMilV/jVnzh7JyGnsVd6UAgtKFhDRwCUhZXcdcFego3mfSgSKCGm
         63hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+Mi6KDkPWzdlDV0g49k1I6RXnFF1LUw8bky5xoGFzI=;
        b=EdTLeDgBSdLIaQ63/ajOCzUUbDCoSX2KdVzRyHtQJ35UnwFKS6qUAA4FL6O5Imkuxk
         P1OVTjTuM1Qu2QX6f2oAjgl6kzX5xW4hnNGjDygnaAG/vUeU9Nj3h4mM+kCxypudG7OM
         oMd63dI2a7ddPpyjaQadSBWYU86NDpJy9xYnC5xJPm3xVzqb3Lhr5tzL4iLCSyNB9NJK
         NOmAigAoeclzDdm3ww/NsPI5tPKdpMZL1mpG98RYZK8ZvQo2rMifYqDcEuujzsj2kqt6
         mx2N1qKF2XqiGfOz6GRqKLuM3dFsZNk9gdqcSR5cPfTJPPhG9O2i0Bt73aFfiupKL4sA
         oYxw==
X-Gm-Message-State: AGi0PuanFRfoC0HRtLFX1RWbFH7J1m3UPInI9EayN+yiCp9fPVACHDtG
        N9e6i8TAc4Ci4VL/Cofwe3Y=
X-Google-Smtp-Source: APiQypIwQYedhkD4ikYzon3PH8hdI8DOqzbEo6/+G/j0PB9M4GgoOca6zYcnr6G9RspgrJHZzCDV4g==
X-Received: by 2002:a1c:9658:: with SMTP id y85mr975665wmd.63.1586454764586;
        Thu, 09 Apr 2020 10:52:44 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id k23sm3956675wmi.46.2020.04.09.10.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 00/14] Add EMC scaling support for Tegra210
Date:   Thu,  9 Apr 2020 19:52:24 +0200
Message-Id: <20200409175238.3586487-1-thierry.reding@gmail.com>
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

Changes in v6:
- add support for derated tables which are used under high temperatures
- add patches to support memory-region-names property in DT
- address review comments

Changes in v5:
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

Thierry Reding (6):
  dt-bindings: reserved-memory: Introduce memory-region-names
  of: reserved-memory: Support lookup of regions by name
  of: reserved-memory: Support multiple regions per device
  clk: tegra: Rename Tegra124 EMC clock source file
  memory: tegra: Support derated timings on Tegra210
  arm64: tegra: Hook up EMC cooling device

 .../nvidia,tegra210-emc.yaml                  |   82 +
 .../reserved-memory/reserved-memory.txt       |    2 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |   37 +-
 drivers/clk/tegra/Makefile                    |    3 +-
 .../tegra/{clk-emc.c => clk-tegra124-emc.c}   |    0
 drivers/clk/tegra/clk-tegra210-emc.c          |  369 +++
 drivers/clk/tegra/clk-tegra210.c              |   87 +-
 drivers/clk/tegra/clk.h                       |    3 +
 drivers/memory/tegra/Kconfig                  |   14 +
 drivers/memory/tegra/Makefile                 |    4 +
 drivers/memory/tegra/mc.h                     |    1 +
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1744 ++++++++++++++
 drivers/memory/tegra/tegra210-emc-core.c      | 2099 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc-table.c     |   94 +
 drivers/memory/tegra/tegra210-emc.h           | 1023 ++++++++
 drivers/memory/tegra/tegra210-mc.h            |   49 +
 drivers/of/of_reserved_mem.c                  |   41 +-
 include/dt-bindings/clock/tegra210-car.h      |    4 +-
 include/linux/clk/tegra.h                     |   27 +
 include/linux/of_reserved_mem.h               |   11 +
 20 files changed, 5656 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-core.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-table.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h
 create mode 100644 drivers/memory/tegra/tegra210-mc.h

-- 
2.24.1

