Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19431C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 00:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA1A62076A
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 00:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wf1CIIae"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731354AbgFWAAH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 20:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731175AbgFWAAG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 20:00:06 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64818C061573
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 17:00:05 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id p138so14115569qke.7
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 17:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Kbj1L+CzMZjrx3rE3YlmC8C322viCZOa/XuI/qh7XHY=;
        b=Wf1CIIaeJEMzJi6JMIFXDfHyQR55ZHih8Vuj42ZuhQsZi3B4T0DcfW7B6bzUaRlA+4
         RUdnu6z6atcjpOcEClW6eApEVb/0eh3O7NP9V8zS99xfb2cc0AKLLoIabCt49VQd4wTR
         hdWzAAyGvPrP60Qm+lEYw/Xrb8dNVUAgLDjLB+YhLkbdjEFJ9wHJxR4QXGjIK21M5fw1
         ZkZrMwO+UoC0piEKeOebhYAsba/2SJrmGFKTnA+bNImUzLGPQIUeYKR9PYtp/H4PIatf
         lrR2VHfSzMvJ6kpzgkp5OVrFVHRdq7B3e7GDDcB/R3ZVFuANKIG/nj3c8KxijND1D9J4
         alUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Kbj1L+CzMZjrx3rE3YlmC8C322viCZOa/XuI/qh7XHY=;
        b=NLnzlQqeoFTSCzaVqq4CV1GL1f6URTaDcQ1xjWrrOTECtkHA26nd9l7HTK9kEQmpE6
         nLiJTmRWQzi1PXWBgcyUgQ/FytovICmb8Z1yhbgpX1nbEN86bo4PUuKDAC8e7DHAX6Cd
         h6xaNRLqXoffxld1VWEKl5KtCB+8zJUMmDJbugufT4+NKewwqFlKxYDjYS2YSqTj9N5e
         xBLLinoudZ6tINzrLpifDXMDL2xMs2Ek/hQ76TZAqTykWLo3rl+zOAoaiq5YUpCsf/B2
         saRae86/txdZyVm5azzNUFwqTU5dYU1LYQkMmQ+vVYuHRBM4mt+7qH1zw1UQglYVYtWB
         pGbw==
X-Gm-Message-State: AOAM531gJaRDzzAqgRLw2YHVNd2pqFtSx1vpf+GtRnCqtqR2XGbJ3niC
        fiaoUHcLnsLjBPgGxI3xaA/ZdSDRG6sa
X-Google-Smtp-Source: ABdhPJzD2pnYyDNNYyJdRWQ9j/+yUwfi4kxZdw0W0H54U6n8c4awjxcuKblW4xDd0d9NT7OK7zgjBI5AU9qD
X-Received: by 2002:ad4:4e61:: with SMTP id ec1mr14236966qvb.197.1592870404041;
 Mon, 22 Jun 2020 17:00:04 -0700 (PDT)
Date:   Mon, 22 Jun 2020 19:59:47 -0400
Message-Id: <20200622235950.169001-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v6 0/3] CH7322 CEC controller driver
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add device driver and device tree bindings for a Chrontel CEC
conroller. This is an I2C device that can send and receive CEC
messages.

Changes from v5:
- Kconfig option should depend on I2C, not select
- add flag to cec adapter in order to use notifier without addr updates
  (notifier is needed to enable CEC_CAP_CONNECTOR_INFO)
- add optional dmi matching to associate adapter with hdmi port
- read phys addr if hpd is up instead of relying on pending interrupt
  in device probe

Changes from v4:
- rebase onto master (vendor-prefixes.yaml already updated)

Changes from v3:
- address devicetree comments
- revert interrupt mask/unmask in cec adapter enable
  (the driver relies on the interrupt to get the physical address)

Changes from v2:
- fix formatting errors
- mask and unmask interrupt in cec adapter enable

Changes from v1:
- fix formatpatch.pl --strict errors
- additional comments
- enable and program logical address register
- add flags to aid interpreting transmit done status
- move ch7322 out of devicetree trivial devices

Jeff Chase (3):
  dt-bindings: Add ch7322 media i2c device
  media: cec: add adap_controls_phys_addr option
  media: cec: i2c: ch7322: Add ch7322 CEC controller driver

 .../bindings/media/i2c/chrontel,ch7322.yaml   |  67 ++
 MAINTAINERS                                   |   8 +
 drivers/media/cec/Kconfig                     |   1 +
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/core/cec-notifier.c         |  11 +-
 drivers/media/cec/i2c/Kconfig                 |  14 +
 drivers/media/cec/i2c/Makefile                |   5 +
 drivers/media/cec/i2c/ch7322.c                | 604 ++++++++++++++++++
 include/media/cec.h                           |   1 +
 9 files changed, 708 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.27.0.111.gc72c7da667-goog

