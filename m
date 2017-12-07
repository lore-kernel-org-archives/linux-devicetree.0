From: <sean.wang@mediatek.com>
Subject: [PATCH v2 0/3] Misc fixes up for MT7623 mmc
Date: Thu, 7 Dec 2017 14:43:21 +0800
Message-ID: <cover.1512628593.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Changes since v1:
- add tag from the feedback of v1
- enhance dt-binding documentation

Just add some fixes up for the current MT7623 support

Patch 1) complement the missing dt-bindings definitions
Patch 2) pick up the proper falling back as patch 1 defines.
Patch 3) SD-card detection issue caused by the wrong polarity is being fixed up

Sean Wang (3):
  mmc: dt-bindings: add mmc support to MT7623 SoC
  arm: dts: mt7623: update mmc related nodes with the appropriate
    fallback
  arm: dts: mt7623: fix card detection issue on bananapi-r2

 Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 arch/arm/boot/dts/mt7623.dtsi                    | 4 ++--
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts    | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.7.4
