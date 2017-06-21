From: <sean.wang@mediatek.com>
Subject: [PATCH 0/2] fixed ethernet binding violation for reset signal
Date: Wed, 21 Jun 2017 15:49:50 +0800
Message-ID: <cover.1498030300.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Fixed binding violation and also updated related binding documentation to
reflect the reset signals the MediaTek Ethernet requires.

Sean Wang (2):
  dt-bindings: net: mediatek: update documentation for reset signals
  arm: dts: mt7623: fixup binding violation missing reset in ethernet
    node

 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++--
 arch/arm/boot/dts/mt7623.dtsi                          | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.7.4
