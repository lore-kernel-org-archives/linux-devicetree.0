Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28345C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 13:15:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 037C72067D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 13:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFobAKv2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgGHNPR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 09:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729279AbgGHNPR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 09:15:17 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA29C08C5DC
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 06:15:17 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j19so14793509pgm.11
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 06:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tD3yXXYrZBDZiaasLSPTnCbaqXGiYzdMQ85B623c77c=;
        b=wFobAKv2fT2uz6kMUx+BoKMuaaC9GeYTNAITsfnBxD5OxcSBP3lSHFma1Zj7S0Hdzr
         UUfRWmQoQYcTB+hsGTrWsU7I+y7638a6nsTQxMtdVFFK1fsPNBN4krGRdeNuVulwjRuE
         OHNZXEtwipyidnhcJ51Xupi8Ta3PdZge9j4fXhYfEGRlpbozVbKy4fLvRcM7c/5WDLxc
         8LHaU2GnOISiSLqyWjApu1HNN1Ihr1TwYya3zOyWRA8K6Kzcj/50ETqgNKPF1WOnEjq1
         /cJIyv6FvWucuNoq9NdtrX1yw4kjqa8vVNA5QBznOK7B11GyvBusp73UOk6uurZbLq8K
         KXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tD3yXXYrZBDZiaasLSPTnCbaqXGiYzdMQ85B623c77c=;
        b=SxsEQaObGiQqpH4eezShzaKVxYj5W+d26Bi/2l3FmpOiEtXPSQWJ2PaU22ID49ep/P
         6/b6ir9aqRrYdPK+pyYbUQH2zmxMi934TI/uMrZXV2RwlCWg4NzakJF/zcrnoabFrQ7U
         u/uuIC1mySXxAWDga13+dfTB0Shu3GKms2vMSLWFqAaMGIjCBeDv1QOpHiAngKGo3dPN
         95qLXj1VsqM+71YurlmtvoZIEfoLLvFEIDsTtQExl7y53nBN7hbR1fj2IeYcv1wfV/9P
         xD7y1yB1Kw/rSc4+WGeF+YdmGl4cPTFg0hAuQLe5+FoLheKzFg4ntD7xL9OUU0WEpb4x
         EZSQ==
X-Gm-Message-State: AOAM530XgaxnBKafddGoCU0L2i/k88St3o/eESh20Was1TB5XJCkJrRD
        af264bAvvYrQAfiXXJQfbF5jtw==
X-Google-Smtp-Source: ABdhPJykPhQKyVU2AtTCF2en4Y3XBqA9jCD1yPwNFMAwKzsHQRe5TeVYiQ/+HRtFM+9k7DKHXkJnjw==
X-Received: by 2002:a65:5649:: with SMTP id m9mr48046978pgs.279.1594214116713;
        Wed, 08 Jul 2020 06:15:16 -0700 (PDT)
Received: from debian.flets-east.jp ([2400:2411:502:a100:c84b:19e2:9b53:48bb])
        by smtp.gmail.com with ESMTPSA id y63sm4096366pgb.49.2020.07.08.06.15.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 06:15:15 -0700 (PDT)
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     masahisa.kojima@linaro.org, jarkko.sakkinen@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        peterhuewe@gmx.de, jgg@ziepe.ca
Subject: [PATCH v3 0/2] synquacer: add TPM support
Date:   Wed,  8 Jul 2020 22:14:22 +0900
Message-Id: <20200708131424.18729-1-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds support for driving the TPM on Socionext SynQuacer platform
using the driver for a memory mapped TIS frame.

v3:
- prepare new module to handle TPM MMIO access on SynQuacer platform

v2:
- don't use read/write_bytes() to implement read/write16/32 since that uses
  the wrong address

Cc: jarkko.sakkinen@linux.intel.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-integrity@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: peterhuewe@gmx.de
Cc: jgg@ziepe.ca

Masahisa Kojima (2):
  tpm: tis: add support for MMIO TPM on SynQuacer
  dt-bindings: Add SynQucer TPM MMIO as a trivial device

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 drivers/char/tpm/Kconfig                      |  12 ++
 drivers/char/tpm/Makefile                     |   1 +
 drivers/char/tpm/tpm_tis_synquacer.c          | 196 ++++++++++++++++++
 4 files changed, 211 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_tis_synquacer.c

-- 
2.20.1

