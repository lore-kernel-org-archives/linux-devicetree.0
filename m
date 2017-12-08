From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v4 0/2] dt: add pinctrl driver for Meson-AXG SoC
Date: Fri, 8 Dec 2017 09:54:16 +0800
Message-ID: <20171208015418.9632-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is DT part patchset for adding pinctrl support for
the Amlogic's Meson-AXG SoC.
  
Changes since v3 at [3]
  -- rebase to khilman's v4.16/dt64 branch and re-send
  -- add Rob's Ack

Changes since v2 at [2]:
  -- Resend this patch series due to fail to send patch [2/2]

Changes since v1 at [1]:
  -- Separate DT part patches
  -- Add Neil Armstrong's Ack

[3]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005392.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005393.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005394.html

[2]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005390.html

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
2.15.1

