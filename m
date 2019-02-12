From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: Add SEI Robotics SEI510 Board support
Date: Tue, 12 Feb 2019 15:02:57 +0100
Message-ID: <20190212140259.9537-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds minimal support for the SEI Robotics SEI510 Board,
which is based on the Amlogic G12A S905X2 :
and has the following features :
- Amlogic G12A S905X2 SoC
- 10/100 Ethernet
- USB2 + USB3 ports
- Micro SDCard Port
- Audio + CVBS AV Jack port
- HDMI 2.1 + CEC Port
- ADC Touch Button
- Far-Field Microphone Array + Mono HP
- IR Sensor
- IR Emmiter LED Array
- RGB Led

The first patch adds the Shenzhen SEI Robotics Co., Ltd vendor prefix.

Neil Armstrong (2):
  vendor-prefixes: Add prefix for Shenzhen SEI Robotics Co., Ltd
  arm64: dts: Add SEI Robotics SEI510 Board

 .../devicetree/bindings/arm/amlogic.txt       |  1 +
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 38 +++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts

-- 
2.20.1
