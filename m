From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH 0/2] Add MT8173 MMPLL change rate support
Date: Wed, 8 Jul 2015 16:37:44 +0800
Message-ID: <1436344666-25645-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>
Cc: srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

MT8173 MMPLL frequency settings are different from common PLLs.
It needs different post divider settings for some ranges of frequency.
This patch add support for MT8173 MMPLL frequency setting, includes:

1. Add div-rate table for PLLs.
2. Increase the max ost divider setting from 3 (/8) to 4 (/16).
3. Write postdiv and pcw settings at the same time.

James Liao (2):
  clk: mediatek: Fix PLL registers setting flow
  clk: mediatek: Add MT8173 MMPLL change rate support

 drivers/clk/mediatek/clk-mt8173.c | 24 +++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h    |  6 ++++++
 drivers/clk/mediatek/clk-pll.c    | 39 +++++++++++++++++++++++++++------------
 3 files changed, 54 insertions(+), 15 deletions(-)

--
1.8.1.1.dirty
