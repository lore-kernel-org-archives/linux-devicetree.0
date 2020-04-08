Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8A2C2D0F4
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC00D2075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYaTzx++"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbgDHTve (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:34 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34700 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgDHTve (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:34 -0400
Received: by mail-lf1-f68.google.com with SMTP id x23so6120470lfq.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2PgRZe5K3hgz/0aN2c1spKhXvZT+RoAd8uSZ0YtrmTw=;
        b=ZYaTzx++qIs/LJZVu17e6p3xXI0uZ3jGHY+OBpFRwvjgstZiGoKOog8Vm3wAIOU9Km
         sv1MNhmhyH2g7CAkSkxIZc3RDp5v/Sa5EO5bzyl8BPEYVXTk9i4prVRWJ48C7T/4ZqBL
         +Gw2UFMjio5KHrvnu29HCotFXziKq8TH4wwMKrc0DgXqGIYveuW6G4K8bH/BnuXHW6M9
         ePiocOttgFKJL1Yppm/9tkodvuDJKYq3CWcO/2iqXkXXMDXgjtQ3QV3XgCgtbtkxXnWC
         nGySA0VaOCpVMCDordnH988wi4l7DZGiZUPEeIcjFBKX8V184/O5SBAPA+uouxP07L1+
         05cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=2PgRZe5K3hgz/0aN2c1spKhXvZT+RoAd8uSZ0YtrmTw=;
        b=GO5HQcrbw6BiJD9pT5EtK6rAA+meiCK8NOGqH9Ush9ZERolOIa4CBCtIhgJXPL6SZF
         DWggg4YHz/NCtsb4X9H3IlC3jl4X4Uv8qHhfAQE0CWmX08TzoSB3xNAViiwawGga1vz6
         EPjaunjKLe5potq6vhKsf8bUkyHTesTIfCRL3jL9/otjQOZZBAx39W3xmCbHoJ7AqEYm
         HTtBaYh4+p63NqXmVGIVImqIsg13QZ9/HRCapgTTkPvQPw7nss4uEaoxnlnqM+IAa1Ue
         Osx7n1vjQy0fTq+F0Zwo1qqLRgQPQXXwc66CDEaQr62XnOlj1ZqYvNueMRZH5Bo7l7Iw
         4SMQ==
X-Gm-Message-State: AGi0PuaLM9vb2G2IzXwUo3CBYw9cXsN0NIs1TejWD1EuFOoLSAebrvvg
        juYCwHWFxhkjXN2DLVDsUdM=
X-Google-Smtp-Source: APiQypIGmDNboC6YC15eD7ycLUQBrs1CcPf0AXqXZBDkMRsKylev2NE+G+B7gF/eN02dUy0Tk8uWWw==
X-Received: by 2002:ac2:4554:: with SMTP id j20mr5605297lfm.91.1586375491291;
        Wed, 08 Apr 2020 12:51:31 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:30 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Heiko Schocher <hs@denx.de>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lin Huang <hl@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marco Franchi <marco.franchi@nxp.com>,
        Marek Belisko <marek@goldelico.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Rosin <peda@axentia.se>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Robert Chiras <robert.chiras@nxp.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Werner Johansson <werner.johansson@sonymobile.com>
Subject: [PATCH v2 0/36] dt-bindings: display: convert remaning panel bindings to DT Schema
Date:   Wed,  8 Apr 2020 21:50:33 +0200
Message-Id: <20200408195109.32692-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Convert remaining(*) panel bindings to DT Schema.

To prepare for the migration a preparation
patch was required:

- te-gpios is now added to panel-common - as this
  property is used by a few bindings.

The original author of the panel bindings are listed as maintainer
in the DT Schema. In the few cases the panel binding was also
listed in MAINTAINERS I checked that there was a match.
It was done manually so I may have missed someone.

All bindings pass dt_binding_check with no warnings.

Changes in v2 - see individual commits for more details:

- Dropped spi-slave.yaml. This was a gross misunderstandign from my side
- Introduced unevaluatedProperties for all SPI slaves
- Updated MAINTAINERS when relevant - in the individual patches
- Dropped a few bindings as they was converted by others
- Updates examples, mostly based on feedback from Rob
- Moved DSI panels to panel-simple-dsi, and fixed a patch
  that did this wrong too
- Added a lot of r-b, a-b - thanks!

I have tried to fix so cover letter is sent to all, but individual patches
are only sent to a few selected + people listed in Cc:
Then it is easier for the receiver (you) to see where feedback is expected.
So if I succeeded and you received only a few bindings as follow-up,
please provide ack or other feedback.

Patches made on top of drm-misc-next as of today with no other patches.

