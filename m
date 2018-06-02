Return-Path: <SRS0=PCtB=IU=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 0/2] clk: Add driver for MAX9485
Date: Sat,  2 Jun 2018 13:15:29 +0200
Message-Id: <20180602111531.32143-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This is v3 of the driver for Maxim's MAX9485 programmable audio clock
generator.

v2 → v3:

* Addressed a lot of issues pointed out by Stephen Boyd:
  * Dropped local register caching
  * Implement own OF clk_hw getter in favor of the onecell helper
  * Implemented recalc_rate() properly by reading from the hardware
  * Dropped input clock frequency validation
  * Style issues

* Fixed a gpio line handling bug in resume
* Added Rob's Revied-by to 1/2

v1 → v2:

* Now served as two patches, one for the DT bits, and one for the actual
  implementation. The DT bits are put in the 1st patch because the
  implementation depends on the shared header file.

* Added support for suspend/resume

Daniel Mack (2):
  dts: clk: add devicetree bindings for MAX9485
  clk: Add driver for MAX9485

 .../devicetree/bindings/clock/maxim,max9485.txt    |  59 +++
 drivers/clk/Kconfig                                |   6 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-max9485.c                          | 402 +++++++++++++++++++++
 include/dt-bindings/clock/maxim,max9485.h          |  18 +
 5 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
 create mode 100644 drivers/clk/clk-max9485.c
 create mode 100644 include/dt-bindings/clock/maxim,max9485.h

-- 
2.14.3
