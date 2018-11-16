From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] arm64: dts: meson: add Libretech aml-s805x-ac support
Date: Fri, 16 Nov 2018 10:39:36 +0100
Message-ID: <20181116093938.26373-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the libretech aml-s805x-ac, aka 'La Frite'

Changes since v1: [0]
 * Update gpio line names to align on Neil's recent series [1]
 * fix typo in comment

[0]: https://lkml.kernel.org/r/20181114101925.10526-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/1541587550-17842-1-git-send-email-narmstrong@baylibre.com

Jerome Brunet (1):
  dt-bindings: arm: amlogic: add libretech aml-s805x-ac bindings

Neil Armstrong (1):
  arm64: dts: meson: add libretech aml-s805x-ac board

 .../devicetree/bindings/arm/amlogic.txt       |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  | 248 ++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts

-- 
2.19.1
