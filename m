From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/6] arm: Add basic support for Mediatek Cortex-A7 SoCs
Date: Fri, 30 May 2014 18:55:58 +0200
Message-ID: <1401468964-5307-1-git-send-email-matthias.bgg@gmail.com>
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
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, linux-doc@vger.kernel.org, gregory.clement@free-electrons.com, thierry.reding@gmail.com, heiko.stuebner@bq.com, linux@arm.linux.org.uk, arnd@arndb.de, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, florian.vaussard@epfl.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, robh+dt@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, soren.brinkmann@xilinx.com, rdunlap@infradead.org, sboyd@codeaurora.org, silvio.fricke@gmail.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

Sixth round for the Mediatek basic support patches.

I encapsulated the setup of the timer and the interrupt in seperate
functions.
Apart I fixed the compatibily string to be consisten throughout the
whole system (from mediatek,mtk6577 to mediatek,mt6577) and added
the address to the bindings documentation.

---
This patch set adds basic support for the Mediatek Cortex-A7 SoCs.
Support is quite basic, as the only component working up to now are the
timers.

The patch series is build against torvalds/master tree.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Changes for v6:
- fix compatible string of the timer
- encapsulate timer setup in function
- add more information to the timer commit message
- add address in timer DTS bindings documentation


Changes for v5:
1. Clocksource timer
- Change the compatible string to mt6577

2. Timer DT bindings
- Change compatible string to mt6577


Changes for v4:
1. Clocksource timer
- use cpu_possible_mask

2. Timer DT bindings
- Delete comments about the frequency of the clocks
- Add clock-names for the input clocks

3. Basic SoC support
- add clock-names for the timer
- rename the label of the clocks nodes


Changes for v3:
1. Clocksource timer
- Set cpu_mask_all and irq in clock_event_device
- Use device private structure for driver specific values

2. Timer DT bindings
- Define order of the clock phandles
- Fix typos

3. Basic SoC support
- DTS: set gic to a15-gic
- DTS: order by physical address
- Remove call to dt_init function


Changes for v2:
1. Clocksource timer
- Delete unused parts for sched_clock_source
- Use irq_request instead of setup_irq
- Remove unused SMP parts
- Fix some style issues
- use of_address_to resource and request_mem_region
- delete use of named clock
- select CLKSRC_MMIO in driver Kconfig

2. DT bindings
- delete named clock bindings

3. Basic SoC support
- Clean-up Kconfig
- Add documentation of the SoC compatible property 
- DTS: rename SoC file to mt6589.dts
- DTS: Delete not present cache controller
- DTS: Add missing GICv2 properties
- DTS: Change clock names
- DTS: Add Aquaris5 board

4. Add earlyprintk
- patch droped until serial driver is available

5. Add support for Aquaris5 mobile phone



Matthias Brugger (6):
  clocksource: Add support for the Mediatek SoCs
  dt-bindings: add mtk-timer bindings
  vendor-prefixes: add prefix for Mediaktek Inc.
  arm: add basic support for Mediatek MT6589 boards
  dt-bindings: add documentation for Mediatek SoC
  arm: mediatek: add dts for Aquaris5 mobile phone

 .../devicetree/bindings/arm/mediatek-mt65xx.txt    |    8 +
 .../bindings/timer/mediatek,mtk-timer.txt          |   18 ++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/Kconfig                                   |    2 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/mt6589-aquaris5.dts              |   25 ++
 arch/arm/boot/dts/mt6589.dtsi                      |   94 ++++++++
 arch/arm/mach-mediatek/Kconfig                     |    6 +
 arch/arm/mach-mediatek/Makefile                    |    1 +
 arch/arm/mach-mediatek/mediatek.c                  |   27 +++
 drivers/clocksource/Kconfig                        |    4 +
 drivers/clocksource/Makefile                       |    1 +
 drivers/clocksource/mtk_timer.c                    |  242 ++++++++++++++++++++
 13 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek-mt65xx.txt
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
 create mode 100644 arch/arm/boot/dts/mt6589-aquaris5.dts
 create mode 100644 arch/arm/boot/dts/mt6589.dtsi
 create mode 100644 arch/arm/mach-mediatek/Kconfig
 create mode 100644 arch/arm/mach-mediatek/Makefile
 create mode 100644 arch/arm/mach-mediatek/mediatek.c
 create mode 100644 drivers/clocksource/mtk_timer.c

-- 
1.7.9.5
