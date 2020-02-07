Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0719C352A2
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 09:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3AC82082E
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 09:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V11ZRlSV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgBGJCq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 04:02:46 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:35634 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgBGJCp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Feb 2020 04:02:45 -0500
Received: by mail-pf1-f169.google.com with SMTP id y73so953860pfg.2
        for <devicetree@vger.kernel.org>; Fri, 07 Feb 2020 01:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=op1HXNhATyHRgyyhvfgTZxFzh1I8MPtGuBHJSPNyYOk=;
        b=V11ZRlSVoy8l/X+8crvCfDhWVEeNs7U6MYjmhE5PH3dH/QgD5ZXbfebDNDY+TVuxS2
         EF3b24coOyyCvvlqkO2mz17Pdt1JPDmLGRFZyjnK4KtDkGILDVe4ZEvAT+LAPlLhWDkf
         nB7KDKdqJTaxNX4qtPaYyp522JBRelU6OJr8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=op1HXNhATyHRgyyhvfgTZxFzh1I8MPtGuBHJSPNyYOk=;
        b=ojwaHhxCJgFsKw8KWJ0Nxe0LhWIB1H/wrCrCdFDQV3dSV1X3MeaZDMmQh84zeCRGDn
         gsAVmAD6ex/8t+S77466Szf4Rd3Q293rbxZRELsUvDxx232dwRfIjDEQr7nDG83dZTPH
         PhsyJ2b2ovUkyrUBYI48hQYhHhqGcFajkUmT4HZcIx4iETdBGRdhNdCHKR2bgPTjE4mx
         ydYeCLb3M6hoxo4s5VUKTaH3qk+V8kCDNjCJ+Vw2GFMIIurjSaoQBhLvawM0UEQPIEo1
         HsxxtrUMymiKfGMWSkgU7gQRJFW8MdXuxBIMi1WO2zyA+FAupG7fFXXBpL8ourD3EHd/
         2ucA==
X-Gm-Message-State: APjAAAX0uZiJ0rEWU88cUIjV/TLcQRvOuzGKgiVaX/EB5JEH+9s8KMS+
        NKTm+SQqJafyz+pkFEWR8a2g7g==
X-Google-Smtp-Source: APXvYqxN/ldFiwGp0nM9WRPRSNpu6gFYZl5ZXHD3UiPJnYNWxmaakrmXDFCuyvReK7SQz/hZZl3wKg==
X-Received: by 2002:a62:1a97:: with SMTP id a145mr9181514pfa.244.1581066165016;
        Fri, 07 Feb 2020 01:02:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id w6sm2309463pfq.99.2020.02.07.01.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 01:02:44 -0800 (PST)
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
Subject: [PATCH v6 0/5] Add mt8173 elm and hana board
Date:   Fri,  7 Feb 2020 17:02:23 +0800
Message-Id: <20200207090227.250720-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.

Changes in v6:
- fix several unit name warnings in mt8173.dtsi and mt8173-elm.dtsi

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


Hsin-Yi Wang (5):
  dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
  arm64: dts: mt8173: add uart aliases
  arm64: dts: mt8173: fix unit name warnings
  arm64: dts: mediatek: add mt8173 elm and hana board
  media: mtk-mdp: Use correct aliases name

 .../devicetree/bindings/arm/mediatek.yaml     |   22 +
 arch/arm64/boot/dts/mediatek/Makefile         |    3 +
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
 .../boot/dts/mediatek/mt8173-elm-hana.dts     |   14 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   70 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1166 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   43 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |    8 +-
 9 files changed, 1343 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.225.g125e21ebc7-goog

