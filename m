From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [resend PATCH v1 0/2] update Mediatek MT2712 clock
Date: Fri, 14 Dec 2018 10:04:15 +0800
Message-ID: <20181214020417.2871-2-weiyi.lu@mediatek.com>
References: <20181214020417.2871-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214020417.2871-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

This series is based on v4.20-rc1.
Basically, this series is for the 3rd ECO design change of MT2712.

Weiyi Lu (2):
  dt-bindings: clock: add clock for MT2712
  clk: mediatek: update clock driver of MT2712

 drivers/clk/mediatek/clk-mt2712.c      | 8 ++++++--
 include/dt-bindings/clock/mt2712-clk.h | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.18.0
