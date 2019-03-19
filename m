Return-Path: <SRS0=L7Fd=RW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50338 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfCSRAP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Mar 2019 13:00:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id z11so9185540wmi.0
        for <devicetree@vger.kernel.org>; Tue, 19 Mar 2019 10:00:14 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/5] ARM: imx7s: add media nodes
Date: Tue, 19 Mar 2019 16:59:58 +0000
Message-Id: <20190319170003.21261-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

This series is a continuation of the
[PATCH v14 00/13] media: staging/imx7: add i.MX7 media driver [0] series.
All code patches and bindings are already merged, missing only this dts patches.

The main difference from the version in the previous series is as
commented by Laurent:
 - split of dtsi and dts in 2 patches
 - push endpoints to imx7s.dtsi

Cheers,
   Rui

[0] https://lore.kernel.org/linux-media/20190206151328.21629-1-rui.silva@linaro.org/
Rui Miguel Silva (5):
  ARM: dts: imx7s: add mipi phy power domain
  ARM: dts: imx7s: add multiplexer controls
  ARM: dts: imx7s: Add video mux, csi and mipi_csi
  ARM: dts: imx7s-warp: add csi and mipi_csi node
  ARM: dts: imx7s-warp: add ov2680 sensor node

 arch/arm/boot/dts/imx7s-warp.dts | 55 ++++++++++++++++++++
 arch/arm/boot/dts/imx7s.dtsi     | 87 +++++++++++++++++++++++++++++++-
 2 files changed, 140 insertions(+), 2 deletions(-)

-- 
2.21.0
