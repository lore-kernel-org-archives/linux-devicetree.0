From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v3 0/6] arm64: berlin: add pinctrl support
Date: Fri, 9 Oct 2015 14:51:56 +0800
Message-ID: <1444373522-2119-1-git-send-email-jszhang@marvell.com>
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
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>, linux-gpio@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds support for Marvell berlin4ct pin-controller, allowing
to configure the pin muxing from the device tree.

Since v2:
 - introduce new berlin_pinctrl_probe_regmap() to avoid duplicated code
 - renaming such as s/urt/uart etc. but keep the group name as URT* to keep
   consistent with HW/ASIC

Since v1:
 - use generic name for pin functions
 - a new commit to add pinmux for uart0
 - correct pinctrl usage in dts


Jisheng Zhang (6):
  pinctrl: berlin: introduce berlin_pinctrl_probe_regmap()
  pinctrl: berlin: add the berlin4ct pinctrl driver
  arm64: berlin: add the pinctrl dependency for Marvell Berlin SoCs
  pinctrl: dt-binding: document berlin4ct SoC pinctrl
  arm64: dts: berlin4ct: add the pinctrl node
  arm64: dts: berlin4ct: add default pinmux for uart0

 .../devicetree/bindings/pinctrl/berlin,pinctrl.txt |   5 +-
 arch/arm64/Kconfig.platforms                       |   1 +
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi         |  22 +
 drivers/pinctrl/berlin/Kconfig                     |   5 +
 drivers/pinctrl/berlin/Makefile                    |   1 +
 drivers/pinctrl/berlin/berlin-bg4ct.c              | 503 +++++++++++++++++++++
 drivers/pinctrl/berlin/berlin.c                    |  26 +-
 drivers/pinctrl/berlin/berlin.h                    |   4 +
 8 files changed, 557 insertions(+), 10 deletions(-)
 create mode 100644 drivers/pinctrl/berlin/berlin-bg4ct.c

-- 
2.6.1
