From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/5] ARM: dts: rcar-gen2: Convert to new CPG/MSSR bindings
Date: Fri, 19 May 2017 11:03:15 +0200
Message-ID: <1495184600-22745-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

Currently Renesas R-Car Gen2 SoCs use the common clk-rcar-gen2,
clk-mstp, and clk-div6 drivers, which depend on most clocks being
described in DT.  Especially the module (MSTP) clocks are cumbersome and
error prone, due to 3 arrays (clocks, clock-indices, and
clock-output-names) to be kept in sync. In addition, the clk-mstp driver
cannot be extended easily to also support module resets, which are
provided by the same hardware module.

Hence when developing support for R-Car Gen3 SoCs, another approach was
chosen, which led to the CPG/MSSR driver core, and SoC-specific
subdrivers (initially for R-Car Gen3, but later also for RZ/G1).

This series complements the series "[PATCH v2 00/10] clk: renesas:
rcar-gen2: Add new CPG/MSSR drivers", and converts the various R-Car
Gen2 DTSes to migrate to the new CPG/MSSR drivers.

Note that module reset descriptions will be added later.

Dependencies:
  - This has a hard dependency on "[PATCH v2 00/10] clk: renesas:
    rcar-gen2: Add new CPG/MSSR drivers", which is planned to be queued
    for v4.13.
    Hence this series must _not_ be applied before v4.13-rc1!
  - To avoid a small but harmless regression (Ethernet PHY falling back
    to polling instead of using its IRQ), "of_mdio: Fix broken PHY IRQ
    in case of probe deferral" should be applied first.

For testing, this patch series, incl. all dependencies, are available in
the topic/rcar2-cpg-mssr-v2 branch of my renesas-drivers git repository
at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

This has been tested on r8a7790/lager, r8a7791/koelsch, r8a7792/blanche,
r8a7793/gose, and r8a7794/alt.  /sys/kernel/debug/clk/clk_summary has
been compared before and after the conversion.

Thanks!

Geert Uytterhoeven (5):
  ARM: dts: r8a7790: Convert to new CPG/MSSR bindings
  ARM: dts: r8a7791: Convert to new CPG/MSSR bindings
  ARM: dts: r8a7792: Convert to new CPG/MSSR bindings
  ARM: dts: r8a7793: Convert to new CPG/MSSR bindings
  ARM: dts: r8a7794: Convert to new CPG/MSSR bindings

 arch/arm/boot/dts/r8a7790-lager.dts   |   7 +-
 arch/arm/boot/dts/r8a7790.dtsi        | 557 ++++++----------------------------
 arch/arm/boot/dts/r8a7791-koelsch.dts |   4 +-
 arch/arm/boot/dts/r8a7791-porter.dts  |   4 +-
 arch/arm/boot/dts/r8a7791.dtsi        | 557 +++++++---------------------------
 arch/arm/boot/dts/r8a7792-blanche.dts |   3 +-
 arch/arm/boot/dts/r8a7792-wheat.dts   |   3 +-
 arch/arm/boot/dts/r8a7792.dtsi        | 333 ++++----------------
 arch/arm/boot/dts/r8a7793-gose.dts    |   4 +-
 arch/arm/boot/dts/r8a7793.dtsi        | 459 +++++-----------------------
 arch/arm/boot/dts/r8a7794-alt.dts     |   3 +-
 arch/arm/boot/dts/r8a7794-silk.dts    |   3 +-
 arch/arm/boot/dts/r8a7794.dtsi        | 528 +++++---------------------------
 13 files changed, 430 insertions(+), 2035 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
