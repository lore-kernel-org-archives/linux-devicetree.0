Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F408CC33CAC
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 10:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C63CD20658
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 10:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gng9XmRj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727510AbgBCKyb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 05:54:31 -0500
Received: from mail-pg1-f169.google.com ([209.85.215.169]:43689 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgBCKyb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 05:54:31 -0500
Received: by mail-pg1-f169.google.com with SMTP id u131so7601888pgc.10
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 02:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADW24ulzjRxWFs8Inpi2MLUJLlYv0kpD0PDD8jb7dpI=;
        b=gng9XmRj2Jusgtv+OYAhFWAfvviQ4ANaqX3dAANJ1k+PZMrE4ERLooYqWXjiNk3lNK
         nH5zqTbV/Q52LMsnKyq/zfmgTAe0RB9n1NxSy2kAeAvwI7psST63mCuiC4vDRhHjQpz/
         9q/rXFgPt7i+vBrEhnU9H7PTU0M039FzoSKC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADW24ulzjRxWFs8Inpi2MLUJLlYv0kpD0PDD8jb7dpI=;
        b=m9CoX+t+bdDbnY8HQB17jwFA0tvF2BDvcx6Dlbl9Bw1UWKogwJ1jq2JNDQlTNWvjwo
         qYLo6F0xb4CqgH5ftpzP+PDOkj+htcX4mYvzBHYD2sPvK1jNiKeS1DPnsPNC6+mAndws
         JQOJvRfFngH2Hce4acr/0mpNmAneVOSb5+QQwjIgNd4Cz2+Hv7wFs8jgSi+fUUBesly4
         hbpTMIBRoSrB9O0LEFxLcmHmyj3PC3qGMnenK4QkWneNA/7W0pQgRMHt4Z5oLNsVWl3t
         TsYh1fEDmALd1EisARj0ldfRPxAk/oW7qWD/NaHm+CJxJVm/L02aivb+ncJDT2aEKD1Z
         tyvw==
X-Gm-Message-State: APjAAAU++OF2Qbt2HJhdXV+YdOC2/ZrmYy7rNp+MB311qq0QOJMOKRAX
        442IG2kwArXpIGxhiOsPc3IaTg==
X-Google-Smtp-Source: APXvYqwmogyQ4tkjuKnABxnJkcUDNUWk6sjSeWh+MezxRj8XAoT7P+8oP0g/yi1wYM4Yic/x6imZaQ==
X-Received: by 2002:aa7:9796:: with SMTP id o22mr23897517pfp.101.1580727270135;
        Mon, 03 Feb 2020 02:54:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id 11sm20923835pfz.25.2020.02.03.02.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 02:54:29 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH v5 0/3] Add mt8173 elm and hana board
Date:   Mon,  3 Feb 2020 18:53:45 +0800
Message-Id: <20200203105345.118294-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.

Changes in v5:
- add gpio-line-names for gpio controller

Changes in v4:
- fix dtbs_check errors on cros-ec-keyboard
- add comments for second source touchscreen and trackpad

Changes in v3:
- address comments in v2, major changes include:
  * move uart aliases from mt8173-elm.dtsi to mt8173.dtsi
  * remove brightness-levels in backlight
  * add interrupt for da9211
  * move pinmux for sdio_fixed_3v3 from mmc3_pins_default
  * remove some non upstream property
  * checked on schematic, cd-gpio in mmc1 should be GPIO_ACTIVE_LOW

Changes in v2:
- fix mediatek.yaml
- fixup some nodes and remove unused nodes in dts


Hsin-Yi Wang (3):
  dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
  arm64: dts: mt8173: add uart aliases
  arm64: dts: mediatek: add mt8173 elm and hana board

 .../devicetree/bindings/arm/mediatek.yaml     |   22 +
 arch/arm64/boot/dts/mediatek/Makefile         |    3 +
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
 .../boot/dts/mediatek/mt8173-elm-hana.dts     |   14 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   70 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1169 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |    5 +-
 8 files changed, 1323 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.341.g760bfbb309-goog

