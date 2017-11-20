From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v2 0/2] dt: add pinctrl driver for Meson-AXG SoC
Date: Mon, 20 Nov 2017 18:08:49 +0800
Message-ID: <20171120100851.17366-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is DT part patchset for adding pinctrl support for
the Amlogic's Meson-AXG SoC.
  
Changes since v1 at [1]:
  -- Separate DT part patches
  -- Add Neil Armstrong's Ack

[1] 
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005270.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005271.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005272.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005273.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005274.html

Xingyu Chen (2):
  documentation: Add compatibles for Amlogic Meson AXG pin controllers
  ARM64: dts: meson-axg: add pinctrl DT info for Meson-AXG SoC

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  2 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         | 44 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.15.0
