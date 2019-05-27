Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 00/10] input: touchscreen: stmpe: ext. features
Date: Mon, 27 May 2019 18:07:26 +0200
Message-ID: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

This set of patches implements various features suppported by the STMPE811
touchscreen controller. It integrates certain properties to facilitate the
operation/integration with kernel provided interfaces/properties and userland
libraries, such as libinput.

Based on Linus' v5.2-rc2

Leif Middelschulte (10):
  dt-bindings: input: touchscreen: stmpe: add touch window configuration
  Input: stmpe-ts - implement touch window configuration support
  dt-bindings: input: touchscreen: stmpe: add resolution support
  Input: stmpe-ts - implement resolution support
  dt-bindings: input: touchscreen: stmpe: add XY mode
  Input: stmpe-ts - implement XY acquisition mode
  dt-bindings: input: touchscreen: stmpe: add axes inversion and swap
  Input: stmpe-ts - axes inversion and swapping
  dt-bindings: input: touchscreen: stmpe: add tracking index
  Input: stmpe-ts - implement tracking index

 .../bindings/input/touchscreen/stmpe.txt      |  35 ++++
 drivers/input/touchscreen/stmpe-ts.c          | 161 ++++++++++++++++--
 include/linux/mfd/stmpe.h                     |   1 +
 3 files changed, 185 insertions(+), 12 deletions(-)

-- 
2.21.0
