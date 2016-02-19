From: Joshua Henderson <joshua.henderson@microchip.com>
Subject: [PATCH v7 0/3] PIC32MZDA Clock Driver
Date: Fri, 19 Feb 2016 09:25:33 -0700
Message-ID: <1455899179-14097-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, Joshua Henderson <joshua.henderson@microchip.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Paul Thacker <paul.thacker@microchip.com>, Purna Chandra Mandal <purna.mandal@microchip.com>, Sandeep Sheriker <sandeepsheriker.mallikarjun@microchip.com>
List-Id: devicetree@vger.kernel.org

Clock bindings got acked and then essentially unacked, while the clock
driver never made it upstream. In the meantime, the initial DTS file
made it upstream. This latest patch series includes a patch to go back
and correct the DTS files to reflect the new clock bindings in this
patch series.

Purna Chandra Mandal (3):
  dt/bindings: Add PIC32 clock binding documentation
  clk: clk-pic32: Add PIC32 clock driver
  MIPS: dts: pic32: Update dts to reflect new PIC32MZDA clk binding

 .../devicetree/bindings/clock/microchip,pic32.txt  |   39 +
 arch/mips/boot/dts/pic32/pic32mzda-clk.dtsi        |  236 -----
 arch/mips/boot/dts/pic32/pic32mzda.dtsi            |   63 +-
 arch/mips/boot/dts/pic32/pic32mzda_sk.dts          |    5 +-
 drivers/clk/Kconfig                                |    3 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/microchip/Makefile                     |    2 +
 drivers/clk/microchip/clk-core.c                   |  955 ++++++++++++++++++++
 drivers/clk/microchip/clk-core.h                   |   78 ++
 drivers/clk/microchip/clk-pic32mzda.c              |  214 +++++
 include/dt-bindings/clock/microchip,pic32-clock.h  |   42 +
 11 files changed, 1379 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
 delete mode 100644 arch/mips/boot/dts/pic32/pic32mzda-clk.dtsi
 create mode 100644 drivers/clk/microchip/Makefile
 create mode 100644 drivers/clk/microchip/clk-core.c
 create mode 100644 drivers/clk/microchip/clk-core.h
 create mode 100644 drivers/clk/microchip/clk-pic32mzda.c
 create mode 100644 include/dt-bindings/clock/microchip,pic32-clock.h

--
1.7.9.5

