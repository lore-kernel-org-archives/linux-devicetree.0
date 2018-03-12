From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v2 0/5] update Mediatek MT2712 clock and scpsys support
Date: Mon, 12 Mar 2018 15:03:37 +0800
Message-ID: <20180312070342.4335-2-weiyi.lu@mediatek.com>
References: <20180312070342.4335-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312070342.4335-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This series is based on v4.16-rc1 and composed of scpsys control (PATCH 1-2) and clock control (PATCH 3-5).
Basically, all changes are for the ECO design change of MT2712.

changes since v1:
- Avoid renumbering clocks. Append new clocks at the bottom of each own subsystem.

Weiyi Lu (5):
  dt-bindings: soc: update MT2712 power dt-bindings
  soc: mediatek: update power domain data of MT2712
  dt-bindings: clock: add clocks for MT2712
  arm64: dts: add clock device nodes of MT2712
  clk: mediatek: update clock driver of MT2712

 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 28 +++++++++++++
 drivers/clk/mediatek/clk-mt2712.c         | 69 ++++++++++++++++++++++++-------
 drivers/soc/mediatek/mtk-scpsys.c         | 42 ++++++++++++++++++-
 include/dt-bindings/clock/mt2712-clk.h    | 12 +++++-
 include/dt-bindings/power/mt2712-power.h  |  3 ++
 5 files changed, 136 insertions(+), 18 deletions(-)

-- 
2.12.5
