Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA76C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 02:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CF53206DC
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 02:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQhRm5S1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgEOCwI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 22:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgEOCwH (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 22:52:07 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188BFC061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 19:52:06 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id p126so763832qke.8
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 19:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=NAyaejGrf93nt8pW36yE2fNFkiHLtUAH63j40bBmenI=;
        b=ZQhRm5S1cEg3649XV8qDQfM7xNWtqqmevcu401ZzYJJzZAXPmJno+266EDY5uEKtkw
         ifZTmFUHsOUEDT6VYK8UFoyaPole5rIJ+0+ygxasn8rfSso/WKZ2lUzXP9tSISABoFQz
         qVcMvlIngJmaQX4mAhOjKntXui+zHGW4cr8ivUL141QCsPt0brMzwWNXuSUW1U/JLC94
         LA6rYGhODdHMII7BTX6JP4IkCs1oaH2SSwzEPwPcLschCgMLgPVVarfm3zSv0Va3xkL8
         lyD2N4mLq8hyVwYfx8IxevDQgM4f/vKv/MZwHcKtAnuagdc4Qgvcd/v2oGgOXuqupX7y
         XrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=NAyaejGrf93nt8pW36yE2fNFkiHLtUAH63j40bBmenI=;
        b=DaYgqsatdXrRBVx/RocJZBeA9jSbiYMxSqUls0ScCbvp/0v4Lwx16wUtatToTsfGE/
         iOQuC7lPuT2FiGhg6Epbh7cEw4qLcj213d5JbtV+pWhbAa3BByFW8H0zab4SyiKQSH2Z
         sSVo+Ri0pM7bEPoRlczAcHbzl1hZWCC+QJAEGmPmYPBz9MNYOuP2MZ3douSaZys81r83
         cSkohO+Oa8PZQsi76yHL4SFavZJE1T3c92ZzO0y1n8RYDZURMWCm1WXBvmRAcWz5SG3H
         CfF/2qJvRcNzvsMacneOWxe0LW76jcJ7xf8w9/9rohkTkzqQ4LZARjHgvmfNpXYzdaVi
         AVSg==
X-Gm-Message-State: AOAM53363uIAYuXuIyvt4UHIEgHv467B/dUsSLrJxhYv+/GEEWXmI0Jk
        JaH+aIF1jenpgVksNgDXdwRyMxPZ9JCn
X-Google-Smtp-Source: ABdhPJzVF7glSMtfobwUtKu/g8RRnTn+EXn8JI6tlCrq5/XbZH99kq3gAROFhsNb3fT5Mdpr3CNz7GlT0hLd
X-Received: by 2002:ad4:4c4f:: with SMTP id cs15mr1397904qvb.117.1589511124983;
 Thu, 14 May 2020 19:52:04 -0700 (PDT)
Date:   Thu, 14 May 2020 22:51:57 -0400
Message-Id: <20200515025159.101081-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
Subject: [PATCH v2 0/2] CH7322 CEC controller driver
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
 drivers/media/cec/i2c/ch7322.c                | 501 ++++++++++++++++++
 8 files changed, 597 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 create mode 100644 drivers/media/cec/i2c/Kconfig
 create mode 100644 drivers/media/cec/i2c/Makefile
 create mode 100644 drivers/media/cec/i2c/ch7322.c

-- 
2.26.2.761.g0e0b3e54be-goog

