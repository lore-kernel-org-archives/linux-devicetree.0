Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35763C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 03:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FF5A2071A
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 03:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iR0wgaCZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391745AbgE2DA0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 23:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391727AbgE2DAU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 23:00:20 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31341C08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 20:00:20 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id y64so812847qkc.19
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=lI0Q6FZINWMsCqdHMNmAEdxWrOY+He9ibCjQyKGbuIo=;
        b=iR0wgaCZ4Cqh0pE/qgXOa1suDs5YWBzaulscmYb2YUgV2sA9zHfS7zjVfINGwrhkbc
         fXtlLJjqejfEsL9x/WY3TnkaK31HM9lA9kLPZKCFCXqPgzulGPgSaekSdykIR/L3bKRS
         psMXsaG96OSATMQYHeszaY8qIlH9zRIcec5GO2GW30+YDzXVdJtw15i7O4TR9IOnOJz0
         0uM5kQG8T+JiH00KK3Dep7OSuWu1R3h+109QXLT0lyeVaxp3ggzgcOqfGJ381DyiJLpU
         xcoEh6fmE8Jmn9/2n8yjFemuB6qC2NhcB8FJjwPO8tYSKKQ9ydrtvjgiGyf4mLiJWQKX
         vYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=lI0Q6FZINWMsCqdHMNmAEdxWrOY+He9ibCjQyKGbuIo=;
        b=tsbwYlPWXvbyrN4lLCXByjQMwKOVT2IGvMmwrwvOQkQuSSud2CXOGOElk0HRvvEKW/
         2Xkz3qSwmOrZD39ZYwumCjUiyNAWRaDrnQx3fQeF0RLrUs7vafTGQnDcmDEYWMrzL+gj
         Xz1taNZi42e6gDGnK0V87XXIEVhIu2+zF18SuShNRdBbJXwxfdsDLrRVTWWGP9/3Rixy
         rozJnjNG0htQV4MsML8nvyok5MGRXwtwyyHo+FIAtf3tIX7RZqCrDrmHCQe2ytqVzOYP
         91roNHNSvKgneGL2j/5LNoichB9JX/aby059iqdbf0BE6GAxt+P3kOdal8Jm76dTmpB6
         FJtg==
X-Gm-Message-State: AOAM5336TntRM3qf1nMIaVz+Jh64kKF/9GfiVe0sgYbtYMB7oT+9Rc5b
        JR6mwkEjW1FTFgjR1ts0sCXYDdPTCd2C
X-Google-Smtp-Source: ABdhPJyZfiv7R2c/sS2hwIC+F1gIlp+a63vWm1DnHY3Ra0l1F2/057hmvFvmeEuVeO/iQwjJe9keFhdI1x9x
X-Received: by 2002:a0c:e48f:: with SMTP id n15mr6380735qvl.73.1590721219377;
 Thu, 28 May 2020 20:00:19 -0700 (PDT)
Date:   Thu, 28 May 2020 23:00:10 -0400
Message-Id: <20200529030012.254592-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v3 0/2] CH7322 CEC controller driver
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

Changes from v2:
- fix formatting errors
- mask and unmask interrupt in cec adapter enable

Changes from v1:
- fix formatpatch.pl --strict errors
- additional comments
- enable and program logical address register
- add flags to aid interpreting transmit done status
- move ch7322 out of devicetree trivial devices

Jeff Chase (2):
  dt-bindings: Add ch7322 media i2c device
  media: cec: i2c: ch7322: Add ch7322 CEC controller driver

 .../bindings/media/i2c/chrontel,ch7322.yaml   |  65 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 drivers/media/cec/Kconfig                     |   1 +
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/i2c/Kconfig                 |  14 +
 drivers/media/cec/i2c/Makefile                |   5 +
 drivers/media/cec/i2c/ch7322.c                | 523 ++++++++++++++++++
 8 files changed, 619 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.27.0.rc0.183.gde8f92d652-goog

