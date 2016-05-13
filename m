From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v11 0/3] PIC32MZDA Clock Driver
Date: Fri, 13 May 2016 13:22:38 +0530
Message-ID: <1463125961-10706-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Sandeep Sheriker <sandeepsheriker.mallikarjun-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Clock bindings got acked and then essentially unacked, while the clock
driver never made it upstream. In the meantime, the initial DTS file
made it upstream. This latest patch series includes a patch to go back
and correct the DTS files to reflect the new clock bindings in this
patch series.

Note: Please pull this complete series through the MIPS tree.

Purna Chandra Mandal (3):
  dt/bindings/clk: Add PIC32 clock binding documentation.
  clk: microchip: Add Microchip PIC32 clock driver.
  MIPS: dts: pic32: Update dts to reflect new PIC32MZDA clk binding

 .../devicetree/bindings/clock/microchip,pic32.txt  |   39 +
 arch/mips/boot/dts/pic32/pic32mzda-clk.dtsi        |  236 -----
 arch/mips/boot/dts/pic32/pic32mzda.dtsi            |   63 +-
 arch/mips/boot/dts/pic32/pic32mzda_sk.dts          |    5 +-
 drivers/clk/Kconfig                                |    3 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/microchip/Makefile                     |    2 +
 drivers/clk/microchip/clk-core.c                   | 1031 ++++++++++++++++++++
 drivers/clk/microchip/clk-core.h                   |   84 ++
 drivers/clk/microchip/clk-pic32mzda.c              |  275 ++++++
 include/dt-bindings/clock/microchip,pic32-clock.h  |   42 +
 11 files changed, 1522 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
 delete mode 100644 arch/mips/boot/dts/pic32/pic32mzda-clk.dtsi
 create mode 100644 drivers/clk/microchip/Makefile
 create mode 100644 drivers/clk/microchip/clk-core.c
 create mode 100644 drivers/clk/microchip/clk-core.h
 create mode 100644 drivers/clk/microchip/clk-pic32mzda.c
 create mode 100644 include/dt-bindings/clock/microchip,pic32-clock.h

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
