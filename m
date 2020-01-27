Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF017C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:06:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 819252071E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:06:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L12qN+kJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgA0OGx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:06:53 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46704 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgA0OGw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:06:52 -0500
Received: by mail-pg1-f194.google.com with SMTP id z124so5186977pgb.13
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UR3h5nrfJHdQliakSZtipAYKwFl6uOKWlJ6IfQvABM0=;
        b=L12qN+kJLWkPwQhT4M3TBYMoUEmBbJ6U2VAEvfffXWHocq74miL+za2/eE1qEUW3wf
         2xg8zF0C64LG80ND9N8KNIWHhiACitzw/CgcJEDu1c3tEgRqrGMy4slGg5+5xBabi3hn
         ob9EBJSYyw4VK9pBxV9rEFYFoCErnOA1OMNNAozzbhmYpGoq9WiZwEyHsI72W5/9RMZ+
         SIBPYqQiZImwJVENcm/f5aDysYzGmbQ29oAitztenbceLza2PGuekU5WdKGsVAe6TFQA
         zyZNIXBPv2HpfpYt1MVjsvp3NikHaJ0vmczXmHzZYBfJybn97Dy2IwkNapNGnKZFwEfa
         EE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UR3h5nrfJHdQliakSZtipAYKwFl6uOKWlJ6IfQvABM0=;
        b=fgVVfj0SDcXZwQneVyOzrZpUNkFxy2rlUaIMGJmptCQi0txTkd41XKSbUYTWBg5jm9
         BdUgV0WrYXTBCr3dzGuN0s7MF03nQ4WxNurA2UNSQwarPKp5NGMODOnUMviYwVAjjUQ3
         1NZpULzhwHl4kS4i3BQvugLBNCZsz/fx9P2abU/sGFdvMJizYSnpWcyvpSfZkXso9PYh
         YChysHKY0PPjjHwOvHaAFzbicHcjPyOoIiJP1QcIebmMdGLkuypL+9encxWQMHWwa0im
         UVIQMUfDcDhsKvTZ7j32ZDZNFWDH1/Ix4yKzXAh7/1R0TszpjPCGp4UxmJhaiBHM5JC+
         H9Cw==
X-Gm-Message-State: APjAAAWN5iHdPuRd48UsGO8c7D9Ha70Afu21SCda6ax/Dma1tLQ5u1PV
        stCIdcIZj6yQ9osNfPRvCAg=
X-Google-Smtp-Source: APXvYqzYXpmMd8tKKyZVc2br06gRBHFtpr+30z5ChUnFVkz8Nrrz3j36MshggXJp4KbyXxZhfMlS5Q==
X-Received: by 2002:a63:6c82:: with SMTP id h124mr19563264pgc.328.1580134012093;
        Mon, 27 Jan 2020 06:06:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id q4sm12779225pfs.65.2020.01.27.06.06.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Jan 2020 06:06:51 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v3 0/3] Support for tft displays based on ilitek,ili9486
Date:   Mon, 27 Jan 2020 19:36:44 +0530
Message-Id: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
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

v3 changes:
* added vendor prefix patch to this series instead of seperate patch

Kamlesh Gurudasani (3):
  dt-bindings: add vendor prefix for OzzMaker and Waveshare Electronics
  dt-bindings: add binding for tft displays based on ilitek,ili9486
  drm/tinydrm: add support for tft displays based on ilitek,ili9486

 .../bindings/display/ilitek,ili9486.yaml           |  79 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 283 +++++++++++++++++++++
 6 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

