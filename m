From: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v4 0/2] clk: renesas: r9a06g032: Add clock domain support
Date: Tue, 28 May 2019 12:54:25 +0100
Message-ID: <1559044467-2639-1-git-send-email-gareth.williams.jx@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There are several clocks on the r9a06g032 which are currently not enabled
in their drivers that can be delegated to clock domain system for power
management. Therefore add support for clock domain functionality to the
r9a06g032 clock driver after updating the relevant dt-bindings file.

v4:
 - Removed unneeded initialisation of "error" in 
   create_add_module_clock.
 - Moved declaration of "index" to the start of r9a06g032_attach_dev.
 - Moved of_node_put(clkspec.np) call to after create_add_module_clock
   call in r9a06g032_attach_dev.
 - Added missing HCLK to UART0 example to show the clock added
   to the driver.
v3:
 - "managed" flag integrated into existing bit field.
 - Removed unneeded initialisation inside D_MODULE.
 - Removed the use of unneeded r9a06g032_clk_domain variable.
 - Removed error message prints that cannot occur.
 - Removed __init and __initconst from attach function and
   r9a06g032_clocks[].
 - Reordered r9a06g032_add_clk_domain call to after 
   devm_add_action_or_reset during probe.
 - Added clock type check when retrieving clocks from device tree.
 - Reordered of_node_put call to before error check in
   create_add_module_clock.
 - changed r9a06g032_detach_dev to a static function.
 - Added new #power-domain-cells property to the required properties.
 - Added "#power-domain-cells" and "power-domains" lines to examples.
v2:
 - Rebased onto kernel/git/geert/renesas-drivers.git

Gareth Williams (2):
  dt-bindings: clock: renesas,r9a06g032-sysctrl: Document power Domains
  clk: renesas: r9a06g032: Add clock domain support

 .../bindings/clock/renesas,r9a06g032-sysctrl.txt   |   7 +-
 drivers/clk/renesas/r9a06g032-clocks.c             | 230 ++++++++++++++-------
 2 files changed, 166 insertions(+), 71 deletions(-)

-- 
2.7.4
