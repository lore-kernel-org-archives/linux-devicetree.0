Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDE8C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 19:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD14120714
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 19:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rw0geJKs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbgFOTiS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 15:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728571AbgFOTiR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 15:38:17 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F281C061A0E
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 12:38:17 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id i82so15027452qke.10
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5eOZUAynrB54V2IFcB0rduao9pIQ/GV86N0Z7+fYQuk=;
        b=Rw0geJKsbkTzCx1CNT4BSLxHeMF0uXmJ36DSuJbfRs4jqw4O2fIZranQppKk4Jixi8
         +PsChKOjN9TYHcZWdBaAfTRyuHu0eLt4X9zTn3llYtSQgkjB/vPmyxyW58sW7ctcVK6m
         nALDmJNiS4frYolhjIc8TpvVWJciw7bTzbQpxvkOhMMFzHKVk6a/Lyg106MmWoeiSKpl
         96LPpNnfTvX0aqrd9b1SUmmES1oF/eC0uTR43jb1rdZOyuO1fUM3hZ8SW0QZsPKOKsVa
         UA4DWhKxW3I484NOmuqfRT1CtZgBpB5VMxHbYuyJjmw62cp0wsilI6EyfpmPpO8G6TTZ
         MvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5eOZUAynrB54V2IFcB0rduao9pIQ/GV86N0Z7+fYQuk=;
        b=p0t8Xz7VYujpBfALCk/W458c9tpcjae1/JkY+62HfMpGmhwizXXmcOzgYeOdNpw6jD
         4w5hHiQwcqaayAaTLR2p8v+rb3cV6aONk4UuW/oqnlCaC0fjkeRMKtU4/sqA7XXl/s/C
         FHFbJfgdTo4ko6dHCL+c7nHbjUY0Lo+FOQD1I7q+7Irdn6k5FisMfLWwVruxV3IEDnrd
         4UuK1Ow9jq5+rXGLKD8l9p3WjnBL476AS20tF1Kma/gI77HwWuQXxLTpwwG77Tkk/gRf
         EbreKWnu2qVM+cpwUsgt8Yxeux/cSlWSVE4+zG84YI4rjsNl7BvQxMyW/gZSG++4eeaE
         Ps0w==
X-Gm-Message-State: AOAM530ToumiX8tWLI5WoLyQH0Y4rFLswyRU9MEkXyuDTkDrDUruwyC5
        La5kuPnSJ3I3dv7m4c27M5VciPbgpr2J
X-Google-Smtp-Source: ABdhPJwRDxMUcF+Z2stea+XUcMYbmNoEZH2WRU4z72FyekNDlYKYCgYKDnS0rsS9L27ixycQv8H4OQs3X1+s
X-Received: by 2002:a0c:ed26:: with SMTP id u6mr25754393qvq.141.1592249896661;
 Mon, 15 Jun 2020 12:38:16 -0700 (PDT)
Date:   Mon, 15 Jun 2020 15:38:09 -0400
Message-Id: <20200615193811.233737-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v5 0/2] CH7322 CEC controller driver
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

Jeff Chase (2):
  dt-bindings: Add ch7322 media i2c device
  media: cec: i2c: ch7322: Add ch7322 CEC controller driver

 .../bindings/media/i2c/chrontel,ch7322.yaml   |  67 +++
 MAINTAINERS                                   |   8 +
 drivers/media/cec/Kconfig                     |   1 +
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/i2c/Kconfig                 |  14 +
 drivers/media/cec/i2c/Makefile                |   5 +
 drivers/media/cec/i2c/ch7322.c                | 503 ++++++++++++++++++
 7 files changed, 599 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.27.0.290.gba653c62da-goog

