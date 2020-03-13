Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD0C10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 00:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29B2820716
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 00:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgCMA6e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 20:58:34 -0400
Received: from mx.socionext.com ([202.248.49.38]:4518 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgCMA6e (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 20:58:34 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Mar 2020 09:58:32 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 011E3603AB;
        Fri, 13 Mar 2020 09:58:33 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 13 Mar 2020 09:58:32 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id CB11F1A01BB;
        Fri, 13 Mar 2020 09:58:32 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 00/10] Add devicetree features and fixes for UniPhier SoCs
Date:   Fri, 13 Mar 2020 09:58:06 +0900
Message-Id: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds new features that includes XDMAC for each SoC,
USB controller for Pro5, SPI for PXs3-ref, and thermal zone for PXs3.

And more, this adds ethernet aliases to determine device name assignments
and fixes for SCSSI clock/reset IDs and stabilization for ethernet.

Kunihiko Hayashi (10):
  ARM: dts: uniphier: Add XDMAC node
  arm64: dts: uniphier: Add XDMAC node
  ARM: dts: uniphier: Add USB3 controller nodes for Pro5
  arm64: dts: uniphier: Enable spi node for PXs3 reference board
  arm64: dts: uniphier: Add nodes of thermal monitor and thermal zone
    for PXs3
  ARM: dts: uniphier: Add ethernet aliases
  arm64: dts: uniphier: Add ethernet aliases
  ARM: dts: uniphier: Set SCSSI clock and reset IDs for each channel
  arm64: dts: uniphier: Set SCSSI clock and reset IDs for each channel
  arm64: dts: uniphier: Stabilize Ethernet RGMII mode of LD20 global and
    PXs3 ref board

 arch/arm/boot/dts/uniphier-ld6b-ref.dts            |   1 +
 arch/arm/boot/dts/uniphier-pro4-ace.dts            |   1 +
 arch/arm/boot/dts/uniphier-pro4-ref.dts            |   1 +
 arch/arm/boot/dts/uniphier-pro4-sanji.dts          |   1 +
 arch/arm/boot/dts/uniphier-pro4.dtsi               |   8 ++
 arch/arm/boot/dts/uniphier-pro5.dtsi               | 160 ++++++++++++++++++++-
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts         |   1 +
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts          |   1 +
 arch/arm/boot/dts/uniphier-pxs2.dtsi               |  12 +-
 .../boot/dts/socionext/uniphier-ld11-global.dts    |   1 +
 .../arm64/boot/dts/socionext/uniphier-ld11-ref.dts |   1 +
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi   |  12 +-
 .../boot/dts/socionext/uniphier-ld20-global.dts    |  14 ++
 .../arm64/boot/dts/socionext/uniphier-ld20-ref.dts |   1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |  20 ++-
 .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts |  28 ++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   |  55 ++++++-
 17 files changed, 304 insertions(+), 14 deletions(-)

-- 
2.7.4

