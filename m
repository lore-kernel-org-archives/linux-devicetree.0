Return-Path: <SRS0=ahG+=35=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D9DC2BA83
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Feb 2020 18:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC10920715
	for <linux-devicetree@archiver.kernel.org>; Sun,  9 Feb 2020 18:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxNiYfyC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbgBISGQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 9 Feb 2020 13:06:16 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40792 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgBISGQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 9 Feb 2020 13:06:16 -0500
Received: by mail-pj1-f65.google.com with SMTP id 12so3166872pjb.5
        for <devicetree@vger.kernel.org>; Sun, 09 Feb 2020 10:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZU7g5zVIZ/P4SZ4dpB9xCWuJqO9E3k6FwzCkFJmuod4=;
        b=KxNiYfyCeByE340pvGYq+bgAhR+C842a+qVxzDVr2D6sqwJlyGXEE/ADYo/mXm0ElU
         h1covFXBZ4gGsBT0EP0EqPMxYq/6yS0QhqfPcGGEyBdJwpHLwakj7KySm3XmKjURdQpj
         jdeQMUY8zkvkClpZVpIE7UGh4VG4wqvrae/s3nVI01ULwe1mEVmoWzLCYjSe9PtQZ4C7
         iySj/0Ikkkln9qjTKH2qCaKRdUcAXjdcwwQHA4JNXe5zI6+DHEs8UHiBCvxztoz0KEGk
         eRa3dPXtT5rY8rdcrP1GhOmyJveTkW2J8H924S1Df1QnNhAy2cD1BDtWEwK9fPI8r5Ez
         YAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZU7g5zVIZ/P4SZ4dpB9xCWuJqO9E3k6FwzCkFJmuod4=;
        b=uli4Y1hEE2l8wfLzUC8FX6Al5BwlcoIav6mzfEFR3fmupoS/i9F2RA1T+KXWZRvvGO
         SpRXJdF29UIEZa0SSqowq6Flrut4kcZMfTUKNoTmJ0iLxkV/kvNOyXEYI/MD+/UUqK8h
         fvDUmZmKTHMjqefDUgTILZuYfu0pbrTSK5F9vdCzEo0Own6/KKt/3f8cvhBfLk22weef
         Z3MAevhLN3lJl7KYa4pMbTINVtWy1BI7oRdb1xUQaNQ/zBWLxU7TeIL2OtYThA0OdPEl
         YHSGdEAFV1XAxbxQCCcFAlXJ+rOPSNjsO8UiULTNJscLxoXxJHsfhS03LgC/yFGUFuhP
         X/cw==
X-Gm-Message-State: APjAAAW/oUkQSf3nr2bQvWLKEwg3oz/gQijRRgpk8ZW6EazC2QwXRRPR
        X7MOxjc5UMIyURaFqXVk3+k=
X-Google-Smtp-Source: APXvYqwVT34GcKgjHB08DF7tIEkPSLpAjSQYumkzzaNjl0k5tuQ334rGLBr6ofrk8f8FDzLoNDTHtw==
X-Received: by 2002:a17:90a:e28e:: with SMTP id d14mr16925514pjz.56.1581271574176;
        Sun, 09 Feb 2020 10:06:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:508e:1313:1d5a:1ea5])
        by smtp.gmail.com with ESMTPSA id 23sm9454481pfh.28.2020.02.09.10.06.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 09 Feb 2020 10:06:13 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Noralf Tronnes <noralf@tronnes.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v5 0/2] Support for tft displays based on ilitek,ili9486
Date:   Sun,  9 Feb 2020 23:35:57 +0530
Message-Id: <cover.1581270802.git.kamlesh.gurudasani@gmail.com>
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
* added vendor prefix patch to this series instead of separate patch

v4 changes:
* removing checkpatch warnings

v5 changes:
* made compatible part in dt-bindings less complex (Sam)
* added Rb and Ab tags
* dropped vendor prefix patch as it has been applied (v4)
* replaced tinydrm with tiny in drm/tiny patch subject

Kamlesh Gurudasani (2):
  dt-bindings: add binding for tft displays based on ilitek,ili9486
  drm/tiny: add support for tft displays based on ilitek,ili9486

 .../bindings/display/ilitek,ili9486.yaml           |  73 ++++++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/tiny/Kconfig                       |  14 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/ili9486.c                     | 283 +++++++++++++++++++++
 5 files changed, 378 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

-- 
2.7.4

