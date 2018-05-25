Return-Path: <SRS0=uOBc=IM=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 0/2] clk: Add driver for MAX9485
Date: Fri, 25 May 2018 20:20:56 +0200
Message-Id: <20180525182058.25969-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This is v2 of the driver for Maxim's MAX9485 programmable audio clock
generator.

v1 → v2:

* Now served as two patches, one for the DT bits, and one for the actual
  implementation. The DT bits are put in the 1st patch because the
  implementation depends on the shared header file.

* Added support for suspend/resume


Daniel Mack (2):
  dts: clk: add devicetree bindings for MAX9485
  clk: Add driver for MAX9485

 .../devicetree/bindings/clock/maxim,max9485.txt    |  59 +++
 drivers/clk/Kconfig                                |   8 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-max9485.c                          | 408 +++++++++++++++++++++
 include/dt-bindings/clock/maxim,max9485.h          |  18 +
 5 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max9485.txt
 create mode 100644 drivers/clk/clk-max9485.c
 create mode 100644 include/dt-bindings/clock/maxim,max9485.h

-- 
2.14.3
