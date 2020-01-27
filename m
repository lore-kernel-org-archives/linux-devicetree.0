Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893C7C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AC0820716
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbYUcND0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgA0OZH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:25:07 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34610 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbgA0OZG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:25:06 -0500
Received: by mail-pg1-f194.google.com with SMTP id r11so5244473pgf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xgGQ8U3A5kqg0C8/HdgwH0P9Ql14HnR66HG6y+CNuN8=;
        b=AbYUcND03t3MKu1VE1KLUJh1WdqEUUP/jq2b6vOAWi0OZiKqMJOtil1427yDhU+X1k
         t8Mos5yP3y8b+pMYSl8JCkjP2i6viSAuxCCC7pWwSX6GTj4fpjzmAtF93QhPZkdbJZQZ
         XX+Far7zf3a63NU7MP6l2w64FldhkrCskR6sU/pzRikY4vsdcx+ZQ3hkqIop6gpTBp8r
         hpVZl2IfqK5D3KA+Er8NqeKeEo/IYv2vJksl5S33RpATbkvK2X2DpoV4bIUwFAY69Q6R
         iyh2vbOr98qOws4QWQ6kkpD9+3Oguy8Cp/dl76h8YFfegw9kF2BjSzmNipGHIJc38muE
         6RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xgGQ8U3A5kqg0C8/HdgwH0P9Ql14HnR66HG6y+CNuN8=;
        b=Z8w+RaitVYbk+P/iZzfrGuCiuPIAo164KiuMq7Gapv3mYKm32w1696BlEHCTt1nkbz
         pKbpvdmaefD/cws7y8D+ulyparo5LqZjw0rcQ5FSjP4pIXxCGXU7MO2CyBjKI8Fj7l5W
         ZJ+ltzp6ZAhuL7qFi/I6VIMHeks2UrNN9D05hSZEdGBtbg8WbzQm0T7v/StPqHuv5CuF
         OpTyEzb66v5XcYlC4ZadUQFgQAWqUf+ur3SxZklyzomuDBkjIdniUQgHeqibXGloHw0O
         wWohyiGqw6BNiB4UqfUeTjZMPzliXqIH13lncUXlNjrAyFjcXgqaE6nHopDUpD4CqDJb
         q6yA==
X-Gm-Message-State: APjAAAWz4/vn4Ssn/+ZifTVCD9qGOjDv0rD7qZugEnWflgUIDxbTdK/Z
        vMBFXsn/IQU2OS3rarBE0K+ak7z69kT46A==
X-Google-Smtp-Source: APXvYqwUG2E5ZQLmyu1s55pWcNljK1w+OwcR8s0+RtG9/HECgiJtj+d7FGvnmCBC3OlB6GWQiV9ZTg==
X-Received: by 2002:a63:2842:: with SMTP id o63mr20203056pgo.317.1580135106370;
        Mon, 27 Jan 2020 06:25:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id u11sm15963603pjn.2.2020.01.27.06.25.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Jan 2020 06:25:05 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v4 0/3] Support for tft displays based on ilitek,ili9486
Date:   Mon, 27 Jan 2020 19:54:49 +0530
Message-Id: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
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

