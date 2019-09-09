From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/6] arm64: meson-gx: misc fixes and updates
Date: Mon,  9 Sep 2019 19:01:21 +0400
Message-ID: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset:

- Fixes bluetooth on Khadas VIM2
- Fixes bluetooth on Khadas VIM
- Fixes GPIO key dt on Khadas VIM
- Updates model for AML-S805X-CC
- Updates model/compatible for AML-S905X-CC

Christian Hewitt (6):
  arm64: dts: meson-gxl-s905x-khadas-vim: fix gpio-keys-polled node
  arm64: dts: meson-gxl-s905x-khadas-vim: fix uart_A bluetooth node
  arm64: dts: meson-gxm-khadas-vim2: fix uart_A bluetooth node
  arm64: dts: meson: libretech-ac: update model description
  dt-bindings: arm: amlogic: update libretech-cc compatible
  arm64: dts: meson: libretech-cc: update model and compatible

 Documentation/devicetree/bindings/arm/amlogic.yaml           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   | 7 ++++---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        | 3 +++
 5 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.7.4
