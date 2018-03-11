Return-Path: <SRS0=8Y+Q=GB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41548 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932210AbeCKU1D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 11 Mar 2018 16:27:03 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT 0/3] thermal: add support for r8a77995
Date: Mon, 12 Mar 2018 05:26:32 +0900
Message-Id: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds thermal support for r8a77995.
R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
Therefore this series adds r8a77995 support to rcar_thermal driver not
rcar_gen3_thermal driver.

This series is based on the next branch of Zhang Rui's linux tree.

Yoshihiro Kaneko (3):
  thermal: rcar_thermal: add r8a77995 support
  dt-bindings: thermal: rcar-thermal: add R8A77995 support
  arm64: dts: renesas: r8a77995: add thermal device support

 .../devicetree/bindings/thermal/rcar-thermal.txt   |   1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  31 +++++
 drivers/thermal/rcar_thermal.c                     | 141 ++++++++++++++++-----
 3 files changed, 144 insertions(+), 29 deletions(-)

-- 
1.9.1

