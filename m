From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH RESEND v5 0/5] ARM: rockchip: add smp functionality
Date: Tue, 22 Oct 2013 17:24:21 +0200
Message-ID: <201310221724.21550.heiko@sntech.de>
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
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Matt Sealey <neko@bakuhatsu.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, arm@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Fabio Estevam <festevam@gmail.com>, Ulrich Prinz <ulrich.prinz@googlemail.com>
List-Id: devicetree@vger.kernel.org

This series enables the use of the additional cores on Rockchip
Cortex-A9 SoCs.

To achieve this, add the scu, the needed sram and power-management-unit.

Tested on both a BQ Curie2 (rk3066a / dual core) and
on a Radxa Rock (rk3188 / quad core).

changes since v4:
- rebase on top of the recent rk3188 board support
- implement suggestion from Matt Sealey in moving the sram-limit from
  marking reserved regions to marking available regions - hopefully
  I got the usage right :-)
- remove __CPUINIT as suggested by Fabio Estevam

changes since v3:
- address comments from Rob Herring:
  - split the gathering of the reserve-data into a separate loop
  - spelling and style fixes
- first patch only included for reference, already part of the
  char-misc git tree

changes since v2:
- rework the sram allocation following the suggestion from Philipp Zabel

changes since v1:
- add reserved block feature for mmio-sram, to not use two logical
  sram nodes
- the sram content is kept intact while the device is running, so
  copying the trampoline is only needed once

Heiko Stuebner (5):
  misc: sram: add ability to limit used sram areas
  ARM: rockchip: add snoop-control-unit
  ARM: rockchip: add sram dt nodes and documentation
  ARM: rockchip: add power-management-unit dt node
  ARM: rockchip: add smp bringup code

 .../devicetree/bindings/arm/rockchip/pmu.txt       |   16 ++
 .../devicetree/bindings/arm/rockchip/smp-sram.txt  |   24 +++
 Documentation/devicetree/bindings/misc/sram.txt    |    8 +
 arch/arm/boot/dts/rk3066a.dtsi                     |    6 +
 arch/arm/boot/dts/rk3188.dtsi                      |    6 +
 arch/arm/boot/dts/rk3xxx.dtsi                      |   10 +
 arch/arm/mach-rockchip/Kconfig                     |    1 +
 arch/arm/mach-rockchip/Makefile                    |    1 +
 arch/arm/mach-rockchip/core.h                      |   22 +++
 arch/arm/mach-rockchip/headsmp.S                   |   30 ++++
 arch/arm/mach-rockchip/platsmp.c                   |  195 ++++++++++++++++++++
 arch/arm/mach-rockchip/rockchip.c                  |    2 +
 drivers/misc/sram.c                                |   51 ++++-
 13 files changed, 368 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/pmu.txt
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
 create mode 100644 arch/arm/mach-rockchip/core.h
 create mode 100644 arch/arm/mach-rockchip/headsmp.S
 create mode 100644 arch/arm/mach-rockchip/platsmp.c

-- 
1.7.10.4
