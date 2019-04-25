Return-Path: <SRS0=K8Ad=S3=socionext.com=sugaya.taichi@kernel.org>
From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v3 0/3] Add clk controller for Milbeaut M10V
Date: Thu, 25 Apr 2019 19:40:59 +0900
Message-Id: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Sugaya Taichi <sugaya.taichi@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Here is the version 3 of Milbeaut M10V clk controller. Previous
versions are here.

v2:
 - driver [1]
 - binding [2]
v1:
 - driver [3]
 - binding [4]

[1] https://lore.kernel.org/lkml/1549628837-31574-1-git-send-email-sugaya.taichi@socionext.com/
[2] https://lore.kernel.org/lkml/1549628823-31388-1-git-send-email-sugaya.taichi@socionext.com/
[3] https://lore.kernel.org/linux-arm-kernel/1542589274-13878-8-git-send-email-sugaya.taichi@socionext.com/
[4] https://lore.kernel.org/linux-arm-kernel/1542589274-13878-7-git-send-email-sugaya.taichi@socionext.com/

changes from v2:
 - Fix commit subject.
 - Insert a line between structs.
 - Insert a line between for-loops.
 - Use readl() function instead of clk_readl().
 - Drop unused callback struct.
 - Make internal function for readability.
 - Convert the binding to yaml.

changes from v1:
 - Refine whole of clk driver.


Sugaya Taichi (3):
  dt-bindings: clock: milbeaut: add Milbeaut clock description
  clock: milbeaut: Add Milbeaut M10V clock controller
  ARM: dts: milbeaut: Add a clk node for Milbeaut M10V

 .../devicetree/bindings/clock/milbeaut-clock.yaml  |  73 +++
 arch/arm/boot/dts/milbeaut-m10v.dtsi               |   7 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-milbeaut.c                         | 663 +++++++++++++++++++++
 4 files changed, 744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/milbeaut-clock.yaml
 create mode 100644 drivers/clk/clk-milbeaut.c

-- 
1.9.1
