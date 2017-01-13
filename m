From: Guochun Mao <guochun.mao@mediatek.com>
Subject: [PATCH v1 0/2] add nor flash node for mt2701
Date: Fri, 13 Jan 2017 15:13:27 +0800
Message-ID: <1484291609-20195-1-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series based on v4.10-rc2, include MT2701 spinor node and bindings.

Dependent on "Add clock and power domain DT nodes for Mediatek MT2701"[1].

[1] http://lists.infradead.org/pipermail/linux-mediatek/2016-December/007637.html

Guochun Mao (2):
  Documentation: mtk-quadspi: update DT bindings
  arm: dts: mt2701: add nor flash node

 .../devicetree/bindings/mtd/mtk-quadspi.txt        |  4 +++-
 arch/arm/boot/dts/mt2701-evb.dts                   | 25 ++++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi                      | 12 +++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

--
1.8.1.1.dirty
