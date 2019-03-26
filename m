Return-Path: <SRS0=1wp7=R5=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 0/5] ARM: imx7s: add media nodes
Date: Tue, 26 Mar 2019 11:02:22 +0000
Message-Id: <20190326110227.7324-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

This series is a continuation of the
[PATCH v14 00/13] media: staging/imx7: add i.MX7 media driver [0] series.
All code patches and bindings are already merged, missing only this
dts patches.

The main difference from the version in the previous series is as
commented by Laurent:
 - split of dtsi and dts in 2 patches
 - push endpoints to imx7s.dtsi

Cheers,
   Rui

v1->v2:
Shawn Guo:
  - sort alphabetically
  - hyphen for node name
  - indent align clocks
  - send status to end of property list

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
