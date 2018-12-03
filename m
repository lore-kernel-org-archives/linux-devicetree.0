From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 0/5] media/sun6i: Allwinner A64 CSI support
Date: Mon,  3 Dec 2018 15:37:42 +0530
Message-ID: <20181203100747.16442-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

This series support CSI on Allwinner A64.

The CSI controller seems similar to that of in H3, so fallback
compatible is used to load the driver.

Unlike other SoC's A64 has set of GPIO Pin gropus SDA, SCK intead
of dedicated I2C controller, so this series used i2c-gpio bitbanging.

Right now the camera is able to detect, but capture images shows 
sequence of red, blue line. any suggestion please help.

Any inputs,
Jagan.

Jagan Teki (5):
  dt-bindings: media: sun6i: Add A64 CSI compatible (w/ H3 fallback)
  dt-bindings: media: sun6i: Add vcc-csi supply property
  media: sun6i: Add vcc-csi supply regulator
  arm64: dts: allwinner: a64: Add A64 CSI controller
  arm64: dts: allwinner: a64-amarula-relic: Add OV5640 camera node

 .../devicetree/bindings/media/sun6i-csi.txt   |  4 ++
 .../allwinner/sun50i-a64-amarula-relic.dts    | 54 +++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 26 +++++++++
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 15 ++++++
 4 files changed, 99 insertions(+)

-- 
2.18.0.321.gffc6fa0e3
