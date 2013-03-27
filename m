From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/11] LVDS Display Bridge support for i.MX
Date: Wed, 27 Mar 2013 18:30:34 +0100
Message-ID: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devel@driverdev.osuosl.org, Fabio Estevam <fabio.estevam@freescale.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de, Martin Fuzzey <mfuzzey@parkeon.com>, Sean Cross <xobs@kosagi.com>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi,

the following patches add support for LVDS displays on
i.MX53 and i.MX6q boards.

The clock patches are needed because the LVDS serial clock
needs to be in lockstep with the IPU display interface clock
providing the pixel data. A fixed factor of 7:1 (or 3.5:1 in
dual link mode) needs to be maintained. This is achieved on
i.MX by clocking the LDB DI clock directly from a PLL, and
manually setting the 3.5/7:1 divider depending on dual/single
link mode. The IPU display interface clock is then sourced
from the divided LDB clock.

Changes since v1:
 - Added device-tree bindings documentation
 - Dropped remains of GPIO handling from LDB driver, sorry about that

regards
Philipp

---
 .../devicetree/bindings/staging/imx-drm/ldb.txt    |  99 ++++
 arch/arm/boot/dts/imx51.dtsi                       |   2 +
 arch/arm/boot/dts/imx53.dtsi                       |  34 ++
 arch/arm/boot/dts/imx6q.dtsi                       |  17 +
 arch/arm/boot/dts/imx6qdl.dtsi                     |  26 +
 arch/arm/mach-imx/clk-imx51-imx53.c                |  19 +-
 arch/arm/mach-imx/clk-imx6q.c                      |  43 +-
 arch/arm/mach-imx/clk.h                            |  17 +
 arch/arm/mach-imx/common.h                         |   1 +
 arch/arm/mach-imx/mach-imx6q.c                     |   2 +-
 drivers/staging/imx-drm/Kconfig                    |   7 +
 drivers/staging/imx-drm/Makefile                   |   1 +
 drivers/staging/imx-drm/imx-ldb.c                  | 611 +++++++++++++++++++++
 13 files changed, 854 insertions(+), 25 deletions(-)