(*) Two .txt files reamins:
- display-timing.txt, points to display-timings.yaml
- panel-dsi-cm.txt, conversion is included in another patch-set

        Sam

Cc: Alexandre Courbot <acourbot@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: "Guido Günther" <agx@sigxcpu.org>
Cc: Heiko Schocher <hs@denx.de>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: Jonathan Bakker <xc-racer2@live.ca>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Lin Huang <hl@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Marek Belisko <marek@goldelico.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Peter Rosin <peda@axentia.se>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Purism Kernel Team <kernel@puri.sm>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandeep Panda <spanda@codeaurora.org>
Cc: Stefan Mavrodiev <stefan@olimex.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Werner Johansson <werner.johansson@sonymobile.com>


Sam Ravnborg (36):
      dt-bindings: display: allow port and ports in panel-lvds
      dt-bindings: display: look for dsi* nodes in dsi-controller
      dt-bindings: display: add te-gpios to panel-common
      dt-bindings: display: convert samsung,s6e63m0 to DT Schema
      dt-bindings: display: convert arm,versatile-tft-panel to DT Schema
      dt-bindings: display: convert boe,himax8279d to DT Schema
      dt-bindings: display: convert ilitek,ili9322 to DT Schema
      dt-bindings: display: convert ilitek,ili9881c to DT Schema
      dt-bindings: display: convert innolux,p079zca to DT Schema
      dt-bindings: display: convert innolux,p097pfg to DT Schema
      dt-bindings: display: convert innolux,p120zdg-bf1 to DT Schema
      dt-bindings: display: convert jdi,lt070me05000 to DT Schema
      dt-bindings: display: convert kingdisplay,kd035g6-54nt to DT Schema
      dt-bindings: display: convert kingdisplay,kd097d04 to DT Schema
      dt-bindings: display: convert simple lg panels to DT Schema
      dt-bindings: display: convert lg,lg4573 to DT Schema
      dt-bindings: display: convert osddisplays,osd101t2587-53ts to DT Schema
      dt-bindings: display: convert raydium,rm67191 to DT Schema
      dt-bindings: display: convert rocktech,jh057n00900 to DT Schema
      dt-bindings: display: convert samsung AMOLED to DT Schema
      dt-bindings: display: convert samsung,s6d16d0 to DT Schema
      dt-bindings: display: convert samsung,ld9040 to DT Schema
      dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
      dt-bindings: display: convert toppoly panels to DT Schema
      dt-bindings: display: convert startek,startek-kd050c to DT Schema
      dt-bindings: display: convert sony,acx565akm to DT Schema
      dt-bindings: display: convert sitronix,st7789v to DT Schema
      dt-bindings: display: drop unused simple-panel.txt
      dt-bindings: display: convert sharp,ls043t1le01 to DT Schema
      dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
      dt-bindings: display: convert sharp,ls037v7dw01 to DT Schema
      dt-bindings: display: convert sharp,lq150x1lg11 to DT Schema
      dt-bindings: display: convert seiko,43wvf1g to DT Schema
      dt-bindings: display: convert lgphilips,lb035q02 to DT Schema
      dt-bindings: display: convert olimex,lcd-olinuxino to DT Schema
      dt-bindings: display: move DSI panels to panel-simple-dsi

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml      |   2 +-
 .../bindings/display/dsi-controller.yaml           |   4 +-
 .../display/panel/arm,versatile-tft-panel.txt      |  31 ------
 .../display/panel/arm,versatile-tft-panel.yaml     |  51 ++++++++++
 .../bindings/display/panel/boe,himax8279d.txt      |  24 -----
 .../bindings/display/panel/boe,himax8279d.yaml     |  59 ++++++++++++
 .../bindings/display/panel/ilitek,ili9322.txt      |  49 ----------
 .../bindings/display/panel/ilitek,ili9322.yaml     |  71 ++++++++++++++
 .../bindings/display/panel/ilitek,ili9881c.txt     |  20 ----
 .../bindings/display/panel/ilitek,ili9881c.yaml    |  50 ++++++++++
 .../bindings/display/panel/innolux,p079zca.txt     |  22 -----
 .../bindings/display/panel/innolux,p097pfg.txt     |  24 -----
 .../bindings/display/panel/innolux,p097pfg.yaml    |  56 +++++++++++
 .../bindings/display/panel/innolux,p120zdg-bf1.txt |  22 -----
 .../display/panel/innolux,p120zdg-bf1.yaml         |  43 +++++++++
 .../bindings/display/panel/jdi,lt070me05000.txt    |  31 ------
 .../bindings/display/panel/jdi,lt070me05000.yaml   |  69 +++++++++++++
 .../display/panel/kingdisplay,kd035g6-54nt.txt     |  42 --------
 .../display/panel/kingdisplay,kd035g6-54nt.yaml    |  65 +++++++++++++
 .../display/panel/kingdisplay,kd097d04.txt         |  22 -----
 .../bindings/display/panel/lg,acx467akm-7.txt      |   7 --
 .../bindings/display/panel/lg,ld070wx3-sl01.txt    |   7 --
 .../bindings/display/panel/lg,lg4573.txt           |  19 ----
 .../bindings/display/panel/lg,lg4573.yaml          |  45 +++++++++
 .../bindings/display/panel/lg,lh500wx1-sd03.txt    |   7 --
 .../bindings/display/panel/lgphilips,lb035q02.txt  |  33 -------
 .../bindings/display/panel/lgphilips,lb035q02.yaml |  59 ++++++++++++
 .../devicetree/bindings/display/panel/lvds.yaml    |   8 +-
 .../display/panel/olimex,lcd-olinuxino.txt         |  42 --------
 .../display/panel/olimex,lcd-olinuxino.yaml        |  70 ++++++++++++++
 .../display/panel/osddisplays,osd101t2587-53ts.txt |  14 ---
 .../bindings/display/panel/panel-common.yaml       |   7 ++
 .../bindings/display/panel/panel-simple-dsi.yaml   |  12 +++
 .../bindings/display/panel/panel-simple.yaml       |   8 +-
 .../bindings/display/panel/raydium,rm67191.txt     |  41 --------
 .../bindings/display/panel/raydium,rm67191.yaml    |  75 +++++++++++++++
 .../display/panel/rocktech,jh057n00900.txt         |  23 -----
 .../display/panel/rocktech,jh057n00900.yaml        |  57 +++++++++++
 .../display/panel/samsung,amoled-mipi-dsi.yaml     |  65 +++++++++++++
 .../bindings/display/panel/samsung,ld9040.txt      |  66 -------------
 .../bindings/display/panel/samsung,ld9040.yaml     | 107 +++++++++++++++++++++
 .../bindings/display/panel/samsung,s6d16d0.txt     |  30 ------
 .../bindings/display/panel/samsung,s6d16d0.yaml    |  56 +++++++++++
 .../bindings/display/panel/samsung,s6e3ha2.txt     |  31 ------
 .../bindings/display/panel/samsung,s6e63j0x03.txt  |  24 -----
 .../bindings/display/panel/samsung,s6e63m0.txt     |  33 -------
 .../bindings/display/panel/samsung,s6e63m0.yaml    |  60 ++++++++++++
 .../bindings/display/panel/samsung,s6e8aa0.txt     |  56 -----------
 .../bindings/display/panel/samsung,s6e8aa0.yaml    |  96 ++++++++++++++++++
 .../bindings/display/panel/seiko,43wvf1g.txt       |  23 -----
 .../bindings/display/panel/seiko,43wvf1g.yaml      |  49 ++++++++++
 .../bindings/display/panel/sharp,lq101r1sx01.txt   |  49 ----------
 .../bindings/display/panel/sharp,lq101r1sx01.yaml  |  85 ++++++++++++++++
 .../bindings/display/panel/sharp,lq150x1lg11.txt   |  36 -------
 .../bindings/display/panel/sharp,lq150x1lg11.yaml  |  58 +++++++++++
 .../bindings/display/panel/sharp,ls037v7dw01.txt   |  43 ---------
 .../bindings/display/panel/sharp,ls037v7dw01.yaml  |  68 +++++++++++++
 .../bindings/display/panel/sharp,ls043t1le01.txt   |  22 -----
 .../bindings/display/panel/sharp,ls043t1le01.yaml  |  51 ++++++++++
 .../bindings/display/panel/simple-panel.txt        |   1 -
 .../bindings/display/panel/sitronix,st7789v.txt    |  37 -------
 .../bindings/display/panel/sitronix,st7789v.yaml   |  63 ++++++++++++
 .../bindings/display/panel/sony,acx565akm.txt      |  30 ------
 .../bindings/display/panel/sony,acx565akm.yaml     |  57 +++++++++++
 .../display/panel/startek,startek-kd050c.txt       |   4 -
 .../display/panel/startek,startek-kd050c.yaml      |  33 +++++++
 .../devicetree/bindings/display/panel/tpo,td.yaml  |  65 +++++++++++++
 .../bindings/display/panel/tpo,td028ttec1.txt      |  32 ------
 .../bindings/display/panel/tpo,td043mtea1.txt      |  33 -------
 MAINTAINERS                                        |  10 +-
 70 files changed, 1721 insertions(+), 1043 deletions(-)


