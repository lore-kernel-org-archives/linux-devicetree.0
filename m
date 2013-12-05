From: Nishanth Menon <nm@ti.com>
Subject: [PATCH V2 0/2] ARM: OMAP2+/dts: standardize SoC naming
Date: Wed, 4 Dec 2013 18:49:35 -0600
Message-ID: <1386204578-6018-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Tony Lindgren <tony@atomide.com>, Benoit Cousson <bcousson@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

Originally attempted partially in [1], the missing binding were
reported as part of Rob's report in [2].

So, here is take two of the series, lacking an standard causes issues
that was fixed such as [3]. Ideally, we should never again introduce a
board file without a exact compatible SoC match.

I have stayed a bit away from updating board and SoC dts files yet
to look at the direction we'd like to go here. If we feel things are
good, I would gladly try to clean our mess up.

Nishanth Menon (2):
  Documentation: dt: OMAP: explicitly state SoC compatible strings
  ARM: OMAP2+: board-generic: update SoC compatibility strings

 .../devicetree/bindings/arm/omap/omap.txt          |   53 ++++++++++++++++++++
 arch/arm/mach-omap2/board-generic.c                |    7 +++
 2 files changed, 60 insertions(+)

[1] https://patchwork.kernel.org/patch/2998201/
[2] http://marc.info/?l=linux-arm-kernel&m=138378029113665&w=2
[3] https://patchwork.kernel.org/patch/3279281/

-- 
1.7.9.5

