From: David Lechner <david@lechnology.com>
Subject: [PATCH 0/2] ARM: LEGO MINDSTORMS EV3 Bluetooth support
Date: Thu, 31 May 2018 15:25:47 -0500
Message-ID: <20180531202549.11255-1-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds Bluetooth support to LEGO MINDSTORMS EV3.

The pwm-clock depends on the common clock framework, so this requires the
recent davinci common clock series to switch to the common clock framework
before it will actually work.

David Lechner (2):
  ARM: dts: da850-lego-ev3: Add Bluetooth nodes
  ARM: davinci_all_defconfig: Enable Bluetooth

 arch/arm/boot/dts/da850-lego-ev3.dts   | 82 ++++++++++++++++++++++++++
 arch/arm/configs/davinci_all_defconfig |  9 +++
 2 files changed, 91 insertions(+)

-- 
2.17.0
