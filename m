Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31CBC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 20:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C983020772
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 20:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com header.i=@semihalf-com.20150623.gappssmtp.com header.b="SeQg6bRx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgGBURA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 16:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGBUQ7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 16:16:59 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FF6C08C5C1
        for <devicetree@vger.kernel.org>; Thu,  2 Jul 2020 13:16:59 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u25so17006612lfm.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2020 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=89gsiA7+bVZ+IYsObbOq4QNYGioS8fOEnycohDBafRU=;
        b=SeQg6bRxsTjFsGcwQzWxB3XEisRTzLRjuA/ey7GHDgP74NdLIBJfhgpiwkuG8gxBi/
         SxnYxKq6ynMP6io4YDnNy600UZzu/Sa45BZSat9qzIe7XAt4ejdl0IH5y4zCBbsJlsVX
         OXIUx0SQmXiNInOWt5+pA4ItNwYlN0TFKGsyO11KkE8OcuwLXDAw8h35wvjv+zJ+2UTH
         RfWeuIdKRmTaki9jspbxz11H34agHKTuKmuB4a6HwoThOFqkAKkBgURdC2Ayk+xeecVB
         Tqa3upQVxqHI+BxZsMpjM71loT+buTuFxaVzjuei6+9apVYIH+pUeIj6csgvgEFozEzU
         SLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=89gsiA7+bVZ+IYsObbOq4QNYGioS8fOEnycohDBafRU=;
        b=GzI8ef766Brtm3+LdO2/iScNrwKUrCMCWIEG3p6/bxT17k6R9n/eWaa54X3mi4cENw
         vcxISpVLUnCrxDB2I7HZjrH1ZMfkRLXEq8Ypo/Ro811bG9GHtP2i0JgpASQj9ScPogN+
         kbuXBEpmxsTtHg5xBCILMe4AuiFnus1Xja3vl9zMn3uxLZ1/LH2niNd4fKNHVkt3wdjj
         gHBMv0/8cO9aH25dqbaPp0fIfFX64tatw8rGXqRxts8jdvFi8PcR07wLVKYb/iDlKVcV
         b5pL6Xn60to4Qg/b8TBM5zjywT012W9AaKjVLgywzg/O4Rvpgvn1/+Utidmeo1veN0iW
         Zp4w==
X-Gm-Message-State: AOAM5323eiZAfBSuYvpgcRBqdlUWlO0jYYYykSrtualmYenf4e+nZ6FT
        DgaD5uKJLz6dF0BxxCVvUApgqA==
X-Google-Smtp-Source: ABdhPJwDloDr2B+qvX8EPRVRO/2+akigxPEfLX/jJsPdos8x1RrqHbztjXXuOrcBB7+Bw8UKZx+ukg==
X-Received: by 2002:a19:8806:: with SMTP id k6mr19203409lfd.189.1593721017874;
        Thu, 02 Jul 2020 13:16:57 -0700 (PDT)
Received: from localhost.localdomain ([83.68.95.66])
        by smtp.gmail.com with ESMTPSA id y2sm3320372lji.8.2020.07.02.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 13:16:57 -0700 (PDT)
From:   Tomasz Nowicki <tn@semihalf.com>
To:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        gregory.clement@bootlin.com, robh+dt@kernel.org, hannah@marvell.com
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        nadavh@marvell.com, linux-arm-kernel@lists.infradead.org,
        mw@semihalf.com, Tomasz Nowicki <tn@semihalf.com>
Subject: [PATCH v3 0/4] Add system mmu support for Armada-806
Date:   Thu,  2 Jul 2020 22:16:29 +0200
Message-Id: <20200702201633.22693-1-tn@semihalf.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There were already two versions of series to support SMMU for AP806,
including workaround for accessing ARM SMMU 64bit registers.
First [1] by Hanna Hawa and second [2] by Gregory CLEMENT.
Since it got stuck this is yet another try. I incorporated the V2 comments,
mainly by moving workaround code to arm-smmu-impl.c as requested.

For the record, AP-806 can't access SMMU registers with 64bit width,
this patches split the readq/writeq into two 32bit accesses instead
and update DT bindings.

The series was successfully tested on a vanilla v5.8-rc3 kernel and
Intel e1000e PCIe NIC. The same for platform devices like SATA and USB.

[1]: https://lkml.org/lkml/2018/10/15/373
[2]: https://lkml.org/lkml/2019/7/11/426

Hanna Hawa (1):
  iommu/arm-smmu: Workaround for Marvell Armada-AP806 SoC erratum
    #582743

Marcin Wojtas (1):
  arm64: dts: marvell: add SMMU support

Tomasz Nowicki (2):
  iommu/arm-smmu: Add SMMU ID2 register fixup hook
  dt-bindings: arm-smmu: add compatible string for Marvell Armada-AP806
    SMMU-500

 Documentation/arm64/silicon-errata.rst        |  3 ++
 .../devicetree/bindings/iommu/arm,smmu.yaml   |  5 ++
 arch/arm64/boot/dts/marvell/armada-8040.dtsi  | 36 +++++++++++++
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 17 ++++++
 drivers/iommu/arm-smmu-impl.c                 | 52 +++++++++++++++++++
 drivers/iommu/arm-smmu.c                      |  3 ++
 drivers/iommu/arm-smmu.h                      |  1 +
 7 files changed, 117 insertions(+)

-- 
2.17.1

