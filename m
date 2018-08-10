From: Jian Hu <jian.hu@amlogic.com>
Subject: [PATCH 0/2] clk: meson-g12a: Add AO clock controller driver
Date: Fri, 10 Aug 2018 17:54:26 +0800
Message-ID: <1533894868-85815-1-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a Clock driver for Always-On part of
the Amlogic Meson-G12A SoC.

-The patch depends on "clk: meson-g12a: Add EE clock controller driver" patch [1]
the parent clock of ao_clk81 is clk81 clock which provided in EE controller driver;
the file of Makefile modify based on EE controller driver patch.

[1]https://lkml.kernel.org/r/1533890858-113020-3-git-send-email-jian.hu@amlogic.com

Jian Hu (2):
  dt-bindings: clk: meson-g12a: Add G12A AO Clock Bindings
  clk: meson-g12a: Add AO Clock controller driver

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   1 +
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/g12a-aoclk.c                     | 170 +++++++++++++++++++++
 drivers/clk/meson/g12a-aoclk.h                     |  36 +++++
 include/dt-bindings/clock/g12a-aoclkc.h            |  28 ++++
 5 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/g12a-aoclk.c
 create mode 100644 drivers/clk/meson/g12a-aoclk.h
 create mode 100755 include/dt-bindings/clock/g12a-aoclkc.h

-- 
1.9.1
