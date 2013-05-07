From: Valentin Longchamp <valentin.longchamp@keymile.com>
Subject: [RFC PATCH] Alternative clk gate ctrl for Kirkwood variants
Date: Tue,  7 May 2013 17:52:18 +0200
Message-ID: <1367941941-19152-1-git-send-email-valentin.longchamp@keymile.com>
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
To: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, jason@lakedaemon.net
Cc: gregory.clement@free-electrons.com, Valentin Longchamp <valentin.longchamp@keymile.com>, devicetree-discuss@lists.ozlabs.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

This series introduces a clk gate ctrl for the kirkwood variants embedded in the
Prestera SoCs.

This would allow to get rid of the workaround for the km_kirkwood board support
file that was added previously because of the lack of DT clk gate support.

Valentin Longchamp (3):
  clk: mvebu: add gate ctrl for Prestera kirkwood variants
  ARM: kirkwood: look for alternative gate ctrl of node
  ARM: kirkwood: remove clock gating disabling for km_kirkwood

 .../devicetree/bindings/clock/mvebu-gated-clock.txt   | 17 +++++++++++++++++
 arch/arm/boot/dts/kirkwood-98dx4122.dtsi              |  7 +++++++
 arch/arm/mach-kirkwood/board-dt.c                     |  4 ++++
 arch/arm/mach-kirkwood/board-km_kirkwood.c            | 15 ---------------
 drivers/clk/mvebu/clk-gating-ctrl.c                   | 19 +++++++++++++++++++
 5 files changed, 47 insertions(+), 15 deletions(-)

-- 
1.8.0.1
