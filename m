Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA93EC4332E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 07:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C75E20722
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 07:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgCSHu6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 03:50:58 -0400
Received: from mx.socionext.com ([202.248.49.38]:23092 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgCSHu5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:57 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 19 Mar 2020 16:50:55 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 085AA60057;
        Thu, 19 Mar 2020 16:50:56 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 19 Mar 2020 16:50:55 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 6AE6F1A0E67;
        Thu, 19 Mar 2020 16:50:55 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 0/6] Add devicetree features and fixes for UniPhier SoCs
Date:   Thu, 19 Mar 2020 16:50:46 +0900
Message-Id: <1584604252-13172-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds new features that includes XDMAC for each SoC, and ethernet
aliases to inherit MAC address from u-boot and stabilization for ethernet on
PXs3.

Changes since v1:
- dt-bindings: Remove extension register description for xdmac
- Remove extension register area from xdmac node
- Fix commit message for ethernet aliases
- Remove RGMII setting for LD20 global board

These patches in v1 have already been applied:
  ARM: dts: uniphier: Add USB3 controller nodes for Pro5
  arm64: dts: uniphier: Enable spi node for PXs3 reference board
  arm64: dts: uniphier: Add nodes of thermal monitor and thermal zone
    for PXs3
  ARM: dts: uniphier: Set SCSSI clock and reset IDs for each channel
  arm64: dts: uniphier: Set SCSSI clock and reset IDs for each channel

Kunihiko Hayashi (6):
  dt-bindings: dma: uniphier-xdmac: Remove extension register region
    description
  ARM: dts: uniphier: Add XDMAC node
  arm64: dts: uniphier: Add XDMAC node
  ARM: dts: uniphier: Add ethernet aliases
  arm64: dts: uniphier: Add ethernet aliases
  arm64: dts: uniphier: Stabilize Ethernet RGMII mode of PXs3 ref board

 .../bindings/dma/socionext,uniphier-xdmac.yaml         |  3 +--
 arch/arm/boot/dts/uniphier-ld6b-ref.dts                |  1 +
 arch/arm/boot/dts/uniphier-pro4-ace.dts                |  1 +
 arch/arm/boot/dts/uniphier-pro4-ref.dts                |  1 +
 arch/arm/boot/dts/uniphier-pro4-sanji.dts              |  1 +
 arch/arm/boot/dts/uniphier-pro4.dtsi                   |  8 ++++++++
 arch/arm/boot/dts/uniphier-pro5.dtsi                   |  8 ++++++++
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts             |  1 +
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts              |  1 +
 arch/arm/boot/dts/uniphier-pxs2.dtsi                   |  8 ++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts |  1 +
 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts    |  1 +
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi       |  8 ++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts |  1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts    |  1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi       |  8 ++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi       |  8 ++++++++
 18 files changed, 77 insertions(+), 2 deletions(-)

-- 
2.7.4

