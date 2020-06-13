Return-Path: <SRS0=mubR=72=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9CBC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 14:06:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCADB207BC
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 14:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjoAC/EV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgFMOGf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 13 Jun 2020 10:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgFMOGe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Jun 2020 10:06:34 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699BCC03E96F;
        Sat, 13 Jun 2020 07:06:34 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d6so5054593pjs.3;
        Sat, 13 Jun 2020 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IK5yC+mXW8ZLjiUHkz/X49N5nZRFi1/NuMVfIcCI63A=;
        b=TjoAC/EVMbd/UAY7eQ7kuBpthFa6tila5Hde+XHB+I/x3VOzAvXcTq6u3eKTHkOMIN
         kW5qoTuWbCXQ+Hjp0oLoF2FUk3+1nam88trCg5+nTwD9gIZraz4Dfml0Pvhv5bgiXCui
         Aj4GbTtYqL/YPTDHXRCe+Ga99jecwt97255/aJIuTh+1DiWCdy70EpcbaST4FCNLCdug
         Fb3c5P6ydgqDxIIBdX/BdL5wlLxeVbTlzrNuD+BzbXpVWbdrTik6XHcCoYzgFVNrpl0e
         aUVJFoeeR98VKjoaMdKIzamOO402EQ97kevzpcH4siCypYlIsps9Aro9mxjar+kHifjM
         57Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IK5yC+mXW8ZLjiUHkz/X49N5nZRFi1/NuMVfIcCI63A=;
        b=jc4rDyT0hLyJbsx35Rmp+296gbOQ845LIlEfxcvF/Lrl24CiTfoKs+jvtk06f2Gcfy
         UxyFJaBfFQFbY0NjV0XHNmSk/EP35xp5uFYchEy7Sabng7AIZIh2bfyG1QAvF1ATGpQ5
         v3XuYp2UTGOy8xgTiOQa49L/HmyPHdkDqbYOERA15JFLHfl32mZejV+hESFNik7+OF4X
         Urv+cJF2NId2HBnMDZfk2t9OR4URfR23dQ5edOYyHJjMEblfcAujDP6uAWghH1Ih+0oj
         CtNmJmoRPW96Gs0gN/tZ+56my6KCkV71ZJm1i0LcyN0F6//I2gRlqysJdrOM7FfKitrB
         60cA==
X-Gm-Message-State: AOAM533aFxFm2iTeIwKQ4nRhDxAuCtrTuCsv3AHKJvodjdiqYubVfHHx
        9ZzsrLs1ZljKC9eDiC3Ts+M=
X-Google-Smtp-Source: ABdhPJzBjlWK9yd8lsoYPLMQRIvyiHWL206wgm7uKsMFuX2GOiRHzI8v9oyzHB7wal49BSkNISSfCQ==
X-Received: by 2002:a17:902:b493:: with SMTP id y19mr15089701plr.186.1592057193745;
        Sat, 13 Jun 2020 07:06:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
        by smtp.gmail.com with ESMTPSA id i3sm7786929pjv.1.2020.06.13.07.06.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 07:06:33 -0700 (PDT)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Noralf Tronnes <noralf@tronnes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/3] Support for tft displays based on ilitek,ili9488
Date:   Sat, 13 Jun 2020 19:36:23 +0530
Message-Id: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The goal of this series is to get the displays based on ilitek,ili9488
working.
Eastrising,er-tft035-6 is a display based on ilitek,ili9488

Kamlesh Gurudasani (3):
  dt-bindings: add vendor prefix for EastRising Technology Co.,Ltd
  dt-bindings: add binding for Ilitek ili9488 based display panels
  drm/tiny: add support for tft displays based on ilitek,ili9488

 .../bindings/display/ilitek,ili9488.yaml           |  71 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  13 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9488.c                     | 446 +++++++++++++++++++++
 6 files changed, 540 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9488.c

-- 
2.7.4

