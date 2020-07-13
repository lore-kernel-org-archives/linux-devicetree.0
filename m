Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF25C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B592067D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oSanfCWg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgGMJMg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGMJMg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 05:12:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47485C061794
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:12:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so5935330pjc.4
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8w3F7eoFwp6zTrsEU3OM3mMV9A6pzMUaFVXnW/3/+00=;
        b=oSanfCWgfwp8BUU/AtaHKnrnFjyipfAuA6RrtCob1El3wIsNjk3Lz7nVseBIur745f
         OY+EXDexxnKeOkeInxuEt8v1TPNShMb17GnoHCHNIunyQndCSeKOfqt7gDQn4JwBERtR
         i/HFX/5oj8Hlgz5PMzsaQt/442K/YfrP18AqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8w3F7eoFwp6zTrsEU3OM3mMV9A6pzMUaFVXnW/3/+00=;
        b=EWdWJdxTrSEQjdj+jtUfpHrwbB/ZluT01XTWJY/7M54/szBsLihjPRLsHQDkYGJ91f
         POgsQXte+qd/GCIrWvGn0CYdIuRSxXw7yPVacB8/K5SlsdAVs56XHzHbUYgLda5L3f6+
         ZcDdMKIHZM1VI8/69inN0MIIrVtpTJWZUePF8fIaXb8CHrpa3o8Kr44YwB8jrCEGevfv
         luy5MmH+929mWEk7DNr94VlZ27Mv0J7nNa1F6eYO/hf+50fIprmffV/jwxOLKSabe7Xa
         UXJmleBFpr/Qescd+/M7DpI2TtkGaGgUNvEKE8iOej6kIrzjCbiamzQZlEtMsBgRUFB+
         LbBQ==
X-Gm-Message-State: AOAM530Rfd5H1PuwnIXXnZ20oVGQMA+rwHeV6Sf3GCOKAcX56avQf7fE
        soxAkGcML7NzIU61WmfvGhUDLg==
X-Google-Smtp-Source: ABdhPJz/bPSgglZGd/h8Rf2Rip53WAhFlRZHiMx+kJEU3tD3iG9U0Yk8dgrlkb9pjI7czOfCiq86+g==
X-Received: by 2002:a17:90a:b10e:: with SMTP id z14mr16344354pjq.146.1594631555662;
        Mon, 13 Jul 2020 02:12:35 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
        by smtp.gmail.com with ESMTPSA id b6sm14000538pfp.0.2020.07.13.02.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 02:12:34 -0700 (PDT)
From:   Claire Chang <tientzu@chromium.org>
To:     robh+dt@kernel.org, frowand.list@gmail.com, hch@lst.de,
        m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     treding@nvidia.com, gregkh@linuxfoundation.org,
        saravanak@google.com, suzuki.poulose@arm.com,
        dan.j.williams@intel.com, heikki.krogerus@linux.intel.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        tfiga@chromium.org, drinkcat@chromium.org,
        Claire Chang <tientzu@chromium.org>
Subject: [PATCH 0/4] Bounced DMA support
Date:   Mon, 13 Jul 2020 17:12:07 +0800
Message-Id: <20200713091211.2183368-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
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

For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus
is not behind an IOMMU. As PCI-e, by design, gives the device full
access to system memory, a vulnerability in the Wi-Fi firmware could
easily escalate to a full system exploit (remote wifi exploits: [1a],
[1b] that shows a full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce bounced DMA. The bounced
DMA ops provide an implementation of DMA ops that bounce streaming DMA
in and out of a specially allocated region. The feature on its own
provides a basic level of protection against the DMA overwriting buffer
contents at unexpected times. However, to protect against general data
leakage and system memory corruption, the system needs to provide a way
to restrict the DMA to a predefined memory region (this is usually done
at firmware level, e.g. in ATF on some ARM platforms).

Currently, 32-bit architectures are not supported because of the need to
handle HIGHMEM, which increases code complexity and adds more
performance penalty for such platforms. Also, bounced DMA can not be
enabled on devices behind an IOMMU, as those require an IOMMU-aware
implementation of DMA ops and do not require this kind of mitigation
anyway.

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/


Claire Chang (4):
  dma-mapping: Add bounced DMA ops
  dma-mapping: Add bounced DMA pool
  dt-bindings: of: Add plumbing for bounced DMA pool
  of: Add plumbing for bounced DMA pool

 .../reserved-memory/reserved-memory.txt       |  36 +++
 drivers/of/address.c                          |  37 +++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   6 +
 include/linux/device.h                        |   3 +
 include/linux/dma-mapping.h                   |   1 +
 kernel/dma/Kconfig                            |  17 +
 kernel/dma/Makefile                           |   1 +
 kernel/dma/bounced.c                          | 304 ++++++++++++++++++
 9 files changed, 408 insertions(+)
 create mode 100644 kernel/dma/bounced.c

-- 
2.27.0.383.g050319c2ae-goog

