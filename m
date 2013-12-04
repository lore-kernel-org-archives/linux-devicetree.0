From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] Calxeda arm64 clock updates
Date: Wed,  4 Dec 2013 17:35:20 -0600
Message-ID: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

This series updates the highbank clock code for ECX-3000 series support.     
The primary functional change is making the PLL max frequency a runtime
setting. The rest of the changes are enabling building on arm64 and new
DT bindings.

The patch "clk: highbank: prevent glitching when going into bypass mode"
is a fix needed for ECX-2000 systems and should be applied for 3.13 and
stable.

Rob

Mark Langsdorf (1):
  clk: highbank: prevent glitching when going into bypass mode

Rob Herring (6):
  dt-bindings: add Calxeda ECX-3000 clock binding
  dt-bindings: Add property calxeda,pll-max-hz for Calxeda clocks
  dt-bindings: Add Calxeda system registers binding
  clk: highbank: allow for different PLL frequency range
  clk: highbank: allow enabling by user
  clk: highbank: add DT match for calxeda,ecx-3000-sregs

 .../devicetree/bindings/arm/calxeda/sregs.txt      | 17 +++++++++
 .../devicetree/bindings/clock/calxeda.txt          |  9 ++++-
 arch/arm/mach-highbank/Kconfig                     |  1 +
 drivers/clk/Kconfig                                |  5 +++
 drivers/clk/Makefile                               |  2 +-
 drivers/clk/clk-highbank.c                         | 43 +++++++++++++++-------
 6 files changed, 61 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda/sregs.txt

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
