From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: libretech-cc: emmc update
Date: Thu, 20 Dec 2018 17:10:35 +0100
Message-ID: <20181220161037.23756-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset provides a couple of update for the eMMC on the libretech-cc
It should remove some error message for those who don't have an eMMC
module and improve the performance for those who do have one.

Jerome Brunet (2):
  arm64: dts: meson: libretech-cc: set eMMC as removable
  arm64: dts: meson: libretech-cc: switch eMMC to 1.8v

 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.19.2
