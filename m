Return-Path: <SRS0=okLl=H6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:19018 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750858AbeEKGLn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 11 May 2018 02:11:43 -0400
From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH 0/2] Add basic support for Mediatek MT8183 SoC
Date: Fri, 11 May 2018 14:11:21 +0800
Message-ID: <1526019083-20237-1-git-send-email-erin.lo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

MT8183 is a SoC based on 64bit ARMv8 architecture.
It contains 4 CA53 and 4 CA73 cores.
MT8183 share many HW IP with MT65xx series.
This patchset was tested on MT8183 evaluation board, and boot to shell ok.

This series contains document bindings, device tree including interrupt, uart.

Ben Ho (1):
  arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and
    Makefile

Erin Lo (1):
  dt-bindings: arm: Add bindings for Mediatek MT8183 SoC Platform

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 .../interrupt-controller/mediatek,sysirq.txt       |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  31 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 178 +++++++++++++++++++++
 6 files changed, 216 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183.dtsi

--
1.9.1

