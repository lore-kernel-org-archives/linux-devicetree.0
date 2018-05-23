Return-Path: <SRS0=JzrA=IK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:55041 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932180AbeEWJ40 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 May 2018 05:56:26 -0400
From: Esben Haabendal <esben.haabendal@gmail.com>
Subject: [PATCH 0/4] i2c: imx: Fix and enable DMA support for LS1021A
Date: Wed, 23 May 2018 11:56:19 +0200
Message-Id: <20180523095623.3347-1-esben.haabendal@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc: Esben Haabendal <eha@deif.com>
List-ID: <devicetree@vger.kernel.org>

From: Esben Haabendal <eha@deif.com>

This patch series fixes two race conditions and minor issues with tracking
the stopped state when something goes wrong.

With that in place, DMA support works with NXP LS1021A, so it is enabled in
the last patch.

Esben Haabendal (4):
  i2c: imx: Fix reinit_completion() use
  i2c: imx: Fix race condition in dma read
  i2c: imx: Simplify stopped state tracking
  arm: dts: ls1021a: Enable I2C DMA support

 arch/arm/boot/dts/ls1021a.dtsi |  6 ++++++
 drivers/i2c/busses/i2c-imx.c   | 23 ++++++++++++-----------
 2 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.17.0

