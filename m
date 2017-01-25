From: Guochun Mao <guochun.mao@mediatek.com>
Subject: [PATCH v2 0/2] addr nor flash node for mt2701
Date: Wed, 25 Jan 2017 11:38:33 +0800
Message-ID: <1485315515-29942-1-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, John Crispin <john@phrozen.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update DT bindings, clarify compatible strings that mt2701-nor node should contain. 
This patch series based on v4.10-rc2, include MT2701 spi nor node.
Dependent on "Add clock and power domain DT nodes for Mediatek MT2701"
[1] http://lists.infradead.org/pipermail/linux-mediatek/2016-December/007637.html

Guochun Mao (2):
  Documentation: mtk-quadspi: update DT bindings
  arm: dts: mt2701: add nor flash node

 .../devicetree/bindings/mtd/mtk-quadspi.txt        |  8 ++++++-
 arch/arm/boot/dts/mt2701-evb.dts                   | 25 ++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi                      | 12 +++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

-- 
1.8.1.1.dirty
