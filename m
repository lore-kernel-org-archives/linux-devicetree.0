Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8487AC2D0EC
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D4E220B1F
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ItYxyQOP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbgCZRAH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 13:00:07 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:50234 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgCZRAG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 13:00:06 -0400
Received: by mail-wm1-f52.google.com with SMTP id d198so7310810wmd.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IPcQG3YcrnLLher/nefYLUs5pU6e5WyIQ5KkZW8zJhU=;
        b=ItYxyQOPWpfIwx5id98fE1SRSt1cmLdSSkB5lgTxde8+2UMNwtZm5//pKOziYaxWnz
         5+2cxSZCfOm/Co62Re/eJIdbYw4UfCISJQ2pMi7V7cRGerae+khQtC1Bo3N9/hZHeZp/
         N1YngF5NBPAEdGTHZqox/NF2I/0dggkG4WZryMZfzh4I5ajCh2CCnnIu6z+/AobO9p/G
         44CoqqYhll10X9SV/1enmd+rZawXZj5Mdu3oqD6lHfInBkUUA2kSWF7CpX4lEamLaNsR
         8IX3ET6Q1k7H6h0n7Oajtskuu64CrCp4+N5DCG78KzSUb3AHa0uJ7xIE/ngHqzhsoaaG
         q//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IPcQG3YcrnLLher/nefYLUs5pU6e5WyIQ5KkZW8zJhU=;
        b=qxvc1EViylqKQbQy6lf5fInSreSZFvsXN3TPXoj8mR0Fbg1g8iJ2DKjDJQq5HIoZ7D
         YM2XhKwMUPoY82NH6GQx50eHveLX0wDRkhvvjeBD/x/arbGVJ7Qi9WsAnWPLK1xEBv+4
         LuU9V/aYptuS2E4+romsUexF6iZXnv2L1klbt3H/yBs6l+BSTdOYedhI0skBp2ALGykg
         CLYKq6IoxiAOD809WX0I5l2Q3XfnnMqLUpz9Uog2cbKMO0q7kzuX+eGTBViOhSZTucxX
         mXTe3AWJcvbqBJs0dB1Sb74InRhi2Hn796NsEySu+3pR8jzcRIhHWcPEU6OZ7tuMheW7
         Qp+A==
X-Gm-Message-State: ANhLgQ0H3gyogeiG5elNqLtdDXN5BXlv7kiZy0GA8IGxFUIYGnbD6e+W
        o3ZibeBK/s7665HjN9655rKAgQ==
X-Google-Smtp-Source: ADFU+vtnT6Qi76wMfnjs4e0l9MJUiPRD/pUzToCuVWV2nVYKoGqgcAcvwfcWiAoDJIJIOj62HUDmQw==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr819774wma.182.1585242003353;
        Thu, 26 Mar 2020 10:00:03 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:00:02 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] arm64: dts: meson: dtbs_checks fixups
Date:   Thu, 26 Mar 2020 17:59:53 +0100
Message-Id: <20200326165958.19274-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Another round of DT fixups of dtbs_checks on Amlogic DT files.

Neil Armstrong (5):
  dt-bindings: sram: Add Amlogic SCP SRAM compatibles
  arm64: dts: meson: fixup SCP sram nodes
  arm64: dts: meson-g12b-ugoos-am6: fix board compatible
  arm64: dts: meson-gxbb-kii-pro: fix board compatible
  arm64: dts: meson: fix leds subnodes name

 Documentation/devicetree/bindings/sram/sram.yaml       |  2 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi              | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts     |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi      |  2 +-
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts  |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts     |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi     |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts       |  2 +-
 16 files changed, 28 insertions(+), 26 deletions(-)

-- 
2.22.0

