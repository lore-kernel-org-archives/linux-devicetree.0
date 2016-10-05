From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/2] ARM64: meson-gxbb: Add support for the Nexbox A95X Board
Date: Wed,  5 Oct 2016 10:09:38 +0200
Message-ID: <1475654980-16414-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for the Amlogic S905 (GXBB) version of the Nexbox A95X, an IPTV
set-top-box with Ethernet, SDCard, eMMC, USB, HDMI, IR, Led, Reset button and Audio Jack.

Changes since v1 at: http://lkml.kernel.org/r/1471951370-29269-1-git-send-email-narmstrong@baylibre.com
 - Rebase on linux-next-20161004 with patchset [1]
 - Add nexbox vendor prefix

[1] http://lkml.kernel.org/r/1475595430-30075-1-git-send-email-narmstrong@baylibre.com

Neil Armstrong (2):
  devicetree: Add vendor prefix for Nexbox
  ARM: dts: meson-gxbb: Add support for the Nexbox A95X Board

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 108 +++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts

-- 
1.9.1
