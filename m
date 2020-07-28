Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3E1C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 03:15:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83D8421775
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 03:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfTig2D+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgG1DPD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 23:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgG1DPC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 23:15:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47ABC0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 20:15:01 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mt12so3328109pjb.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqvPFptaXrqNLR/xpVd6gqyLWNSPgfU8K5sYlQ8u1qk=;
        b=MfTig2D+aYwwa+XQpMSjtudJi6GMDOHV1l6mBKV7hAMMghTpxbq478ZNPNMlVsOeWi
         yLsYPYGtEXOT2mrDzUb6BJx5lUg1V3gn6YdRJKKv1GUHL90KDPfHOfGINlaagEi/0hPC
         3llxQQkuycFFeX7edCokUFbc5zSCiBKd6eZAYpIxPbCyYoxtGOgHWataeD38y9F14qGQ
         TNx3jvz+sVvHBP3oT7jwF69qV4NA0tNRv9f7FZnUTKAJqTgSVNlfLdh+R3poOjPBqXzR
         3BtmMml7SQBYhiG/ZFMCZ4nIZ1kIPOjvT/OAUchfyurXVgTWk856aYaZCf0zYEsHaXnv
         OLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqvPFptaXrqNLR/xpVd6gqyLWNSPgfU8K5sYlQ8u1qk=;
        b=scZAAcJIOp2gzxRiQQ++MAPtcbgzVSJ7ogmC8Ae8d0rczeyropPuG61EPTIS22WDDr
         SFC0v2+oxNwQLQGJr10D9U/JrirXbOOJzt4HKCxuWFpqAb2XLwVYz2kP3ykw1xJ10mEp
         mnviTG4GefOFE/mLTSwnjoZowRK8aqZFOL5uT/986ri7ISN8w2jDv4VTmbwphWYUPgyC
         kmC9V6ZUc6vILqqgn6M29CCFIYrYIYo0hE9/RWp9fWuLFURq/K3krTELzTi7erLTNruJ
         cDGLIZGtxDJULSACXoMO5yfNuKZmFDhvLgb8XUEchLDrfbWXe5M7FEwECYLyLnmOXux0
         m1BQ==
X-Gm-Message-State: AOAM530doQRAKgaLwsJ//x4LM81/ll/tNanO0w1MoHe0orFxxdt1gqkv
        0pVfsdTFKGzHUAQufzrLynhrgw==
X-Google-Smtp-Source: ABdhPJxs1jdMEm+AIUYt11RFJG6KlKTFv/6nraFuHw6vmYq4NWdqisr5zlsOqt5+h+EYMaUvuXwCvQ==
X-Received: by 2002:a17:902:b18b:: with SMTP id s11mr21796119plr.152.1595906101384;
        Mon, 27 Jul 2020 20:15:01 -0700 (PDT)
Received: from debian.flets-east.jp ([2400:2411:502:a100:c84b:19e2:9b53:48bb])
        by smtp.gmail.com with ESMTPSA id s10sm3895285pjf.3.2020.07.27.20.14.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 20:15:00 -0700 (PDT)
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     masahisa.kojima@linaro.org, jarkko.sakkinen@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        devicetree@vger.kernel.org, linux-integrity@vger.kernel.org,
        peterhuewe@gmx.de, jgg@ziepe.ca
Subject: [PATCH v5 0/2] synquacer: add TPM support
Date:   Tue, 28 Jul 2020 12:14:30 +0900
Message-Id: <20200728031433.3370-1-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds support for driving the TPM on Socionext SynQuacer platform
using the driver for a memory mapped TIS frame.

v5:
- modify multi-line comment style
- remove MODULE_AUTHOR() and MODULE_VERSION()

v4:
- add ACPI support
- modify function and structure name

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
 drivers/char/tpm/Kconfig                      |  12 +
 drivers/char/tpm/Makefile                     |   1 +
 drivers/char/tpm/tpm_tis_synquacer.c          | 208 ++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_tis_synquacer.c

-- 
2.20.1

