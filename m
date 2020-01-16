Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9874C33CB1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 05:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC4312077B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 05:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWcTRLur"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgAPFMS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 00:12:18 -0500
Received: from mail-pl1-f172.google.com ([209.85.214.172]:39857 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgAPFMS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 00:12:18 -0500
Received: by mail-pl1-f172.google.com with SMTP id g6so7823923plp.6
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 21:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRe0TrdVmcVtbIZZ2KLRX9N0GymyC3/nGwiGQDyGEys=;
        b=AWcTRLurLZrDTN4kPbgrNx+Gvro/+iF3bZo8jwglRFu5XImFzqd5qPmwHJKkGPO8Gs
         yQacvOm7gemgiFs96KE+wH1Kp9lu/Thc+CATc/U2QbO6vKnHkgj90iIgRQT/rdtD9Jou
         cq+KHPhTUF6UHJ8OJhmFP65f1xdRIHCv8LYwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRe0TrdVmcVtbIZZ2KLRX9N0GymyC3/nGwiGQDyGEys=;
        b=NSNX3fObcIC1GTWLtctcGXTiZ/S3rZ6rUIkIDsm5a5YPcZRXcs1OrEKrUJIo2pJKsK
         j2MDkEbEf4qlPeq4FC9oIXLsUPEnKodE9UTHHI1PSI8/C5Hl4Yq0MNAhDZPk4mqUyts/
         xyQEr7tqQwTfA3GVgvWt3OI4/XNZ8IzDnMgMeDW3WiMmnvE3k2ZbzBEfD7Z0WKY26Gqh
         D2qbmAzove8vZXihLbhePQEhhrI0jubS1L5qZAAR72J+FhkLRyU4XQRHi+1r3xGzWzl+
         C6ijMwQMK4uuunHPfcgxReFJ36dO3ootnQQ9UJPFJz+PPDLAjJiVlexV9i/hr24FD3dO
         lj6A==
X-Gm-Message-State: APjAAAXaeVoU83PykWz9SDbs0VzN74eb0aY/ZACj2KMl3adi6OiqK3ra
        TzFe6LkBvqcQUaUmw0tsbITCBQ==
X-Google-Smtp-Source: APXvYqxIfo2NO8XTOT3ctZvv2cDs0ozaWXCueeTQ9tAdo83/1BkyWq7joz0lSGjM0p0REFCHbibU8A==
X-Received: by 2002:a17:902:9a08:: with SMTP id v8mr30503834plp.134.1579151537384;
        Wed, 15 Jan 2020 21:12:17 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id l9sm21540217pgh.34.2020.01.15.21.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 21:12:16 -0800 (PST)
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
Subject: [PATCH v3 0/3] Add mt8173 elm and hana board
Date:   Thu, 16 Jan 2020 13:12:06 +0800
Message-Id: <20200116051209.37970-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.

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
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   60 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1028 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |    5 +-
 8 files changed, 1172 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.rc1.283.g88dfdc4193-goog

