From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv3-next 0/3] Odroid c2 missing regulator linking
Date: Fri,  6 Sep 2019 12:20:41 +0000
Message-ID: <20190906122044.372-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Below small changes help re-configure or fix missing inter linking
of regulator node.

Re-based on linux-next-20190904
Changes from previous patch's series.
Build using Cross Compiler.

Added missing Reviewed-by Neil's and Martin.
Added few suggestion from martin for rename of node.

Dependencies:
Changes based top on my previous usb fix series patch's.

[0] https://patchwork.kernel.org/patch/11113095/
[1] https://patchwork.kernel.org/patch/11113099/
[3] https://patchwork.kernel.org/patch/11113103/

Hope this series get picked up for 5.4-rc1, finger crossed.

Changes for previous changes.
Fix some typo.
Updated few patches as per Martin's suggestion.

I will try to commit less mistake in the future.

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
    regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to
    VDDIO_AO3V3 regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
    supply

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

-- 
2.23.0
