From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv1 0/3] Odroid c2 missing regulator linking
Date: Wed, 28 Aug 2019 20:27:20 +0000
Message-ID: <20190828202723.1145-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Below small changes help re-configure or fix missing inter linking
of regulator node.

Changes based top on my prevoius series.

[0] https://patchwork.kernel.org/cover/11113091/

TOOD: Add support for DVFS GXBB odroid board in next series.

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
    regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to
    VDDIO_AO3V3 regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
    supply

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 44 ++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

-- 
2.23.0
