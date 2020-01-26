Return-Path: <SRS0=8cl9=3P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D41C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 17:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C95C6206D5
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 17:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drZFzvjT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgAZRj2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jan 2020 12:39:28 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35049 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgAZRj2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jan 2020 12:39:28 -0500
Received: by mail-pf1-f193.google.com with SMTP id i23so3805941pfo.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jan 2020 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JPhbtBY8gOwYPx83UtyAbhByhPVYNxgtrCHSPOuLVIc=;
        b=drZFzvjTvMiYn9QTMd/4CgtR03LvxmNKIhzuCqVkUTJfZ5i9jskToxvFsUmMnIe/HN
         x/OpkkvGh7O4olV81J59L3DUglC0F0GZxiUwiy3NK6vXKtQyE8QbduSCRflmgJFtEauR
         3hDwTvqLMB8nZ/HbIPm90g5PZhPUSSsD40NndOo85lcqbNcSYQtzgyT3Gv8lD3n2QGsV
         smYWW0kdm8c1mfTlOA/yUVi/cI8f9u9EV6tD+DtiSJfD8pfxByk3YWhiNcRt/cv+0jaU
         xUCHPkNuSA3E4pmu0fTCQdoHaP7A70QdcxDJ4EfsCItRgBRsgi3hr8gKIV+1wf3rHckd
         zOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JPhbtBY8gOwYPx83UtyAbhByhPVYNxgtrCHSPOuLVIc=;
        b=sxA3gJibJrRbld+Yzuri3wh7Pbc1978qrGcRNpfoWQtIxlhposRJz7F+AZ9+ce5W1a
         4k/fbkkoD7eE2/B3e/w3bGNZzd9UuU3V7LuVTzCOqFGoPN6g0hwniq09UruS7j4EZBL9
         ZQcaxRwZd+rrUHN1w4reoeCXSmeoEr5cB8rdgZQrSBWneK6bTNtv9gMc206DrkuPSH4K
         6zrPtvUQAozFKonWBAKey8sX25i4r7sbkHekNfxgfdbFl7IPYX4tVTUePzimtXxPVIFO
         476M3+f3BuQhlFztUb72HYTbMU4mAf25kLFYv4L5ya6de5lWCi+W4GiTWNCpyo1CfwNG
         4JiA==
X-Gm-Message-State: APjAAAVfXC+O/X4nAFbb0v25BmYKHL9Yag+N+SGU+2bSJsuHxfwYjNAx
        PaPdnBHje8cqWY3RJrChOLw=
X-Google-Smtp-Source: APXvYqymd3pnKnhpGeURpfHiVrfcNVx7H6x5T+c2klPzkNN9/ENjmoTTDJdgYC9G4F+kOwyRNlWXQQ==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr12158872pfn.181.1580060367329;
        Sun, 26 Jan 2020 09:39:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id c184sm13125548pfa.39.2020.01.26.09.39.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 26 Jan 2020 09:39:26 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v2 0/2] Support for tft displays based on ilitek,ili9486
Date:   Sun, 26 Jan 2020 23:09:00 +0530
Message-Id: <cover.1580059987.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The goal of this series is to get the displays based on ilitek,ili9486 
working.
Ozzmaker, Piscreen and waveshare,rpi-lcd-35 are such displays.

v2 changes:
* Changing file from txt to yaml format
* removed ilitek,ili9486 from compatible string
* assignment of dbi_command before registration
* made dc and reset gpio compulsory
* typos and unwanted comments removed
* changed the name of function which were display specific
* arranged the Makefile entries in alphabetical order

Kamlesh Gurudasani (2):
  dt-bindings: add binding for tft displays based on ilitek,ili9486
  drm/tinydrm: add support for tft displays based on ilitek,ili9486

 .../bindings/display/ilitek,ili9486.yaml           |  79 ++++++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 283 +++++++++++++++++++++
 5 files changed, 384 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

