From: MarkLee <Mark-MC.Lee@mediatek.com>
Subject: [PATCH net,v3 0/2] Update MT7629 to support PHYLINK API
Date: Mon, 14 Oct 2019 15:15:16 +0800
Message-ID: <20191014071518.11923-1-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rene van Dorst <opensource@vdorst.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub Kicinski <jakub.kicinski@netronome.com>, MarkLee <Mark-MC.Lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch set has two goals :
	1. Fix mt7629 GMII mode issue after apply mediatek
	   PHYLINK support patch.
	2. Update mt7629 dts to reflect the latest dt-binding
	   with PHYLINK support.

MarkLee (2):
  net: ethernet: mediatek: Fix MT7629 missing GMII mode support
  arm: dts: mediatek: Update mt7629 dts to reflect the latest dt-binding

 arch/arm/boot/dts/mt7629-rfb.dts            | 13 ++++++++++++-
 arch/arm/boot/dts/mt7629.dtsi               |  2 --
 drivers/net/ethernet/mediatek/mtk_eth_soc.c |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.17.1
