Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD5AC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 05:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 151762177B
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 05:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QLDIFiwe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgG1FBr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 01:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgG1FBr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 01:01:47 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF7AC061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 22:01:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t6so11215971pgq.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 22:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pvK0ev5cxRiAMES2LwocRB0zuTfv4RSfxEp+cEikUek=;
        b=QLDIFiweKFoEeNtrtNBe8Z0TBBcqdWvmwRC0OtwsgH0XE//RxcPxO1+FWIBAKL+8sH
         H1q/GUF6ztaNV045qC5aYjMEHpRq5cCdo0rh7LuzJ6Bnn0yjqTEbVdeAuqKcj+2sVjb0
         IkRwS+zgtBoc84wtK1WEbg6TwcuGvllnZ6mus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pvK0ev5cxRiAMES2LwocRB0zuTfv4RSfxEp+cEikUek=;
        b=oZOxX4uqHn8RRlRMkJLbZv21xSGkXYDgti5gkEFDSTN4hiPghkmvMd11PBDr/60FK7
         FxetXzicRCs+cVmM1HLomx18/c3zOugAmk+9SU2eR/86yd+gh7ZABLRchhOxAC6xYVVX
         UfBcKx75wiFje1Rf8NZ3P58QAQP+PzzapPrYPFsMkG1aSM/vh/6pyOCd8F01iEeYD0/z
         dJFNHK7Dy3l78WMD7DDrhoI0wGzgfQ9SdVOXaiE9Wo/K02Yejegl5UlgSD/UQ16GzCUT
         YDgCX5LBueOQiGC8aZ2DmTxRX7gqa3p6G5KoAWiEyfG1nLHE6AlJSxfa/S4S6L/4xK3U
         X9Fw==
X-Gm-Message-State: AOAM533yQfLlS9j4xdA0NF6nCxV6ih5Key8Q699WD90qpjDZxFXXzPrB
        wW5sPQABfMpt1Zzvft6tsNe+vA==
X-Google-Smtp-Source: ABdhPJy67ViNBgTVNsG3xR6SCIBkpWpQ424Q+eyNgk/Qkb1lwIhrNajWk8Z3yx2L14WHn2HWf2CHjw==
X-Received: by 2002:a62:7958:: with SMTP id u85mr113344pfc.248.1595912506759;
        Mon, 27 Jul 2020 22:01:46 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
        by smtp.gmail.com with ESMTPSA id mg17sm1278157pjb.55.2020.07.27.22.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 22:01:45 -0700 (PDT)
From:   Claire Chang <tientzu@chromium.org>
To:     robh+dt@kernel.org, frowand.list@gmail.com, hch@lst.de,
        m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     treding@nvidia.com, gregkh@linuxfoundation.org,
        saravanak@google.com, suzuki.poulose@arm.com,
        dan.j.williams@intel.com, heikki.krogerus@linux.intel.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        drinkcat@chromium.org, tfiga@chromium.org, tientzu@chromium.org
Subject: [RFC v2 0/5] Restricted DMA
Date:   Tue, 28 Jul 2020 13:01:35 +0800
Message-Id: <20200728050140.996974-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series implements mitigations for lack of DMA access control on
systems without an IOMMU, which could result in the DMA accessing the
system memory at unexpected times and/or unexpected addresses, possibly
leading to data leakage or corruption.

For example, we plan to use the PCI-e bus for Wi-Fi on one MTK platform and
that PCI-e bus is not behind an IOMMU. As PCI-e, by design, gives the
device full access to system memory, a vulnerability in the Wi-Fi firmware
could easily escalate to a full system exploit (remote wifi exploits: [1a],
[1b] that shows a full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce restricted DMA. The
restricted DMA is implemented by per-device swiotlb and coherent memory
pools. The feature on its own provides a basic level of protection against
the DMA overwriting buffer contents at unexpected times. However, to
protect against general data leakage and system memory corruption, the
system needs to provide a way to restrict the DMA to a predefined memory
region (this is usually done at firmware level, e.g. in ATF on some ARM
platforms).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/


Claire Chang (5):
  swiotlb: Add io_tlb_mem struct
  swiotlb: Add device swiotlb pool
  swiotlb: Use device swiotlb pool if available
  dt-bindings: of: Add plumbing for restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  35 ++
 drivers/iommu/intel/iommu.c                   |   8 +-
 drivers/of/address.c                          |  39 ++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   6 +
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/dma-direct.h                    |   8 +-
 include/linux/swiotlb.h                       |  49 +-
 kernel/dma/direct.c                           |   8 +-
 kernel/dma/swiotlb.c                          | 418 +++++++++++-------
 11 files changed, 393 insertions(+), 189 deletions(-)

--
v1: https://lore.kernel.org/patchwork/cover/1271660/
Changes in v2:
- build on top of swiotlb
 
2.28.0.rc0.142.g3c755180ce-goog

