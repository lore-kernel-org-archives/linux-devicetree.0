From: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: [PATCH v3 0/2] clk: renesas: r9a06g032: Add clock domain support
Date: Fri, 24 May 2019 16:31:42 +0100
Message-ID: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Phil Edworthy <phil.edworthy@renesas.com>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There are several clocks on the r9ag032 which are currently not enabled
in their drivers that can be delegated to clock domain system for power
management. Therefore add support for clock domain functionality to the
r9a06g032 clock driver after updating the relevant dt-bindings file.

Gareth Williams (2):
  dt-bindings: clock: renesas,r9a06g032-sysctrl: Document power Domains
  clk: renesas: r9a06g032: Add clock domain support

 .../bindings/clock/renesas,r9a06g032-sysctrl.txt   |   3 +
 drivers/clk/renesas/r9a06g032-clocks.c             | 229 ++++++++++++++-------
 2 files changed, 163 insertions(+), 69 deletions(-)

-- 
2.7.4
